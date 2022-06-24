//
//  FB_FilterFunc.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/6/24.
//

import Foundation

extension AppManager{
    
    //filter func
    func filterFunc(){
        if self.filterGPAmin==0 && self.filterGPAmax==0{
            return
        }else{
            //filter refence
            var ref=db.collection("userInfoCard")
                .whereField("gpa", isGreaterThanOrEqualTo: self.filterGPAmin)
                .whereField("gpa", isLessThanOrEqualTo: self.filterGPAmax)

                
            if filterDegree != "All"{
              ref=db.collection("userInfoCard")
                    .whereField("degree", isEqualTo: self.filterDegree)
            }
            
                //get filtered docs
            ref.getDocuments() { [self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.users=[]
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
                        
                        if (self.filterSATmin...self.filterSATmax).contains(sat) && (self.filterGPAmin...self.filterGPAmax).contains(gpa) && (self.filterTOFELmin...self.filterTOFELmax).contains(tofel) && (self.filterGREmin...self.filterGREmax).contains(gre){
                            for i in applyinfo{
                                applyinfos.append(schoolReslt(schoolName: i["schoolname"] ?? "", result: i["result"] ?? "", schoolurl: i["schoolUrl"] ?? ""))
                            }
                            applyinfos=self.sortSchools(applyinfo: applyinfos)
                            self.users.append(UserInfo(userid: uid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gre:gre, gpa: gpa, intro: intro,view:view,follow:follow,applyinfo: applyinfos,avatarImageURL: imageurl, degree: degree))
                            
                        }
                        
                    }
                    
                }
                
            }
        }
    }
}

