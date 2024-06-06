//
//  FileUploader.swift
//  ChatApp
//
//  Created by Dongik Song on 6/6/24.
//

import UIKit
import Firebase
import FirebaseStorage

struct FileUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let uid = Auth.auth().currentUser?.uid ?? "/profileImages/"
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/\(uid)/\(filename)")
        
        ref.putData(imageData, metadata: nil) { metaData, error in
            if let erorr = error {
                print (erorr.localizedDescription)
                return
            }
            
            ref.downloadURL { url, error in
                if let erorr = error {
                    print (erorr.localizedDescription)
                    return
                }
                
                guard let fileURL = url?.absoluteString else { return }
                completion(fileURL)
            }
            
        
        }
    }
    
}
