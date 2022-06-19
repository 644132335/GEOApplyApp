//
//  ApplyDetail.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI
import SDWebImageSwiftUI

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
    var view:Int
    var follow:Int
    var applyinfo:[schoolReslt]
    var uid:String
    var avatarURL:String
    
    var body: some View {
        ZStack{
            
            ScrollView{
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        WebImage(url: URL(string: avatarURL))
                            .resizable()
                            .frame(width: manager.screenWidth*0.2, height: manager.screenWidth*0.2).clipShape(Circle()).shadow(radius: 6)
                        
                        Text(name).foregroundColor(.black.opacity(0.8)).bold()
                        Text(school).foregroundColor(.black.opacity(0.4)).font(.footnote)
                        HStack{
                            Spacer()
                            Text("View \(view)").foregroundColor(.black.opacity(0.4)).font(.footnote)
                            
                            Divider()
                            Text("Follower \(follow)").foregroundColor(.black.opacity(0.4)).font(.footnote)
                            Spacer()
                            
                        }
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
                            //do something with own card
                        }else{
                            if manager.followed.contains(uid){
                                //unfollow
                                manager.followed=manager.followed.filter{$0 != uid}
                                manager.addFollow(uid: uid, follow: follow==0 ? 0 : follow-1)
                            }else{
                                //follow
                                manager.followed.append(uid)
                                manager.addFollow(uid: uid, follow: follow+1)
                            }
                        }
                        
                        //update followed
                        Task{
                            await manager.changeFolloweUser()
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
        .onAppear{
            // add view
            manager.addView(uid: uid, view: view+1)
        }
    }
}
struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ApplyDetail(name: "dsad", school: "dsadas", nation: "china", major: "major", sat: 1200, tofel: 120, gpa: 3.9, intro: "nonnononono", view:0,follow:0,applyinfo: [],uid: "dsad",avatarURL:AppManager().DefaultAvatarUrl).environmentObject(AppManager())
    }
}

