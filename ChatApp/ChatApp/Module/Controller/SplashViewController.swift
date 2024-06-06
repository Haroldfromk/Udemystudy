//
//  SplashViewController.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import UIKit
import Firebase


class SplashViewController: UIViewController {

    // MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser?.uid == nil {
            let controller = LoginViewController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
        } else {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            showLoader(true)
            UserServices.fetchUser(uid: uid) { [self] user in
                self.showLoader(false)
                let controller = ConversationViewController(user: user)
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
            
        }
    }
    


}
