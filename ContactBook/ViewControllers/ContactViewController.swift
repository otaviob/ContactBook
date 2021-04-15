//
//  ContactViewController.swift
//  ContactBook
//
//  Created by Otavio Brito on 08/04/21.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var contactsView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ContactsFormat.loadSavedContacts()
    
    
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        contactsView.reloadData()
        contacts.sort { (contact1, contact2) -> Bool in
            contact1.name.lowercased() < contact2.name.lowercased()
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            contactsView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showContactsInfo", sender: nil)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .default, reuseIdentifier: "identifier")
        cell.textLabel?.text = contacts[indexPath.row].name
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showContactsInfo" {
            let profileController = segue.destination as! ProfileViewController
            let indexPath = contactsView.indexPathForSelectedRow!
            let selectedContact = contacts[indexPath.row]
            profileController.contact = selectedContact
            
        }
        
    }
    
 
 
    
    
}

    
    
