//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        let num = passwordTextfield.text!.count
        
        let alert = UIAlertController(title: "Password is not valid", message: "Must be longer than 6 letters or numbers", preferredStyle: .alert)
        
        print("Password length is : \(num)")
        
        if num < 6 {
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                alert.dismiss(animated: true, completion: nil)}))
        }else{
            
        
        SVProgressHUD.show()
        //TODO: Set up a new user on our Firbase database
        
        //this will do at the background, VC will not freeze
        //once it is completed, will give a callback
        // only gets called once the user creation has completed - callback method
        
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!)
            { (user, error) in
                
                if error != nil {
                    print(error!)
                }else{
                    //success
                    print("Regitration Sucessful!")
                    SVProgressHUD.dismiss()
                    //a method inside a closure, need to add self keyword
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
                
            }
        }
    }
}

    

