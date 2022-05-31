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
    let LoginbuttonColor = LinearGradient(colors: [Color.blue.opacity(0.4),Color.green.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    let backgroundColor = Color("background")
    
    //****************************************************Storage and functions*******************************************
    //state variables
    @Published var users=[UserInfo]()
    @Published var currentPage: Page = .login
    @Published var schools=[schoolInfo]()
    @Published var schoolResults=[schoolReslt]()
    
    
    //firebase variables
    @Published var signedIn=false
    @Published var signinerro=""
    @Published var signuperro=""
    @Published var currentUser:BasicUser?
    @Published var currentUserInfoCard:UserInfo?
    @Published var launchloading=true
    
    //account image
    @Published var showPicker = false
    @Published var source: accountImagePicker.Source = .library
    @Published var openConfirmationDialog = false
    @Published var changeAcountImage = false
    @Published var imageSelected = UIImage()
    
    //user info
    @Published var UsrSchool=""
    @Published var UsrNation=""
    @Published var UsrMajor=""
    @Published var UsrSat=0.0
    @Published var UsrTofel=0.0
    @Published var UsrGPA=0.0
    @Published var UsrIntro="\n\n\n\n\n"
    @Published var UsrAppliedSchool="Brown University"
    @Published var UsrSchoolResult="accepted"
    
    //app enums
    enum Page{
        case login
        case main
        case loginloading
    }
    
    
    init(){
        self.schoolResults=[]
        Task{
            await getSchoolInfo()
        }
       
    }
    
    func addUser(userid: String?, name: String?, school: String?, nation: String?, major: String?, sat: Double?, tofel: Double?, gpa: Double?,intro: String?){
        users.append(UserInfo(userid: userid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gpa: gpa,intro: intro))
    }
    
    //Firebase local variables
    let auth = Auth.auth()
    let db = Firestore.firestore()
    var isSignedIn:Bool{
        return auth.currentUser != nil
    }
    
    //sort university by name
    func sortSchools() {
        let newlst=self.schools.sorted{
            $0.schoolName<$1.schoolName
        }
        schools=newlst
    }
    
    //add school result
    func addSchoolResult(name:String,result:String){
        var schoolrul=""
        for i in self.schools{
            if i.schoolName==name{
               schoolrul=i.schoolImageUrl
            }
        }
        self.schoolResults.append(schoolReslt(schoolName: name, result: result,schoolurl: schoolrul))
        
    }
    
    
}
