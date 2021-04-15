//
//  EditContactViewController.swift
//  ContactBook
//
//  Created by Otavio Brito on 09/04/21.
//

import UIKit

class EditContactViewController: UIViewController {

    var contact: ContactsFormat!
    
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editEmail: UITextField!
    
    
   
    @IBAction func saveEditContact(_ sender: Any) {
        _ = ContactsFormat.addNewContact(name: editName.text!,
                                    email: editEmail.text!)
        print(contacts)
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
    super.viewDidLoad()
    
        editName.text = contact.name
        editEmail.text = contact.email
   

    }

}
    


