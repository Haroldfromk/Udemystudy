//
//  Ref.swift
//  TikTokClone
//
//  Created by Dongik Song on 5/20/24.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase

let REF_USER = "users"
let STORAGE_PROFILE = "profile"
let URL_STORAGE_ROOT = "gs://tiktoktutorial-d9129.appspot.com"
let EMAIL = "email"
let UID = "uid"
let USERNAME = "username"
let PROFILE_IMAGE_URL = "profileImageUrl"
let STATUS = "status"

let IDENTIFIER_TABBAR = "TabbarVC"
let IDENTIFIER_MAIN = "MainVC"


class Ref {
    let databaseRoot = Database.database().reference()
    
    var databaseUsers: DatabaseReference {
        return databaseRoot.child(REF_USER)
    }
    
    func databaseSpecificUser(uid: String) -> DatabaseReference {
        return databaseUsers.child(uid)
    }
    
    // storage Ref
    let storageRoot = Storage.storage().reference(forURL: URL_STORAGE_ROOT)
    
    var storageProfile: StorageReference {
        return storageRoot.child(STORAGE_PROFILE)
    }
    
    func storageSpecificProfile(uid: String) -> StorageReference {
        return storageProfile.child(uid)
    }
}
