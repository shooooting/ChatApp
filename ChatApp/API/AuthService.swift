//
//  AuthService.swift
//  ChatApp
//
//  Created by ㅇ오ㅇ on 2020/12/18.
//

import Foundation
import Firebase
import UIKit

struct RegistrationCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func createUser(creadentials: RegistrationCredentials, completion: ((Error?) -> Void)?) {
        
        guard let imageData = creadentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")

        ref.putData(imageData, metadata: nil) { (meta, error) in
            if let error = error {
//                print("DEBUG: Failed to upload Image with error \(error.localizedDescription)")
                completion!(error)
                return
            }
            ref.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: creadentials.email, password: creadentials.password) { (result, error) in
                    if let error = error {
//                        print("DEBUG: Failed to create user with error \(error.localizedDescription)")
                        completion!(error)
                        return
                    }
                    guard let uid = result?.user.uid else { return }
                    
                    let data = ["email": creadentials.email,
                                "fullname": creadentials.fullname,
                                "profileImageUrl": profileImageUrl,
                                "uid": uid,
                                "username": creadentials.username] as [String: Any]
                    Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
                }
            }
        }
    }
}
