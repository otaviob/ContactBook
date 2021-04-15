//
//  ResetPasswordViewController.swift
//  ContactBook
//
//  Created by Otavio Brito on 06/04/21.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {

    
    @IBOutlet weak var emailReset: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        
        return alert
    }
    
    
    
    
}
