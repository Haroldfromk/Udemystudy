//
//  SignInViewController.swift
//  TikTokClone
//
//  Created by Dongik Song on 5/19/24.
//

import UIKit
import ProgressHUD


class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var emailContainerView: UIView!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupemailContainerView()
        setupPasswordTextfield()
        setupView()
        
    }
    
    
    @IBAction func signInDidTapped(_ sender: Any) {
        self.view.endEditing(true)
        self.validateFields()
        self.signIn {
            let scene = UIApplication.shared.connectedScenes.first
            if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                sd.configureInitialViewController()
            }
        } onError: { errorMessage in
            ProgressHUD.failed(errorMessage)
        }
        
    }
    
    
}

extension SignInViewController {
    
    func signIn(onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        ProgressHUD.animate("Loading...")
        Api.User.signIn(email: self.emailTextfield.text!, password: self.passwordTextfield.text!) {
            ProgressHUD.dismiss()
            onSuccess()
        } onError: { errorMessage in
            onError(errorMessage)
        }
    }
    
    func validateFields() {
        guard let email = self.emailTextfield.text, !email.isEmpty else {
            ProgressHUD.failed("Please enter a email")
            return
        }
        guard let password = self.passwordTextfield.text, !password.isEmpty else {
            ProgressHUD.failed("Please enter a password")
            return
        }
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Sign In"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupemailContainerView() {
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 0.8)
        emailContainerView.layer.cornerRadius = 20
        emailContainerView.clipsToBounds = true
        emailTextfield.borderStyle = .none
    }
    
    func setupPasswordTextfield() {
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 0.8)
        passwordContainerView.layer.cornerRadius = 20
        passwordContainerView.clipsToBounds = true
        passwordTextfield.borderStyle = .none
    }
    
    func setupView() {
        signInButton.layer.cornerRadius = 18
    }
    
}
