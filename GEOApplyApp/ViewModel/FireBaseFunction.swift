//
//  FireBaseFunction.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/28.
//

import Foundation
import SwiftUI

extension AppManager{
    
    //----------------------------------------------------authentication from database-------------------------------------------------
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
    
    //sign out func----auth----
    func signOut(){
        try? auth.signOut()
        self.signedIn=false
        self.users=[]
        self.UsrSchool=""
        self.UsrNation=""
        self.UsrMajor=""
        self.UsrSat=0.0
        self.UsrTofel=0.0
        self.UsrGPA=0.0
        self.UsrIntro="\n\n\n\n\n"
        withAnimation{
            self.currentPage = .login
        }
    }
    
    
    
    //--------------------------------------------------write into database-----------------------------------------------------
    
    //create db for a user----write----
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
    
    //create user info card
    func createUserInfoCard() {
        guard let uid = auth.currentUser?.uid else { print("no Current user"); return }
        db.collection("userInfoCard").document(uid).setData([
            "uid":uid,
            "school":UsrSchool,
            "nationality":UsrNation,
            "major":UsrMajor,
            "sat":UsrSat,
            "tofel":UsrTofel,
            "gpa":UsrGPA,
            "intro":UsrIntro,
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
    
    
    //-----------------------------------------read info from database---------------------------------------------------
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
    
    //get all the info cards
    func getAllProfiles(){
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
                
            }
            if self.currentUser?.profile==true{
                self.UsrSchool=self.currentUserInfoCard?.school ?? ""
                self.UsrNation=self.currentUserInfoCard?.nation ?? ""
                self.UsrMajor=self.currentUserInfoCard?.major ?? ""
                self.UsrSat=self.currentUserInfoCard?.sat ?? 0.0
                self.UsrTofel=self.currentUserInfoCard?.tofel ?? 0.0
                self.UsrGPA=self.currentUserInfoCard?.gpa ?? 0.0
                self.UsrIntro=self.currentUserInfoCard?.intro ?? ""
            }
        }
        
    }
    
    //get school info
    func getSchoolInfo() async {
        schools=[]
        db.collection("schoolInfo").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data=document.data()
                    let schoolName = data["school"] as? String ?? ""
                    let schoolImage = data["image"] as? String ?? ""
                    let rank = data["rank"] as? Int ?? 0
                    self.schools.append(schoolInfo(schoolName: schoolName, rank: rank, schoolImageUrl: schoolImage))
                }
                
            }
        }
    }
    
}
