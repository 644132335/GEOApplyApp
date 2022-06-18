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
}
