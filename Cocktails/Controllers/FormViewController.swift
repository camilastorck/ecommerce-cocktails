//
//  FormViewController.swift
//  Cocktails
//
//  Created by Apple on 29/05/2022.
//

import UIKit
import Combine

class FormViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var mirrorPassword: UILabel!
    @IBOutlet var signUpButton: UIButton!
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    private var validToSubmit: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest3($name, $email, $password)
            .map { name, email, password in
                return !name.isEmpty && !email.isEmpty && !password.isEmpty 
            }
            .eraseToAnyPublisher()
    }
    
    private var buttonSubscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSubscriber = validToSubmit
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: signUpButton)
        
        signUpButton.layer.cornerRadius = 10
    }

    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let homeVC = HomeViewController(viewModel: ItemsViewModel())
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    @IBAction func nameChanged(_ sender: UITextField) {
        name = sender.text ?? ""
    }
    
    @IBAction func emailChanged(_ sender: UITextField) {
        email = sender.text ?? ""
    }
    
    @IBAction func passwordChanged(_ sender: UITextField) {
        password = sender.text ?? ""
    }
    
}


