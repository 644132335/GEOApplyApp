//
//  changeInfoView.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/14/22.
//

import SwiftUI

struct changeInfoView: View {
    @EnvironmentObject var manager : AppManager
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var birthday = Date()
    @State private var schoolname: String = ""
    @State private var userAge: String = ""
    @State private var selectBackground = "初中"
    
 //   @State private var newsSend = false
    
    @State private var showingGenderOptions = false
    @State private var genderSelection = "None"
    @State private var showingBackgroundOptions = false
    @State private var backgroundSelection = "None"
    
    @Environment(\.dismiss) var dismiss
   
    @State private var changeDialog = false

    
    var body: some View {
    //    NavigationView{
            
            List{
                Section(header: Text("User Information")){
                    TextField("Username", text: $manager.meUsername)
                    TextField("Email", text: $manager.meEmail)
                }
                Section(header: Text("Basic Information")){
                    

                    Button(action: {
                        showingBackgroundOptions = true
                    }) {
                        SettingLine(imageName: "graduationcap.circle", color: .blue, title: "当前学历",option: backgroundSelection)
                    }.confirmationDialog("Select Your Current Education Level", isPresented: $showingBackgroundOptions, titleVisibility: .visible){
                        Button("初中"){
                            backgroundSelection = "初中"
                        }
                        Button("高中"){
                            backgroundSelection = "高中"
                        }
                        Button("大专"){
                            backgroundSelection = "大专"
                        }
                        Button("本科"){
                            backgroundSelection = "本科"
                        }
                        Button("研究生"){
                            backgroundSelection = "研究生"
                        }
                    }
                    
                    DatePicker(selection: $birthday, displayedComponents: .date){
                        Label("生日日期", systemImage: "gift")
                    }
                    
                    
                }
                Section(header: Text("学校信息")){
                    TextField("学校名称", text: $schoolname)
                    
                }
                
                Section(footer: Text("保存后将更改账户信息。")){
                    Button(action: {
                        changeDialog = true
                    }){
                        HStack{
                            Spacer()
                            Text("更改")
                                .foregroundColor(Color.red)
                            Spacer()
                        }
                    }
                    .padding(5)
                    .confirmationDialog("Are you sure you want Change Your Account?", isPresented:$changeDialog, titleVisibility: .visible){
                            Button(action: {
                                dismiss()
                            }, label: {
                                Text("Save")

                            })
                            Button(action: {
                                changeDialog = false
                            }, label: {
                                Text("Not Now")
                            })

                        }
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        dismiss()
                    }label: {
                        Label("cancel", systemImage: "arrow.uturn.backward").labelStyle(.iconOnly)
                    }
                }
            })
            .navigationTitle("账号与安全")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct changeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        changeInfoView()
    }
}
