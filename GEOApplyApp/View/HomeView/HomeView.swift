//
//  HomeView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager : AppManager
    @State private var isShowingSheet = false
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    VStack{
                        HStack{
                            Spacer().frame(width:manager.screenWidth*0.05)
                            Image(systemName: "person.text.rectangle.fill").resizable().frame(width: manager.screenWidth*0.1, height: manager.screenWidth*0.08).foregroundColor(manager.themeColor).padding(2)
                            Text("My Profile").font(.system(.title, design: .rounded)).foregroundColor(manager.themeColor).bold().padding(2)
                            Spacer()
                        }
                        
                        if manager.currentUser?.profile==true{
                            
                            NavigationLink(destination: ApplyDetail(name: manager.currentUserInfoCard?.name ?? "", school: manager.currentUserInfoCard?.school ?? "", nation: manager.currentUserInfoCard?.nation ?? "", major: manager.currentUserInfoCard?.major ?? "", sat: manager.currentUserInfoCard?.sat ?? 0.0, tofel: manager.currentUserInfoCard?.tofel ?? 0.0,gre:manager.currentUserInfoCard?.gre ?? 0.0, gpa: manager.currentUserInfoCard?.gpa ?? 0.0, intro: manager.currentUserInfoCard?.intro ?? "",view:manager.currentUserInfoCard?.view ?? 0,follow:manager.currentUserInfoCard?.follow ?? 0,applyinfo: manager.currentUserInfoCard?.applyinfo ?? [],uid: manager.currentUserInfoCard?.userid ?? "",avatarURL: manager.currentUser?.avatarImageUrl ?? manager.DefaultAvatarUrl,degree: manager.currentUserInfoCard?.degree ?? "Master",applyby: manager.currentUserInfoCard?.applyby ?? "")){
                                ApplyInfoCard(name: manager.currentUser?.name ?? "", nation: manager.currentUserInfoCard?.nation ?? "", school: manager.currentUserInfoCard?.school ?? "", gpa: manager.currentUserInfoCard?.gpa ?? 0.0, sat: manager.currentUserInfoCard?.sat ?? 0.0, tofel: manager.currentUserInfoCard?.tofel ?? 0.0,gre: manager.currentUserInfoCard?.gre ?? 0.0, avatarURL: manager.currentUser?.avatarImageUrl ?? manager.DefaultAvatarUrl,degree:manager.currentUserInfoCard?.degree ?? "Master",schoolImage: manager.findSchoolImageURL(schoolname: manager.currentUserInfoCard?.school ?? ""))
                            }.padding(3)
                        }else{
                            // if profile is not created yet
                            Rectangle().fill(.white.opacity(0)).frame(height:manager.screenHeight*0.07)
                            HStack{
                                NavigationLink(destination: AddInfoView()){
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
                            Image(systemName:  "ferry.fill").resizable().frame(width: manager.screenWidth*0.1, height: manager.screenWidth*0.08).foregroundColor(manager.themeColor).padding(2)
                            Text("Explore").font(.system(.title, design: .rounded)).foregroundColor(manager.themeColor).bold().padding(2)
                            Spacer()
                            Button(action: {
                                isShowingSheet=true
                            }, label: {
                                Text("Filter").bold().foregroundColor(.white).padding(manager.screenWidth*0.015)
                                    .background(RoundedRectangle(cornerRadius: 5)
                                        .fill(manager.themeColor)).padding(manager.screenWidth*0.02)
                            })
                            
                        }
                        //other info cards
                        ForEach(manager.users, id:\.self){i in
                            NavigationLink(destination: ApplyDetail(name: i.name ?? "unnamed", school: i.school ?? "unnamed", nation: i.nation ?? "unnamed", major: i.major ?? "unnamed", sat: i.sat!, tofel: i.tofel!,gre:i.gre ?? 0.0, gpa: i.gpa!, intro: i.intro ?? "Lazy and did not write anything",view:i.view ?? 0,follow:i.follow ?? 0,applyinfo: i.applyinfo ?? [],uid: i.userid ?? "",avatarURL:i.avatarImageURL ?? manager.DefaultAvatarUrl,degree: i.degree ?? "Master",applyby: i.applyby ?? "")){
                                ApplyInfoCard(name: i.name ?? "unnamed", nation: i.nation ?? "unnamed", school: i.school ?? "unnamed", gpa: i.gpa!, sat: i.sat!, tofel: i.tofel!,gre:i.gre ?? 0.0,avatarURL:i.avatarImageURL ?? manager.DefaultAvatarUrl,degree: i.degree ?? "Master",schoolImage: manager.findSchoolImageURL(schoolname: i.school ?? "")).padding(3)
                            }.padding(3)
                        }
                    }
                    
                }
                
                //floating action button for adding info
                VStack(){
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: AddInfoView()){
                            Image(systemName: "pencil.circle.fill")
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
            .onAppear{
                //maybe do something?
            }
            .sheet(isPresented: $isShowingSheet){
                filterView(isShowingSheet:$isShowingSheet)
            }
            .toolbar(){
                // tool bar for refresh
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        Task{
                            await manager.getUserInfo()
                            await manager.getAllProfiles()
                        }
                       
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
