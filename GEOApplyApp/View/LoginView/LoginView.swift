//
//  LoginView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/17.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("checked") private var checked=false
    @EnvironmentObject var manager : AppManager
    @State var email=""
    @State var password=""
    @FocusState private var isFocused: Bool
    var body: some View {
        NavigationView{
            
            ScrollView{
            VStack{
                Group{
                Spacer().frame(height:100)
                Image("GEOtitle").resizable().scaledToFit().padding()
                    
                    //login section
                    //email
                    HStack{
                        Image(systemName: "envelope").foregroundStyle(manager.LoginbuttonColor).frame(width: manager.screenWidth*0.07, height: manager.screenWidth*0.07).padding(2)
                        TextField("Email", text: $manager.email).font(.title2)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .focused($isFocused)
                            .keyboardType(.emailAddress)
                    }
                    .padding(EdgeInsets(top: 5, leading: 30, bottom: 0, trailing: 30))
                    Divider()
                        .frame(height: 1)
                        .padding(.horizontal, 30)
                        .background(manager.themeColor)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    
                    //password
                    HStack{
                        Image(systemName: "lock").foregroundStyle(manager.LoginbuttonColor).frame(width: manager.screenWidth*0.07, height: manager.screenWidth*0.07).padding(2)
                        SecureField("Password", text: $manager.password).font(.title2)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .focused($isFocused)
                    }
                    
                    .padding(EdgeInsets(top: 5, leading: 30, bottom: 0, trailing: 30))
                    
                    Divider()
                 .frame(height: 1)
                 .padding(.horizontal, 30)
                 .background(manager.themeColor)
                 .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                }
                HStack{
                    Spacer().frame(width:manager.screenWidth*0.09)
                    Image(systemName: checked ? "checkmark.square.fill" : "square")
                        .foregroundColor(manager.themeColor)
                        .onTapGesture {
                            self.checked.toggle()
                        }
                    Text("Remeber me").font(.footnote).foregroundColor(manager.themeColor)
                    Spacer()
                }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10))
                

                //error message
                Text(manager.signinerro).font(.subheadline).foregroundColor(.red).padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                
                //login button
                Button(action: {
                    isFocused=false
                    guard !manager.email.isEmpty, !manager.password.isEmpty else{
                        return
                    }
                    manager.signIn(email: manager.email, password: manager.password)
                    manager.saveEmail()
                    if checked==true{
                        manager.savePassword()
                    }
                }){
                    Text("Login").foregroundStyle(manager.LoginbuttonColor).font(.title2).padding(EdgeInsets(top: 10, leading: manager.screenWidth*0.36, bottom: 10, trailing: manager.screenWidth*0.36)).background(RoundedRectangle(cornerRadius: 10).stroke(manager.LoginbuttonColor, lineWidth: 3))
                }.padding(5).shadow(radius: 5)
                    
                //register button
                NavigationLink(destination: SignupView()){
                    Text("Sign up").foregroundColor(.white).font(.title2).padding(EdgeInsets(top: 10, leading: manager.screenWidth*0.34, bottom: 10, trailing: manager.screenWidth*0.34)).background(RoundedRectangle(cornerRadius: 10).foregroundStyle(manager.LoginbuttonColor))
                }.padding(5).shadow(radius: 5)

                
                NavigationLink(destination: ContentView()){
                    Text("SKIP")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }.padding()
                Spacer()
            
            }} .navigationViewStyle(StackNavigationViewStyle())
        }.onAppear{
            manager.signedIn=manager.isSignedIn
            manager.loadEmail()
            if checked==true{
                manager.loadpassword()
            }else{
                manager.password=""
            }
           
        }
    }
}


