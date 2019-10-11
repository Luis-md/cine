//
//  CriarContaViewController.swift
//  cineApp
//
//  Created by Luis_md on 11/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CriarContaViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func registrarBtn(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: "Deu ruim", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
           
            } else {
                
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                let alert = UIAlertController(title: "Olá!", message: "Deu bom!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
