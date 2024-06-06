//
//  NewChatViewController.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import UIKit
import Firebase

protocol NewChatViewControllerDelegate: AnyObject {
    func controller(_ vc: NewChatViewController, wantChatWithUser otherUser: User)
}

class NewChatViewController: UIViewController {
    
    // MARK: - Properties
    weak var delegate: NewChatViewControllerDelegate?
    private let tableView = UITableView()
    private let reuseIdentifier  = "UserTableViewCell"
    private var users: [User] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - LifeCycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
        fetchUsers()
    }
    
    // MARK: - Helpers
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        tableView.rowHeight = 64
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        title = "Search"
        
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor , right: view.rightAnchor, paddingLeft: 15, paddingRight: 15)
    }
    
    private func fetchUsers() {
        showLoader(true)
        UserServices.fetchUsers { users in
            self.showLoader(false)
            self.users = users
            
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            guard let index = self.users.firstIndex(where: {$0.uid == uid}) else { return }
            self.users.remove(at: index)
        }
    }
}

extension NewChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserTableViewCell
        
        let user = users[indexPath.row]
        cell.viewModel = UserViewModel(user: user)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        delegate?.controller(self, wantChatWithUser: user)
    }
}
