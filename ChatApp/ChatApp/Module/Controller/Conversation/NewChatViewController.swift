//
//  NewChatViewController.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import UIKit

class NewChatViewController: UIViewController {

    // MARK: - Properties
    private let tableView = UITableView()
    private let reuseIdentifier  = "UserTableViewCell"
    
    // MARK: - LifeCycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configureUI()
        configureTableView()
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


}

extension NewChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserTableViewCell
        
        return cell
    }
    
    
}
