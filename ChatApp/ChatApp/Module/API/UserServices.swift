//
//  UserServices.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import Foundation

struct UserServices {
    static func fetchUser(uid: String, completion: @escaping (User) -> Void) {
        collection_User.document(uid).getDocument { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
    
    static func fetchUsers(completion: @escaping([User]) -> Void) {
        collection_User.getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            let users = snapshot.documents.map( {User(dictionary: $0.data())})
            completion(users)
        }
    }
}
