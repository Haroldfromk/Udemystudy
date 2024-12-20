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
    
    private var conversations: [Message] = []{
        didSet {
            tableView.reloadData()
        }
    }
    
    private var conversationDictionary = [String: Message]()
    
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
        fetchConversations()
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
    
    private func fetchConversations() {
        MessageServices.fetchRecentMessages { conversations in
            conversations.forEach { conversation in
                self.conversationDictionary[conversation.chatPartnerID] = conversation
            }
            
            self.conversations = Array(self.conversationDictionary.values)
        }
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
        controller.delegate = self
        let nav = UINavigationController(rootViewController: controller)
        present(nav,animated: true)
    }
    
    private func openChat(currentUser: User, otherUser: User) {
        let controller = ChatViewController(currentUser: currentUser, otherUser: otherUser)
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - TableView

extension ConversationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ConversationTableViewCell
        
        let conversation = conversations[indexPath.row]
        
        cell.viewModel = MessageViewModel(message: conversation)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let conversation = conversations[indexPath.row]
        
        showLoader(true)
        UserServices.fetchUser(uid: conversation.chatPartnerID) { [self] otherUser in
            showLoader(false)
            openChat(currentUser: user, otherUser: otherUser)
        }
    }
    
}

// MARK: - NewChatViewcontrollerDelegate
extension ConversationViewController: NewChatViewControllerDelegate {
    func controller(_ vc: NewChatViewController, wantChatWithUser otherUser: User) {
        vc.dismiss(animated: true)
        print(otherUser)
        openChat(currentUser: user, otherUser: otherUser)
    }
}
