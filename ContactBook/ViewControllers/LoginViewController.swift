//
//  LoginViewController.swift
//  ContactBook
//
//  Created by Otavio Brito on 06/04/21.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    var auth:Auth?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.auth = Auth.auth()
        

      
        
    }
    
    		// ACTION LOGIN
    @IBAction func loginButton(_ sender: UIButton) {
    
       
        if self.loginEmail.text == "" || self.loginPassword.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        
        } else {
            
            Auth.auth().signIn(withEmail: self.loginEmail.text!, password: self.loginPassword.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    
    
    
    }
    /* AUTHENTIC LOGIN GOOGLE
    @IBAction func emailSend(_ sender: UIButton) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailReset.text!) { (error) in
            if let error = error {
                let alert = Service.createAlertController2(title: "Error", message: error.localizedDescription)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let alert = Service.createAlertController(title: "Hurray", message: "A password reset email has been sent!")
            self.present(alert, animated: true, completion: nil)
        }
        
    } */
 
}
