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
    @Published var currentUserInfoCard:UserInfo?
    
    
    enum Page{
        case login
        case main
    }
    
    init(){
    }
   
    func addUser(userid: String?, name: String?, school: String?, nation: String?, major: String?, sat: Double?, tofel: Double?, gpa: Double?,intro: String?){
        users.append(UserInfo(userid: userid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gpa: gpa,intro: intro))
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
                self?.getUserInfo()
                self?.getAllProfiles()
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
        self.users=[]
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
            let profile = data["profile"] as? Bool ?? false
            self.currentUser=BasicUser(email: email, userid: uid, name: username, school: "", nation: "", major: "", sat: 0, tofel: 0, gpa: 0,profile: profile)
        }
    }
    
    //create user info card
    func createUserInfoCard(username:String, school:String, nationality:String, major:String, sat:Double, tofel:Double, gpa:Double, intro:String) {
        guard let uid = auth.currentUser?.uid else { print("no Current user"); return }
        db.collection("userInfoCard").document(uid).setData([
            "uid":uid,
            "school":school,
            "nationality":nationality,
            "major":major,
            "sat":sat,
            "tofel":tofel,
            "gpa":gpa,
            "intro":intro,
            "name":self.currentUser?.name ?? "Unnamed"
        ]){ err in
            if let err = err {
                print("Error writing document: \(err)")
                return
            } else {
                print("Document successfully written!")
            }
        }
        
        //set user profile to true
        db.collection("users").document(uid).setData([
            "profile":true
        ],merge: true){error in
            if let error = error {
                print("Error writing document: \(error)")
                return
            } else {
                print("Document successfully merged!")
            }
        }
        //populate user
        getUser()
        getUserInfo()
    }
    
    func getUserInfo(){
        guard let uid = auth.currentUser?.uid else { print("no Current user signed"); return }
        db.collection("userInfoCard").document(uid).getDocument{ info,error in
            if let error = error {
                //self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }
            
            guard let data = info?.data() else {
                print("No data found")
                return
            }
            
            let uid = data["uid"] as? String ?? ""
            let gpa = data["gpa"] as? Double ?? 0.0
            let intro = data["intro"] as? String ?? ""
            let major = data["major"] as? String ?? ""
            let nation = data["nationality"] as? String ?? ""
            let sat = data["sat"] as? Double ?? 0.0
            let school = data["school"] as? String ?? ""
            let tofel = data["tofel"] as? Double ?? 0.0
            let name = data["name"] as? String ?? ""
            
            self.currentUserInfoCard=UserInfo(userid: uid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gpa: gpa, intro: intro)
        }
    }
    
    func getAllProfiles(){
        //guard let uid = auth.currentUser?.uid else { print("no Current user signed"); return }
        users=[]
        db.collection("userInfoCard").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data=document.data()
                    let uid = data["uid"] as? String ?? ""
                    let gpa = data["gpa"] as? Double ?? 0.0
                    let intro = data["intro"] as? String ?? ""
                    let major = data["major"] as? String ?? ""
                    let nation = data["nationality"] as? String ?? ""
                    let sat = data["sat"] as? Double ?? 0.0
                    let school = data["school"] as? String ?? ""
                    let tofel = data["tofel"] as? Double ?? 0.0
                    let name = data["name"] as? String ?? ""
                    
                    self.users.append(UserInfo(userid: uid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gpa: gpa, intro: intro))
                }
                print(self.users)
                
            }
        }
        
    }
    
    
}
