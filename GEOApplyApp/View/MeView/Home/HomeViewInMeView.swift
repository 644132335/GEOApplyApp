//
//  HomeView.swift
//  Me View
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct HomeViewInMeView: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        
        VStack{
            Spacer()
            
            VStack(alignment:  .leading, spacing: 20){
                Spacer().frame(width:manager.screenWidth*0.05)
                HStack{
                   
                    Spacer().frame(width:manager.screenWidth*0.05)
                    Image(systemName: "person.text.rectangle.fill").resizable().frame(width: manager.screenWidth*0.1, height: manager.screenWidth*0.08).foregroundColor(manager.themeColor).padding(2)
                    Text("My Info").font(.system(.title, design: .rounded)).foregroundColor(manager.themeColor).bold().padding(2)
                    Spacer()
                }
                
                if manager.currentUser?.profile==true{
                    NavigationLink(destination: ApplyDetail(name: manager.currentUserInfoCard?.name ?? "", school: manager.currentUserInfoCard?.school ?? "", nation: manager.currentUserInfoCard?.nation ?? "", major: manager.currentUserInfoCard?.major ?? "", sat: manager.currentUserInfoCard?.sat ?? 0.0, tofel: manager.currentUserInfoCard?.tofel ?? 0.0, gpa: manager.currentUserInfoCard?.gpa ?? 0.0, intro: manager.currentUserInfoCard?.intro ?? "",applyinfo: manager.currentUserInfoCard?.applyinfo ?? [])){
                        ApplyInfoCard(name: manager.currentUser?.name ?? "", nation: manager.currentUserInfoCard?.nation ?? "", school: manager.currentUserInfoCard?.school ?? "", gpa: manager.currentUserInfoCard?.gpa ?? 0.0, sat: manager.currentUserInfoCard?.sat ?? 0.0, tofel: manager.currentUserInfoCard?.tofel ?? 0.0)
                    }.padding(3)
                }else{
                    // if profile is not created yet
                    Rectangle().fill(.white.opacity(0)).frame(height:manager.screenHeight*0.07)
                    HStack{
                        NavigationLink(destination: AddProfile()){
                            Text("Please Add Your Profile").font(.title3).foregroundColor(manager.backgroundColor)
                                .background(RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
                                .foregroundColor(manager.backgroundColor)
                                .frame(width: manager.screenWidth*0.8, height: manager.screenHeight*0.15, alignment: .center).padding(3))
                        }
                    }.padding(3)
                    Rectangle().fill(.white.opacity(0)).frame(height:manager.screenHeight*0.05)

                }
            }
            
        }
    }
}

struct HomeViewInMeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewInMeView()
    }
}
