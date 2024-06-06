//
//  ViewController.swift
//  TikTokClone
//
//  Created by Dongik Song on 5/19/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        
    }
    
    
    func setupView() {
        loginButton.layer.cornerRadius = 10
        signUpButton.layer.cornerRadius = 10
        googleButton.layer.cornerRadius = 10
        facebookButton.layer.cornerRadius = 10
    }
    
    @IBAction func signUpDidTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func signInDidTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
}

