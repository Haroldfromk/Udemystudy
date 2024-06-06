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
    private var messages: [String] = [
        "Here's sample data",
        "this the second line with more than one line",
        "Just wanna add more text for testing or where ever, and thats it for this lessson, Cool"
    ]
    
    private lazy var customInputView: CustomInputView = {
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        let iv = CustomInputView(frame: frame)
        return iv
    }()
    
    // MARK: - Lifecycle
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override var inputAccessoryView: UIView? {
        get { return customInputView }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // MARK: - Helpers
    private func configureUI() {
        collectionView.backgroundColor = .white
        
        collectionView.register(ChatCollectionViewCell.self
                                , forCellWithReuseIdentifier: reuseIdentifier)
    }
}

extension ChatViewController {
       
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChatCollectionViewCell
        
        let text = messages[indexPath.row]
        
        cell.configure(text: text)
        
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
        
        let text = messages[indexPath.row]
        cell.configure(text: text)
        
        cell.layoutIfNeeded()
        
        let targetSize = CGSize(width: view.frame.width, height: 1000)
        let estimeSize = cell.systemLayoutSizeFitting(targetSize)
        
        return .init(width: view.frame.width, height: estimeSize.height)
    }
}
