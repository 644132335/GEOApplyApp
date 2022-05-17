//
//  LoginView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/17.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var manager : AppManager
    @State var email=""
    @State var password=""
    var body: some View {
        NavigationView{
            VStack{
                Spacer().frame(height:100)
                Image("GEOtitle").resizable().scaledToFit().padding()
                TextField("Email", text: $email).font(.title2)
                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                TextField("Password", text: $password).font(.title2)
                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                //Spacer().frame(height:40)
                HStack{
                    //register button
                    Button(action: {
                    }){
                        Text("Sign up").foregroundColor(.white).font(.title2).padding(EdgeInsets(top: 5, leading: 45, bottom: 5, trailing: 45)).padding(5).background(RoundedRectangle(cornerRadius: 10).fill(manager.themeColor))
                    }.padding(5)
                    //Spacer().frame(width:50)
                    //login button
                    Button(action: {
                    }){
                        Text("Login").foregroundColor(manager.themeColor).font(.title2).padding(EdgeInsets(top: 5, leading: 50, bottom: 5, trailing: 50)).padding(5).background(RoundedRectangle(cornerRadius: 10).stroke(manager.themeColor, lineWidth: 3))
                    }.padding(5)

                }
                                
                NavigationLink(destination: ContentView()){
                    Text("SKIP")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }.padding()
                Spacer()
            
            } .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


