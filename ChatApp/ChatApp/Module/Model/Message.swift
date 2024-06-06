//
//  Message.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import Foundation
import Firebase

struct Message {
    let text: String
    let fromID: String
    let toID: String
    let timeStamp: Timestamp
    let username: String
    let fullname: String
    let profileImageURL: String
    
    var isFromCurrentUser: Bool
    
    var chatPartnerID: String { return isFromCurrentUser ? toID : fromID }
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["text"] as? String ?? ""
        self.fromID = dictionary["fromID"] as? String ?? ""
        self.toID = dictionary["toID"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        
        self.timeStamp = dictionary["timeStamp"] as? Timestamp ?? Timestamp(date: Date())
        
        self.isFromCurrentUser = fromID == Auth.auth().currentUser?.uid
    }
}
