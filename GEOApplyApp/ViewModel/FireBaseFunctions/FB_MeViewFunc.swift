//
//  FB_MeViewFunc.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/6/16.
//

import Foundation
import SwiftUI

extension AppManager{
    
    //save information in me view
    func saveMeInfo(){
        
        //edit user basic information
        guard let uid = auth.currentUser?.uid else { print("no Current user"); return }
        db.collection("users").document(uid).setData([
            "email":self.meEmail,
            "username":self.meUsername,
            "age":self.meAge,
            "gender":self.meGender,
            "school":self.meSchool,
            "applyDegree":self.meDegree,
            "gre":self.meGRE,
            "sat":self.meSat,
            "tofel":self.meTofel,
            "gpa":self.meGPA
            
        ],merge: true){ err in
            if let err = err {
                self.signuperro="\(err)"
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        
        
        //populate user
        Task{
            await self.getUser()
        }
    }
    
    //save image avatar to firebase storage
    func saveAvatar(){
        //get uid
        guard let uid = auth.currentUser?.uid else { print("no Current user"); return }
        guard let imageData = self.imageSelected.jpegData(compressionQuality: 0.5) else { return }
        //save data into storage
        self.storage.reference(withPath: uid).putData(imageData,metadata: nil){metadata,err in
            if let err = err {
                print("\(err)")
                return
            }
            self.storage.reference(withPath: uid).downloadURL{url,err in
                if let err = err {
                    print("\(err)")
                    return
                }
                print("successfully stored image")
                print(url?.absoluteString ?? "")
                
                //save url to user
                self.db.collection("users").document(uid).setData([
                    "userImageUrl":url?.absoluteString ?? self.DefaultAvatarUrl
                ],merge: true){ err in
                    if let err = err {
                        self.signuperro="\(err)"
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
                
                //save url to userinfo
                self.db.collection("userInfoCard").document(uid).setData([
                    "userImageUrl":url?.absoluteString ?? self.DefaultAvatarUrl
                ],merge: true){ err in
                    if let err = err {
                        print("Error writing document: \(err)")
                        return
                    } else {
                        print("Document successfully written!")
                    }
                }
                
                //update profile
                Task{
                    await self.getUser()
                }
            }
        }
    }
}
