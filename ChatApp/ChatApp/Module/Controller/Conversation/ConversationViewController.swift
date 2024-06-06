//
//  ConversationViewController.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import UIKit
import Firebase

class ConversationViewController: UIViewController {
    
    // MARK: - Properties
    private var user: User
    private let tableView = UITableView()
    private let reuseIdentifier = "ConversationTableViewCell"
    
    // MARK: - Lifecycle
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureUI()
        configureTableView()
    }
    
    // MARK: - Helpers
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.backgroundColor = .white
        tableView.register(ConversationTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView() // Empty space
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        title = user.fullname
        
        let logoutBarbutton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        let newConversationBarButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handleNewChat))
        
        navigationItem.leftBarButtonItem = logoutBarbutton
        navigationItem.rightBarButtonItem = newConversationBarButton
        
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 15, paddingRight: 15)
    }
    
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true)
        } catch {
            print("Error")
        }
    }
    
    @objc func handleNewChat() {
        let controller = NewChatViewController()
        let nav = UINavigationController(rootViewController: controller)
        present(nav,animated: true)
    }
}

// MARK: - TableView

extension ConversationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ConversationTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ChatViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
