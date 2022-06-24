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
            
            VStack(alignment:  .center, spacing: 20){
                Spacer().frame(width:manager.screenWidth*0.05)
                
                if manager.currentUser?.profile==true{
                    NavigationLink(destination: ApplyDetail(name: manager.currentUserInfoCard?.name ?? "", school: manager.currentUserInfoCard?.school ?? "", nation: manager.currentUserInfoCard?.nation ?? "", major: manager.currentUserInfoCard?.major ?? "", sat: manager.currentUserInfoCard?.sat ?? 0.0, tofel: manager.currentUserInfoCard?.tofel ?? 0.0,gre:manager.currentUserInfoCard?.gre ?? 0.0, gpa: manager.currentUserInfoCard?.gpa ?? 0.0, intro: manager.currentUserInfoCard?.intro ?? "",view:manager.currentUserInfoCard?.view ?? 0,follow:manager.currentUserInfoCard?.follow ?? 0,applyinfo: manager.currentUserInfoCard?.applyinfo ?? [],uid: manager.currentUserInfoCard?.userid ?? "",avatarURL: manager.currentUser?.avatarImageUrl ?? manager.DefaultAvatarUrl,degree:manager.currentUserInfoCard?.degree ?? "Master")){
                        ApplyInfoCard(name: manager.currentUser?.name ?? "", nation: manager.currentUserInfoCard?.nation ?? "", school: manager.currentUserInfoCard?.school ?? "", gpa: manager.currentUserInfoCard?.gpa ?? 0.0, sat: manager.currentUserInfoCard?.sat ?? 0.0, tofel: manager.currentUserInfoCard?.tofel ?? 0.0,gre:manager.currentUserInfoCard?.gre ?? 0.0,avatarURL: manager.currentUser?.avatarImageUrl ?? manager.DefaultAvatarUrl,degree:manager.currentUserInfoCard?.degree ?? "Master")
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
            }
            
        }
    }
}

struct HomeViewInMeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewInMeView().environmentObject(AppManager())
    }
}
