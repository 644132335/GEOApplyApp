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
            VStack{
                Spacer().frame(height:50)
                Image("GEOtitle").resizable().scaledToFit().padding()
                
                //login section
                TextField("Username", text: $username).font(.title2)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                TextField("Email", text: $email).font(.title2)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                TextField("Password", text: $password).font(.title2)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                Text(manager.signuperro).font(.subheadline).foregroundColor(.red).padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                HStack{
                    //register button
                    Button(action: {
                        manager.signUp(email: email, password: password, username:username)
                    }){
                        Text("Create").foregroundColor(.white).font(.title2).padding(EdgeInsets(top: 5, leading: 45, bottom: 5, trailing: 45)).padding(5).background(RoundedRectangle(cornerRadius: 10).fill(manager.themeColor))
                    }.padding(5)
                    
                }
                                
                Spacer()
            
            } .navigationViewStyle(StackNavigationViewStyle())
        }.navigationTitle("Create Account").navigationBarTitleDisplayMode(.inline)
        
    }
}


