//
//  ApplyDetail.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

struct ApplyDetail: View {
    @EnvironmentObject var manager : AppManager
    var name:String
    var school:String
    var nation:String
    var major:String
    var sat:Double
    var tofel:Double
    var gpa:Double
    var intro:String
    var applyinfo:[schoolReslt]
    var uid:String
    var body: some View {
        ZStack{
            
            ScrollView{
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        Circle().frame(width: 60, height: 60).clipShape(Circle()).shadow(radius: 6).foregroundColor(.blue.opacity(0.4))
                        Text(name).foregroundColor(.black.opacity(0.8)).bold()
                        Text(school).foregroundColor(.black.opacity(0.4)).font(.footnote)
                    }
                    Spacer()
                }
                Divider()
                VStack{
                   IntroSec(text: intro)
                   BasicInfo(nationality: nation, school: school, major: major)
                   ApplyInfoSec(userinfo:applyinfo)
                   ScoreSec(sat: sat, tofel: tofel, gpa: gpa)
                   EssaySec()
                }
                
            }
            }
        }.toolbar(){
            ToolbarItem(placement: .navigationBarTrailing){
                    //button for follow and unfollow
                    Button(action: {
                        if uid==manager.currentUserInfoCard?.userid{

                        }else{
                            if manager.followed.contains(uid){
                                manager.followed=manager.followed.filter{$0 != uid}
                            }else{
                                manager.followed.append(uid)
                            }
                        }
                        
                        //update followed
                        Task{
                            print("before change follow")
                            await manager.changeFolloweUser()
                            print("after change follow")
                            await manager.getFollowed()
                        }
                        
                       
                    }){
                        if uid==manager.currentUserInfoCard?.userid{
                            Text("")
                        }
                        else{
                            if manager.followed.contains(uid){
                                Text("Unfollow").bold().padding(5
                                ).foregroundColor(.white).background(RoundedRectangle(cornerRadius: 30).fill(manager.themeColor))
                            }else{
                                Text("Follow").bold().padding(5).background(RoundedRectangle(cornerRadius: 30).stroke(manager.themeColor,lineWidth: 2)).foregroundColor(manager.themeColor)
                            }
                        }
                        
                        
                    }.disabled(uid==manager.currentUserInfoCard?.userid)
            }
        }
    }
}
struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ApplyDetail(name: "dsad", school: "dsadas", nation: "china", major: "major", sat: 1200, tofel: 120, gpa: 3.9, intro: "nonnononono", applyinfo: [],uid: "dsad").environmentObject(AppManager())
    }
}

