//
//  ViewController.swift
//  cineApp
//
//  Created by Luis_md on 10/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundChange()
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.btnLogin.layer.cornerRadius = 5
    }

    @IBAction func loginBtn(_ sender: Any) {
        
    }
    
    @IBAction func criarConta(_ sender: Any) {
        
        let controller = StoryboardScene.CriarConta.criarContaViewController.instantiate()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

