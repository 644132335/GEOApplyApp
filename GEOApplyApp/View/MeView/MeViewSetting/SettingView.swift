//
//  SettingVIew.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/8/22.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var manager : AppManager
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject var authenticationManager = AuthenticationManager()
   // @EnvironmentObject var authenticationManager: AuthenticationManager

    
    @State private var newsSend = false
    @State private var openSignOutDialog = false
    @Environment(\.dismiss) var dismiss
    
    // Mail us
    @Environment(\.openURL) var openURL
    @State private var email = SupportEmail(toAddress: "edmundzxy@gmail.com",
                                     subject: "Support Email",
                                     messageHeader: "Please describe your issue or feedback below")
    var body: some View {
        if authenticationManager.isAuthenticated {
           
//                Section(footer: Text("更改个人信息")){
//                    NavigationLink(destination: changeInfoView()) {
//                        HStack{
//                            Spacer().frame(width: manager.screenWidth*0.011)
//                            Image(systemName: "person.crop.circle")
//                                .foregroundColor(.blue)
//                            Spacer().frame(width: manager.screenHeight*0.015)
//
//                            Text("账号与安全")
//                        }
//                    }
//                }
                
            changeInfoView()
               
        }
        else{
            List{
                Section(footer: Text("更改个人信息")){
                    NavigationLink(destination: changeInfoView()) {
                        HStack{
                            Spacer().frame(width: manager.screenWidth*0.011)
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(.blue)
                            Spacer().frame(width: manager.screenHeight*0.015)

                            Text("账号与安全")
                        }
                    }
                }
                
                
                Section(header: Text("通知")){
                    Toggle("开启推送", isOn: $newsSend)
                        .toggleStyle(SwitchToggleStyle(tint: manager.themeColor))
                    
                    Button(action: {
                        email.send(openURL: openURL)
                    }){
                        HStack{
                            Image(systemName: "envelope.circle")
                                .foregroundColor(.blue)
                            Text("帮助与反馈")
                                .foregroundColor(isDarkMode ? .white : .black)
                                
                        }
                    }
                    .padding(5)
                        
                    
                }
                
                Section(header: Text("背景")){
                    Toggle("Dark Mode", isOn: $isDarkMode)
                        .toggleStyle(SwitchToggleStyle(tint: manager.themeColor))
                }
                
                
                Section(header: Text("退出账户"), footer: Text("退出后需要重新登录。")){
                    Button(action: {
                        openSignOutDialog = true
                    }){
                        HStack{
                            Spacer()
                            Text("Sign Out")
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                    }
                    .padding(5)
                    .confirmationDialog("Are you sure you want sign out?", isPresented:$openSignOutDialog, titleVisibility: .visible){
                            Button(action: {
                                manager.signOut()
                            }, label: {
                                Text("Sign Out")

                            })
                            Button(action: {
                                openSignOutDialog = false
                            }, label: {
                                Text("Not Now")
                            })

                        }
                }.listRowBackground(Color.red)
                
            }
            //.listStyle(GroupedListStyle())
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        dismiss()
                    }label: {
                        Label("cancel", systemImage: "arrow.uturn.backward").labelStyle(.iconOnly)
                    }
                }

            })
            .navigationTitle("Setting")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
