//
//  AuthServices.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import UIKit
import Firebase
import FirebaseAuth

//typealias AuthDataResultCallback = (AuthDataResult?, Error?) -> Void

struct AuthCredential {
    
    let email: String
    let password: String
    let username: String
    let fullname: String
    let profileImage: UIImage
    
}

struct AuthCredentialEmail {
    
    let email: String
    let uid: String
    let username: String
    let fullname: String
    let profileImage: UIImage
    
}

struct AuthServices {
    static func loginUser(withEmail email: String, withPassword password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
        
    }
    
    static func registerUser(credential: AuthCredential, completion: @escaping(Error?) -> Void) {
        FileUploader.uploadImage(image: credential.profileImage) { imageURL in
            
            Auth.auth().createUser(withEmail: credential.email, password: credential.password) { result, error in
                if let error = error {
                    print("Error create account \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                let data: [String: Any] = [
                    "email": credential.email,
                    "username": credential.username,
                    "fullname": credential.fullname,
                    "uid": uid,
                    "profileImageURL": imageURL
                ]
                
                collection_User.document(uid).setData(data, completion: completion)
            }
        }
        
    }
    
    static func registerWithGoogle(credential: AuthCredentialEmail, completion: @escaping(Error?) -> Void) {
        FileUploader.uploadImage(image: credential.profileImage) { imageURL in
            
            let data: [String: Any] = [
                "email": credential.email,
                "username": credential.username,
                "fullname": credential.fullname,
                "uid": credential.uid,
                "profileImageURL": imageURL
            ]
            
            collection_User.document(credential.uid).setData(data, completion: completion)
        }
    }
}
