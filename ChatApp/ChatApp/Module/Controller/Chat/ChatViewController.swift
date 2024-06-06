//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import UIKit

class ChatViewController: UICollectionViewController {
    
    // MARK: - Properties
    private let reuseIdentifier = "ChatCollectionViewCell"
    private var messages: [Message] = []
    
    private lazy var customInputView: CustomInputView = {
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        let iv = CustomInputView(frame: frame)
        iv.delegate = self
        return iv
    }()
    
    private var currentUser: User
    private var otherUser: User
    
    // MARK: - Lifecycle
    init(currentUser: User, otherUser: User) {
        self.currentUser = currentUser
        self.otherUser = otherUser
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchMessages()
    }
    
    override var inputAccessoryView: UIView? {
        get { return customInputView }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // MARK: - Helpers
    private func configureUI() {
        title = otherUser.fullname
        
        collectionView.backgroundColor = .white
        
        collectionView.register(ChatCollectionViewCell.self
                                , forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    private func fetchMessages() {
        MessageServices.fetchMessages(otherUser: otherUser) { messages in
            self.messages = messages
            print(messages)
            self.collectionView.reloadData()
        }
    }
}

extension ChatViewController {
       
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChatCollectionViewCell
        
        let message = messages[indexPath.row]
        cell.viewModel = MessageViewModel(message: message)
        
        return cell
    }
    
    
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 15, left: 0, bottom: 15, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        let cell = ChatCollectionViewCell(frame: frame)
        
        let message = messages[indexPath.row]
        cell.viewModel = MessageViewModel(message: message)
        
        cell.layoutIfNeeded()
        
        let targetSize = CGSize(width: view.frame.width, height: 1000)
        let estimeSize = cell.systemLayoutSizeFitting(targetSize)
        
        return .init(width: view.frame.width, height: estimeSize.height)
    }
}

extension ChatViewController: CustomInputViewDelegate {
    func inputView(_ view: CustomInputView, wantUploadMessage message: String) {
        MessageServices.uploadMessage(message: message, currentUser: currentUser, otherUser: otherUser) { _ in
            
        }
        view.clearTextView()
        collectionView.reloadData()
    }
}
