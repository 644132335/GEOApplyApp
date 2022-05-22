//
//  GEOAppManager.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AppManager:ObservableObject{
    
    //**********************************************************Theme Color Data**********************************************************
    let blue1 = UIColor(red: 0.4667, green: 0.7922, blue: 0.9765, alpha: 1)
    let themeColor = Color.blue.opacity(0.6)
    let satGradientColor = LinearGradient(colors: [Color.blue.opacity(0.4),Color.green.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let TofelGradientColor = LinearGradient(colors: [Color.purple.opacity(0.4),Color.red.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let GPAGradientColor = LinearGradient(colors: [Color.yellow.opacity(0.4),Color.orange.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    let backgroundColor = Color("background")
    
    //****************************************************Storage and functions*******************************************
    //state variables
    @Published var users=[UserInfo]()
    @Published var currentPage: Page = .login
    
    //firebase variables
    @Published var signedIn=false
    @Published var signinerro=""
    @Published var signuperro=""
    @Published var currentUser:BasicUser?
    
    
    enum Page{
        case login
        case main
    }
    
    init(){
    }
   
    func addUser(userid: String?, name: String?, school: String?, nation: String?, major: String?, sat: Double?, tofel: Double?, gpa: Double?){
        users.append(UserInfo(userid: userid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gpa: gpa))
    }
    
    //******************************************************Firebase Area*****************************
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
    var isSignedIn:Bool{
        return auth.currentUser != nil
    }
    
    //login func
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){[weak self]result, error in
            guard result != nil, error == nil else{
                self?.signinerro=error!.localizedDescription
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn=true
                self?.signinerro=""
                //populate user
                self?.getUser()
                withAnimation{
                    self?.currentPage = .main
                }
            }
        }
    }
    
    //sign up func
    func signUp(email:String, password:String, username:String) {
        auth.createUser(withEmail: email, password: password){result, error in
            
            guard result != nil, error == nil else{
                self.signuperro=error!.localizedDescription
                return
            }
            DispatchQueue.main.async {
                self.signedIn=true
                self.signinerro=""
                self.createUsers(email:email, username:username)
                withAnimation{
                    self.currentPage = .main
                }
            }
            
        }
    }
    
    //sign out func
    func signOut(){
        try? auth.signOut()
        self.signedIn=false
        withAnimation{
            self.currentPage = .login
        }
    }
    
    //create db for a user
    func createUsers(email:String, username:String) {
        guard let uid = auth.currentUser?.uid else { print("no Current user"); return }
        db.collection("users").document(uid).setData([
            "email":email,
            "username":username,
            "uid":uid,
            "profile":false
        ]){ err in
            if let err = err {
                self.signuperro="\(err)"
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        //populate user
        self.getUser()
        
    }
    
    //get user info
    func getUser(){
        guard let uid = auth.currentUser?.uid else { print("no Current user signed"); return }
        db.collection("users").document(uid).getDocument{ info,error in
            if let error = error {
                //self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }
            
            guard let data = info?.data() else {
                //self.errorMessage = "No data found"
                print("No data found")
                return
            }
            
            let uid = data["uid"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            let username = data["username"] as? String ?? ""
            self.currentUser=BasicUser(email: email, userid: uid, name: username, school: "", nation: "", major: "", sat: 0, tofel: 0, gpa: 0,profile: false)
        }
    }
    
    
    
}
