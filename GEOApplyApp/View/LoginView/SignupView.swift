//
//  SignupView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/18.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var manager : AppManager
    @State var email=""
    @State var password=""
    @State var username=""
    var body: some View {
        ScrollView{
            Group{
            VStack{
                Spacer().frame(height:50)
                Image("GEOtitle").resizable().scaledToFit().padding()
                
                //login section
                HStack{
                    Image(systemName: "person").foregroundStyle(manager.LoginbuttonColor).frame(width: manager.screenWidth*0.07, height: manager.screenWidth*0.07).padding(2)
                    TextField("Username", text: $username).font(.title2)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                .padding(EdgeInsets(top: 5, leading: 30, bottom: 0, trailing: 30))
                
                Divider()
                    .frame(height: 1)
                    .padding(.horizontal, 30)
                    .background(manager.themeColor)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                
                
                HStack{
                    Image(systemName: "envelope").foregroundStyle(manager.LoginbuttonColor).frame(width: manager.screenWidth*0.07, height: manager.screenWidth*0.07).padding(2)
                    TextField("Email", text: $email).font(.title2)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }
                .padding(EdgeInsets(top: 5, leading: 30, bottom: 0, trailing: 30))
                Divider()
                    .frame(height: 1)
                    .padding(.horizontal, 30)
                    .background(manager.themeColor)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                
                
                HStack{
                    Image(systemName: "lock").foregroundStyle(manager.LoginbuttonColor).frame(width: manager.screenWidth*0.07, height: manager.screenWidth*0.07).padding(2)
                    TextField("Password", text: $password).font(.title2)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                .padding(EdgeInsets(top: 5, leading: 30, bottom: 0, trailing: 30))
                
                Divider()
                    .frame(height: 1)
                    .padding(.horizontal, 30)
                    .background(manager.themeColor)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                Text(manager.signuperro).font(.subheadline).foregroundColor(.red).padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                HStack{
                    //register button
                    Button(action: {
                        manager.signUp(email: email, password: password, username:username)
                    }){
                        Text("Create").foregroundColor(.white).font(.title2).padding(EdgeInsets(top: 10, leading: manager.screenWidth*0.35, bottom: 10, trailing: manager.screenWidth*0.35)).background(RoundedRectangle(cornerRadius: 10).foregroundStyle(manager.LoginbuttonColor))
                    }.padding(5).shadow(radius: 5)
                    
                }
            }
                Spacer()
            
            } .navigationViewStyle(StackNavigationViewStyle())
        }.navigationTitle("Create Account").navigationBarTitleDisplayMode(.inline)
        
    }
}


