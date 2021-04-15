//
//  ProfileViewController.swift
//  ContactBook
//
//  Created by Otavio Brito on 09/04/21.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate {
    
    var contact: ContactsFormat!
    
    
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var emailProfile: UILabel!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editContact" {
            let profileController = segue.destination as! EditContactViewController
            profileController.contact = self.contact }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    nameProfile.text = "\(contact.name)"
    emailProfile.text = "\(contact.email)"

    
    
}

        
}
