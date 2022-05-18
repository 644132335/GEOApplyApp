//
//  GEOAppManager.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import Foundation
import SwiftUI
import FirebaseAuth

class AppManager:ObservableObject{
    
    //**********************************************************Theme Color Data**********************************************************
    let blue1 = UIColor(red: 0.4667, green: 0.7922, blue: 0.9765, alpha: 1)
    let themeColor = Color.blue.opacity(0.6)
    let satGradientColor = LinearGradient(colors: [Color.blue.opacity(0.4),Color.green.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let TofelGradientColor = LinearGradient(colors: [Color.purple.opacity(0.4),Color.red.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let GPAGradientColor = LinearGradient(colors: [Color.yellow.opacity(0.4),Color.orange.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    //**********************************************************Storage and functions******************************************************
    @Published var users=[UserInfo]()
    @Published var signedIn=false
    
    init(){
        
    }
   
    func addUser(userid: String?, name: String?, school: String?, nation: String?, major: String?, sat: Double?, tofel: Double?, gpa: Double?){
        users.append(UserInfo(userid: userid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gpa: gpa))
    }
    
    //Firebase Login Methods
    let auth = Auth.auth()
    var isSignedIn:Bool{
        return auth.currentUser != nil
    }
    //login func
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){[weak self]result, error in
            guard result != nil, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn=true
            }
        }
    }
    //sign up func
    func signUp(email:String, password:String){
        auth.createUser(withEmail: email, password: password){result, error in
            print(error)
            guard result != nil, error == nil else{
                print("not created........................")
                return
            }
        }
    }
    
    
    
}
