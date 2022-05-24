//
//  HomeView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    VStack{
                        HStack{
                            Spacer().frame(width:manager.screenWidth*0.05)
                            Text("My Info").font(.system(.title, design: .rounded)).foregroundColor(manager.themeColor).bold().padding(2)
                            Spacer()
                        }
                        
                        if manager.currentUser?.profile==true{
                            NavigationLink(destination: ApplyDetail(name: manager.currentUserInfoCard?.name ?? "", school: manager.currentUserInfoCard?.school ?? "", nation: manager.currentUserInfoCard?.nation ?? "", major: manager.currentUserInfoCard?.major ?? "", sat: manager.currentUserInfoCard?.sat ?? 0.0, tofel: manager.currentUserInfoCard?.tofel ?? 0.0, gpa: manager.currentUserInfoCard?.gpa ?? 0.0, intro: manager.currentUserInfoCard?.intro ?? "")){
                                ApplyInfoCard(name: manager.currentUser?.name ?? "", nation: manager.currentUserInfoCard?.nation ?? "", school: manager.currentUserInfoCard?.school ?? "", gpa: manager.currentUserInfoCard?.gpa ?? 0.0, sat: manager.currentUserInfoCard?.sat ?? 0.0, tofel: manager.currentUserInfoCard?.tofel ?? 0.0)
                            }.padding(3)
                        }else{
                            // if profile is not created yet
                            Rectangle().fill(.white.opacity(0)).frame(height:manager.screenHeight*0.07)
                            HStack{
                                NavigationLink(destination: AddInfo()){
                                    Text("Please Add Your Profile").font(.title3).foregroundColor(manager.backgroundColor)
                                        .background(RoundedRectangle(cornerRadius: 20)
                                        .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
                                        .foregroundColor(manager.backgroundColor)
                                        .frame(width: manager.screenWidth*0.8, height: manager.screenHeight*0.15, alignment: .center).padding(3))
                                }
                            }.padding(3)
                            Rectangle().fill(.white.opacity(0)).frame(height:manager.screenHeight*0.05)

                        }
                        
                        //Divider()
                        HStack{
                            Spacer().frame(width:manager.screenWidth*0.05)
                            Text("Explore").font(.system(.title, design: .rounded)).foregroundColor(manager.themeColor).bold().padding(2)
                            Spacer()
                        }
                        //other info
                        ForEach(manager.users, id:\.self){i in
                            NavigationLink(destination: ApplyDetail(name: i.name ?? "unnamed", school: i.school ?? "unnamed", nation: i.nation ?? "unnamed", major: i.major ?? "unnamed", sat: i.sat!, tofel: i.tofel!, gpa: i.gpa!, intro: i.intro ?? "Lazy and did not write anything")){
                                ApplyInfoCard(name: i.name ?? "unnamed", nation: i.nation ?? "unnamed", school: i.school ?? "unnamed", gpa: i.gpa!, sat: i.sat!, tofel: i.tofel!).padding(3)
                            }.padding(3)
                        }
                        
                        
                    }.refreshable{
                        manager.getUser()
                        manager.getUserInfo()
                        manager.getAllProfiles()
                    }
                }
                
                //floating action button for adding info
                VStack(){
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: AddInfo()){
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 57, height: 57)
                                .foregroundColor(manager.themeColor)
                                .shadow(color: .gray, radius: 0.4, x: 1, y: 1)
                                .background(Circle().fill(Color.white).frame(width: 57, height: 57))
                        }.padding()
                        
                    }
                    
                    //Spacer().frame(height:10)
                }
                
            }
            .toolbar(){
                // tool bar for refresh
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        manager.getUserInfo()
                        manager.getAllProfiles()
                    }){Image(systemName: "arrow.clockwise").foregroundColor(manager.themeColor)}}
            }

            .navigationBarBackButtonHidden(true)
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
