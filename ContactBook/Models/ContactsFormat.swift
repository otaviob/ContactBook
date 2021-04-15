//
//  ResetPasswordViewController.swift
//  ContactBook
//
//  Created by Otavio Brito on 06/04/21.
//

import Foundation
import UIKit

var contacts = [ContactsFormat]()

class ContactsFormat: NSObject, NSCoding {
    
    var name: String = ""
    var email: String = ""
    
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
       
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as! String
        self.email = coder.decodeObject(forKey: "email") as! String
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(email, forKey: "email")
        
    }
    
    
    
    /* static func loadSampleContacts() -> [ContactsFormat] {
        let contact1 = ContactsFormat(name: "George", lastName: "Bukovski", number: "847-543-5837", photo: nil, notes: "Eye Doctor")
        let contact2 = ContactsFormat(name: "Katie", lastName: "Warshteiner", number: "884-527-1257", photo: nil, notes: "Random girl from a bar")
        let contact3 = ContactsFormat(name: "Bob", lastName: "Walington", number: "", photo: nil, notes: "Truck Driver")
        
        return [contact1, contact2, contact3]
    } */
    
    static func loadSavedContacts() {
        let encodedData = UserDefaults.standard.object(forKey: "contacts") as? Data
//        let contacts = NSKeyedUnarchiver.unarchivedObject(ofClasses: ContactsFormat, from: encodedData)// as? [ContactsFormat]
        if encodedData != nil {
            let local_contacts = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedData!) as? [ContactsFormat]
            contacts = (local_contacts ?? [])
        } else {
            contacts = []
        }
    }
    
    
    static func addNewContact(name: String, email: String) -> ContactsFormat{
        
        let newContact = ContactsFormat(name: name,
                                        email: email)
                
        contacts.append(newContact)
        

        
        
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: contacts)
        UserDefaults.standard.setValue(encodedData, forKeyPath: "contacts")
        UserDefaults.standard.synchronize()
        
        return newContact
        

    }
    
}


