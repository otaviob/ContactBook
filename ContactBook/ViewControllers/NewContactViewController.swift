//
//  NewContactViewController.swift
//  ContactBook
//
//  Created by Otavio Brito on 09/04/21.
//

import Foundation
import UIKit

class NewContactViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newEmail: UITextField!
    
    

    
    override func viewDidLoad() {
        
    }
    // ACTION SAVE CONTACT E INSTACIA VIEW DADOS
    @IBAction func saveContactButton(_ sender: Any) {
        _ = ContactsFormat.addNewContact(name: newName.text!, email: newEmail.text!)
        print(contacts)
        navigationController?.popViewController(animated: true)
    }
}
    
    
    

