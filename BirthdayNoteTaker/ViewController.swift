//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Felipe Augusto Correia on 01/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting - as? vs as!
        if let newName = storedName as? String {
            nameLabel.text = newName
        }
        
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = newBirthday
        }
    }

    @IBAction func saveButtonClicked(_ sender: UIButton) {
        
        let name = nameTextField.text
        let birthday = birthdayTextField.text
        
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(birthday, forKey: "birthday")
        
        nameLabel.text = "Name: \(name!)"
        birthdayLabel.text = "Birthday: \(birthday!)"
    }
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
        }
        
    }
    
}

