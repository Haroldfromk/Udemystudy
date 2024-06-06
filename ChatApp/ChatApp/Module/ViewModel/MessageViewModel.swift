//
//  MessageViewModel.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import UIKit

struct MessageViewModel {
    let message: Message
    
    var messageText: String { return message.text }
    var messageBackgroundColor: UIColor { return message.isFromCurrentUser ? #colorLiteral(red: 0.4196078431, green: 0.831372549, blue: 0.431372549, alpha: 1) : #colorLiteral(red: 0.9058823529, green: 0.9098039216, blue: 0.9137254902, alpha: 1) }
    var messageColor: UIColor { return message.isFromCurrentUser ? .white : .black }
    
    var fullname: String { return message.fullname }
    var username: String { return message.username }
    
    var rightAnchorActive: Bool { return message.isFromCurrentUser }
    var leftAnchorActive: Bool { return !message.isFromCurrentUser }
    var shouldHideProfileImage: Bool { return message.isFromCurrentUser }
    
    var profileImageURL: URL? { return URL(string: message.profileImageURL)}
    var timeStampString: String? {
        let date = message.timeStamp.dateValue()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    init(message: Message) {
        self.message = message
    }
    
}
