//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Dongik Song on 6/4/24.
//

import UIKit

protocol RegisterVC_Delegate: AnyObject {
    func didSuccessCreateAccount(_ vc: RegisterViewController)
}

class RegisterViewController: UIViewController {

    // MARK: - Properties
    weak var delegate: RegisterVC_Delegate?
    
    var viewModel = RegViewModel()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedText(firstString: "Already Have an account?", secondString: "Login up")
        button.setHeight(50)
        button.addTarget(self, action: #selector(handleAlreadyHaveAccountButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handlePlusButton), for: .touchUpInside)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.setDimensions(height: 140, width: 140)
        button.tintColor = .lightGray
        return button
    }()
    
    private let emailTF = CustomTextField(placeholder: "Email", keyboardType: .emailAddress)
    private let passwordTF = CustomTextField(placeholder: "Password", isSecure: true)
    private let fullnameTF = CustomTextField(placeholder: "Fullname")
    private let usernameTF = CustomTextField(placeholder: "Username")
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.blackButton(buttonText: "Sign Up")
        button.addTarget(self, action: #selector(handleSignUpVC), for: .touchUpInside)
        return button
    }()
    
    private var profileImage: UIImage?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureTextField()
    }
    
    // MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        alreadyHaveAccountButton.centerX(inView: view)
        
        view .addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        
        let stackView = UIStackView(arrangedSubviews: [emailTF, passwordTF, fullnameTF, usernameTF, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: 30)
      
    }
    
    private func configureTextField() {
        emailTF.addTarget(self, action: #selector(handleTextField(sender:)), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(handleTextField(sender:)), for: .editingChanged)
        fullnameTF.addTarget(self, action: #selector(handleTextField(sender:)), for: .editingChanged)
        usernameTF.addTarget(self, action: #selector(handleTextField(sender:)), for: .editingChanged)
    }
    
    @objc func handleAlreadyHaveAccountButton () {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handlePlusButton() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    @objc func handleSignUpVC() {
        guard let email = emailTF.text?.lowercased() else { return }
        guard let password = passwordTF.text else { return }
        guard let usernmae = usernameTF.text?.lowercased() else { return }
        guard let fullname = fullnameTF.text else { return }
        guard let profileImage = profileImage else { return }
        
        let credential = AuthCredential(email: email, password: password, username: usernmae, fullname: fullname, profileImage: profileImage)
        
        showLoader(true)
        AuthServices.registerUser(credential: credential) { error in
            self.showLoader(false)
            if let error = error {
                self.showMessage(title: "Error", message: error.localizedDescription)
                return
            }
            
            self.delegate?.didSuccessCreateAccount(self)
        }
        
        
    }
    
    @objc func handleTextField(sender: UITextField) {
        if sender == emailTF {
            viewModel.email = sender.text
        } else if sender == passwordTF {
            viewModel.password = sender.text
        } else if sender == fullnameTF {
            viewModel.fullname = sender.text
        } else {
            viewModel.username = sender.text
        }
        
        updateForm()
    }
    
    private func updateForm() {
        signUpButton.isEnabled = viewModel.formIsFailed
        signUpButton.backgroundColor = viewModel.backgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        
        self.profileImage = selectedImage
        
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.black.cgColor
        plusPhotoButton.layer.borderWidth = 2
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        dismiss(animated: true)
    }
    
}
