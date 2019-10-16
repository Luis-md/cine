//
//  ViewController.swift
//  cineApp
//
//  Created by Luis_md on 10/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import ProgressHUD

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
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }


    @IBAction func loginBtn(_ sender: Any) {
        
        guard let email = self.emailField.text, let password = self.passwordField.text else {
            print("Preencha os campos de email e senha")
            return
        }
    
        ProgressHUD.show()
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            
            print(strongSelf)
            ProgressHUD.dismiss()
            if let error = error {
                print("Erro na aplicacao ->  \(error.localizedDescription)")
            } else {
                let controller = StoryboardScene.ListaFilmes.listaFilmesViewController.instantiate()
                self?.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
    @IBAction func criarConta(_ sender: Any) {
        
        let controller = StoryboardScene.CriarConta.criarContaViewController.instantiate()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

