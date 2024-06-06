//
//  ProfileViewController.swift
//  TikTokClone
//
//  Created by Dongik Song on 5/20/24.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutAction(_ sender: Any) {
        Api.User.logOut()
    }
    
}
