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
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password){result, error in
            guard result != nil, error == nil else{
                self.signinerro=error!.localizedDescription
                return
            }
            
            DispatchQueue.main.async {
                self.launchloading=true
                self.currentPage = .loginloading
                self.signedIn=true
                self.signinerro=""
                //populate user
                
                Task{
                    await self.getUser()
                    await self.getUserInfo()
                    await self.getAllProfiles()
                    await self.getFollowed()
                }
                //self.getUserInfo()
               
                
                withAnimation{
                    self.launchloading=false
                    self.currentPage = .main
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
                self.signIn(email: email, password: password)
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
        self.schoolResults=[]
        self.followed=[]
        self.followedUsers=[]
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
        Task{
            await self.getUser()
        }
        
    }
    
    //create user info card
    func createUserInfoCard() {
        guard let uid = auth.currentUser?.uid else { print("no Current user"); return }
        var applyinfo:[[String:Any]]=[]
        for i in self.schoolResults{
            applyinfo.append(["schoolname":i.schoolName,"result":i.result,"schoolUrl":i.schoolurl])
        }
        db.collection("userInfoCard").document(uid).setData([
            "uid":uid,
            "school":meSchool,
            "nationality":UsrNation,
            "major":UsrMajor,
            "sat":meSat,
            "tofel":meTofel,
            "gpa":meGPA,
            "gre":meGRE,
            "intro":UsrIntro,
            "name":self.currentUser?.name ?? "Unnamed",
            "view":0,
            "follow":0,
            "applyinfo":applyinfo,
            "degree":meDegree
        ],merge: true){ err in
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
        //createApplyInfo()
        //populate user
        Task{
            await getUser()
            await getUserInfo()
            await getAllProfiles()
        }
       
    }
    
    
    //change follow users
    func changeFolloweUser() async {
        print("changefolloweuser")
        guard let uid = auth.currentUser?.uid else { print("no Current user"); return }
        db.collection("users").document(uid).setData([
            "followed":self.followed
        ],merge: true){ err in
            if let err = err {
                print("Error writing document: \(err)")
                return
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    //add views
    func addView(uid:String,view:Int) {
        db.collection("userInfoCard").document(uid).setData([
            "view":view,
        ],merge: true){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Add View!")
            }
        }
    }
    
    //add followed
    func addFollow(uid:String,follow:Int) {
        db.collection("userInfoCard").document(uid).setData([
            "follow":follow
        ],merge: true){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Add Follow!")
            }
        }
    }
    
    //-----------------------------------------read info from database---------------------------------------------------
    //get user info
    func getUser() async {
        print("get user")
        guard let uid = auth.currentUser?.uid else { print("no Current user signed"); return }
        
        do{
            let data = try await db.collection("users").document(uid).getDocument().data()
            let uid = data?["uid"] as? String ?? ""
            let email = data?["email"] as? String ?? ""
            let username = data?["username"] as? String ?? ""
            let profile = data?["profile"] as? Bool ?? false
            let follow = data?["followed"] as? [String] ?? []
            let school = data?["school"] as? String ?? ""
            let gender = data?["gender"] as? String ?? ""
            let age = data?["age"] as? Int ?? 0
            let applyDegree = data?["applyDegree"] as? String ?? ""
            let gre = data?["gre"] as? Double ?? 0.0
            let sat = data?["sat"] as? Double ?? 0.0
            let tofel = data?["tofel"] as? Double ?? 0.0
            let gpa = data?["gpa"] as? Double ?? 0.0
            let avatarImage=data?["userImageUrl"] as? String ?? self.DefaultAvatarUrl
            DispatchQueue.main.async {
                self.currentUser=BasicUser(email: email, userid: uid, name: username, school: school, nation: "", major: "", sat: sat, tofel: tofel, gpa: gpa,gre:gre,profile: profile,applyDegree:applyDegree,gender: gender,age:age,avatarImageUrl: avatarImage)
                self.followed=follow
                
                //populate setting
                self.meGPA=self.currentUser?.gpa ?? 0.0
                self.meUsername=self.currentUser?.name ?? ""
                self.meEmail=self.currentUser?.email ?? ""
                self.meAge=self.currentUser?.age ?? 0
                self.meGender=self.currentUser?.gender ?? ""
                self.meDegree=self.currentUser?.applyDegree ?? ""
                self.meSchool=self.currentUser?.school ?? ""
                self.meSat=self.currentUser?.sat ?? 0.0
                self.meTofel=self.currentUser?.tofel ?? 0.0
                self.meGRE=self.currentUser?.gre ?? 0.0
            }
            
        }catch{
            print(error)
        }
    }
    
    @MainActor
    func getUserInfo() async {
        print("get userinfo")
        guard let uid = auth.currentUser?.uid else { print("no Current user signed"); return }
        do{
            let data = try await db.collection("userInfoCard").document(uid).getDocument().data()
            let uid = data?["uid"] as? String ?? ""
            let gpa = data?["gpa"] as? Double ?? 0.0
            let intro = data?["intro"] as? String ?? ""
            let major = data?["major"] as? String ?? ""
            let nation = data?["nationality"] as? String ?? ""
            let sat = data?["sat"] as? Double ?? 0.0
            let school = data?["school"] as? String ?? ""
            let tofel = data?["tofel"] as? Double ?? 0.0
            let name = data?["name"] as? String ?? ""
            let view = data?["view"] as? Int ?? 0
            let follow = data?["follow"] as? Int ?? 0
            let applyinfo = data?["applyinfo"] as? [[String:String]] ?? []
            let imageurl = data?["userImageUrl"] as? String ?? self.DefaultAvatarUrl
            let degree = data?["degree"] as? String ?? ""
            let gre = data?["gre"] as? Double ?? 0.0
            var applyinfos:[schoolReslt]=[]
            for i in applyinfo{
                applyinfos.append(schoolReslt(schoolName: i["schoolname"] ?? "", result: i["result"] ?? "", schoolurl: i["schoolUrl"] ?? ""))
            }
            applyinfos=self.sortSchools(applyinfo: applyinfos)
            self.currentUserInfoCard=UserInfo(userid: uid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gre:gre, gpa: gpa, intro: intro,view:view,follow:follow,applyinfo: applyinfos,avatarImageURL: imageurl,degree: degree)
            
            if self.currentUser?.profile==true{
                self.meSchool=self.currentUserInfoCard?.school ?? ""
                self.UsrNation=self.currentUserInfoCard?.nation ?? ""
                self.UsrMajor=self.currentUserInfoCard?.major ?? ""
                self.meSat=self.currentUserInfoCard?.sat ?? 0.0
                self.meTofel=self.currentUserInfoCard?.tofel ?? 0.0
                self.meGPA=self.currentUserInfoCard?.gpa ?? 0.0
                self.meGRE=self.currentUserInfoCard?.gre ?? 0.0
                self.UsrIntro=self.currentUserInfoCard?.intro ?? ""
                self.schoolResults=self.currentUserInfoCard?.applyinfo ?? []
            }
        }catch{
            print(error)
        }
    }
    
    //get all the info cards
    func getAllProfiles() async{
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
                    let view = data["view"] as? Int ?? 0
                    let follow = data["follow"] as? Int ?? 0
                    let applyinfo = data["applyinfo"] as? [[String:String]] ?? []
                    let imageurl = data["userImageUrl"] as? String ?? self.DefaultAvatarUrl
                    let degree = data["degree"] as? String ?? ""
                    let gre = data["gre"] as? Double ?? 0.0
                    
                    var applyinfos:[schoolReslt]=[]

                    for i in applyinfo{
                        applyinfos.append(schoolReslt(schoolName: i["schoolname"] ?? "", result: i["result"] ?? "", schoolurl: i["schoolUrl"] ?? ""))
                    }
                    applyinfos=self.sortSchools(applyinfo: applyinfos)
                    self.users.append(UserInfo(userid: uid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gre:gre, gpa: gpa, intro: intro,view:view,follow:follow,applyinfo: applyinfos,avatarImageURL: imageurl, degree: degree))
                }
                
            }
            
        }
    }
    
    //get followed cards
    func getFollowed() async{
        print("get followed user-------------")
        print(self.followed)
        self.followedUsers=[]
        for i in self.followed{
            do{
                let data = try await db.collection("userInfoCard").document(i).getDocument().data()
                let uid = data?["uid"] as? String ?? ""
                let gpa = data?["gpa"] as? Double ?? 0.0
                let intro = data?["intro"] as? String ?? ""
                let major = data?["major"] as? String ?? ""
                let nation = data?["nationality"] as? String ?? ""
                let sat = data?["sat"] as? Double ?? 0.0
                let school = data?["school"] as? String ?? ""
                let tofel = data?["tofel"] as? Double ?? 0.0
                let name = data?["name"] as? String ?? ""
                let view = data?["view"] as? Int ?? 0
                let follow = data?["follow"] as? Int ?? 0
                let applyinfo = data?["applyinfo"] as? [[String:String]] ?? []
                let imageurl = data?["userImageUrl"] as? String ?? self.DefaultAvatarUrl
                let degree = data?["degree"] as? String ?? ""
                let gre = data?["gre"] as? Double ?? 0.0
                
                var applyinfos:[schoolReslt]=[]
                for i in applyinfo{
                    applyinfos.append(schoolReslt(schoolName: i["schoolname"] ?? "", result: i["result"] ?? "", schoolurl: i["schoolUrl"] ?? ""))
                }
                applyinfos=self.sortSchools(applyinfo: applyinfos)
                let followedUser=UserInfo(userid: uid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel,gre: gre, gpa: gpa, intro: intro,view:view,follow:follow,applyinfo: applyinfos,avatarImageURL: imageurl,degree: degree)
                DispatchQueue.main.async {
                    self.followedUsers.append(followedUser)
                }
            }catch{
                print(error)
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
                self.sortSchools()
            }
        }
    }
}
