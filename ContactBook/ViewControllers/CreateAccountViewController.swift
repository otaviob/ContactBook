//
//  CreateAccountViewController.swift
//  ContactBook
//
//  Created by Otavio Brito on 05/04/21.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var createEmail: UITextField!
    @IBOutlet weak var createPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    
    
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()

    
    }
    
    @IBAction func register(_ sender: UIButton) {
        
        if createEmail.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: createEmail.text!, password: createPassword.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
        
        
        
        
        
        
        /* let email: String = self.createEmail.text ?? ""
        let password: String = self.createPassword.text ?? ""
        
        
        self.auth?.createUser(withEmail: email, password: password, completion: { (result, error) in
            if error != nil {
                print("Falha ao cadastrar")
            } else {
                print ("Sucesso ao cadastrar")
            }
        
        }) */
    }



