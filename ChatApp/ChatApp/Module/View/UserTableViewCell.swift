//
//  UserTableViewCell.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let profileImageView = CustomImageView(width: 48, height: 48, backgroundColor: .lightGray, cornerRadius: 24)
    
    private let username = CustomLabel(text: "Username", textFont: .boldSystemFont(ofSize: 17))
    private let fullname = CustomLabel(text: "Fullname", labelColor: .lightGray)
    
    
    // MARK: - Lifecylce
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor)
        
        let stackView = UIStackView(arrangedSubviews: [username, fullname])
        stackView.axis = .vertical
        stackView.spacing = 7
        stackView.alignment = .leading
 
        addSubview(stackView)
        stackView.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Helpers
}
