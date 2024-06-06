//
//  MessageService.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import Foundation
import Firebase

struct MessageServices {
    static func fetchMessages(otherUser: User, completion: @escaping([Message]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        var messages = [Message]()
        let query = collection_Message.document(uid).collection(otherUser.uid).order(by: "timeStamp")
        
        query.addSnapshotListener { snapshot, _ in
            guard let documentChanges = snapshot?.documentChanges.filter({$0.type == .added}) else { return }
            messages.append(contentsOf: documentChanges.map({Message(dictionary: $0.document.data())}))
            completion(messages)
        }
    }
    
    static func fetchRecentMessages(completion: @escaping([Message]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let query = collection_Message.document(uid).collection("recent-message").order(by: "timeStamp")
        
        query.addSnapshotListener { snapshot, _ in
            guard let documentChanges = snapshot?.documentChanges else { return }
            
            let messages = documentChanges.map({Message(dictionary: $0.document.data())})
            completion(messages)
        }
    }
    
    static func uploadMessage(message: String, currentUser: User, otherUser: User, completion: ((Error?) -> Void)?) {
        let dataFrom: [String: Any]  = [
            "text": message,
            "fromID": currentUser.uid,
            "toID": otherUser.uid,
            "timeStamp": Timestamp(date: Date()),
            
            "username": otherUser.username,
            "fullname": otherUser.fullname,
            "profileImageURL": otherUser.profileImageURL
        ]
        
        let dataTo: [String: Any]  = [
            "text": message,
            "fromID": currentUser.uid,
            "toID": otherUser.uid,
            "timeStamp": Timestamp(date: Date()),
            
            "username": currentUser.username,
            "fullname": currentUser.fullname,
            "profileImageURL": currentUser.profileImageURL
        ]
        
        collection_Message.document(currentUser.uid).collection(otherUser.uid)
            .addDocument(data: dataFrom) { _ in
            collection_Message.document(otherUser.uid).collection(currentUser.uid)
                    .addDocument(data: dataTo, completion: completion)
            collection_Message.document(currentUser.uid).collection("recent-message")
                    .document(otherUser.uid).setData(dataFrom)
            collection_Message.document(otherUser.uid).collection("recent-message")
                    .document(currentUser.uid).setData(dataTo)
        }
    }
}
