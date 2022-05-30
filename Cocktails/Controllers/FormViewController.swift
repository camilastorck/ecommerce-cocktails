//
//  FormViewController.swift
//  Cocktails
//
//  Created by Apple  on 29/05/2022.
//

import UIKit
import Combine

class FormViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repeatedPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
    }
    
}
