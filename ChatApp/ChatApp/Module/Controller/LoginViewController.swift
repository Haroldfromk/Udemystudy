//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Dongik Song on 6/4/24.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    // MARK: - Properties
    var viewModel = LoginViewModel()
    
    private let welcomeLabel = CustomLabel(text: "HEY, WELCOME", textFont: .boldSystemFont(ofSize: 20))
    private let profileImageView = CustomImageView(image: #imageLiteral(resourceName: "profile"), width: 50, height: 50)
    private let emailTF = CustomTextField(placeholder: "Email", keyboardType: .emailAddress)
    private let passwordTF = CustomTextField(placeholder: "Password", isSecure: true)
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.blackButton(buttonText: "Login")
        button.addTarget(self, action: #selector(handleLoginVC), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedText(firstString: "Forget your password?", secondString: "Get Help Signing in")
        button.tintColor = .black
        button.setHeight(50)
        button.titleLabel?.font = .boldSystemFont(ofSize: 19)
        button.addTarget(self, action: #selector(handleForgetPassword), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedText(firstString: "Don't Have an account?", secondString: "Sign up")
        button.setHeight(50)
        button.addTarget(self, action: #selector(handleSignUpButton), for: .touchUpInside)
        return button
    }()
    
    private let contLabel = CustomLabel(text: "or continue with Google", labelColor: .lightGray)
    
    private lazy var googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Google", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.setDimensions(height: 50, width: 150)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 19)
        button.addTarget(self, action: #selector(handleGoogleSignIn), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureForTextField()
    }

    // MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(welcomeLabel)
        welcomeLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        welcomeLabel.centerX(inView: view)
        
        view.addSubview(profileImageView)
        profileImageView.anchor(top: welcomeLabel.bottomAnchor, paddingTop: 20)
        profileImageView.centerX(inView: view)
        
        let stackView = UIStackView(arrangedSubviews: [emailTF, passwordTF, loginButton, forgetPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
        stackView.anchor(top: profileImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: 30)
        
        view.addSubview(signUpButton)
        signUpButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        signUpButton.centerX(inView: view)
        
        view.addSubview(contLabel)
        contLabel.centerX(inView: view, topAnchor: forgetPasswordButton.bottomAnchor, paddingTop: 30)
        
        view.addSubview(googleButton)
        googleButton.centerX(inView: view, topAnchor: contLabel.bottomAnchor, paddingTop: 12)
        
    }
    
    private func configureForTextField() {
        emailTF.addTarget(self, action: #selector(handleTextChanged(sender:)), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(handleTextChanged(sender:)), for: .editingChanged)
    }
    
    
    @objc func handleLoginVC() {
        guard let email = emailTF.text?.lowercased() else { return }
        guard let password = passwordTF.text else { return }
        
        showLoader(true)
        AuthServices.loginUser(withEmail: email, withPassword: password) { result, error in
            self.showLoader(false)
            if let error = error {
                self.showMessage(title: "Error", message: error.localizedDescription)
                return
            }
            self.showLoader(false)
            print("success")
            self.navToConversationVC()
        }
    }
    
    @objc func handleForgetPassword() {
        print("password")
    }
    
    @objc func handleSignUpButton() {
        let controller = RegisterViewController()
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @objc func handleGoogleSignIn() {
        setupGoogle()
    }
    
    @objc func handleTextChanged(sender: UITextField) {
        sender == emailTF ? (viewModel.email = sender.text) : (viewModel.password = sender.text)
        updateForm()
    }
    
    private func updateForm() {
        loginButton.isEnabled = viewModel.formIsFailed
        loginButton.backgroundColor = viewModel.backgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    }
    
    func navToConversationVC() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        showLoader(true)
        UserServices.fetchUser(uid: uid) { user in
            self.showLoader(false)
            let controller = ConversationViewController(user: user)
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
        }
        
    }
}

// MARK: - Reg Delegate
extension LoginViewController: RegisterVC_Delegate {
    func didSuccessCreateAccount(_ vc: RegisterViewController) {
        vc.navigationController?.popViewController(animated: true)
        showLoader(false)
        navToConversationVC()
    }
    
}
