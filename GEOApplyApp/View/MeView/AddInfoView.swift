//
//  AddInfoView.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/23/22.
//

import SwiftUI

struct AddInfoView: View {
    @EnvironmentObject var manager : AppManager
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var birthday = Date()
    @State private var schoolname: String = ""
    @State private var userAge: String = ""
    @State private var selectGender = "初中"
    @State private var selectBackground = "男"
    @State private var newsSend = false
    @Environment(\.dismiss) var dismiss
   
    
    let  grade = ["初中", "高中", "大学本科", "大专", "研究生"]
    let userGender = ["男","女"]
    
    var body: some View {
            VStack {
                Form{
                    Section(header: Text("账户信息")){
                        TextField("添加用户名", text: $username)
                        TextField("添加邮箱", text: $email)
                    }
                    Section(header: Text("个人信息")){
                        TextField("年龄", text: $userAge)
                        
                        Picker("性别", selection: $selectGender){
                            ForEach(userGender, id: \.self){
                                Text($0)
                            }
                        }
                        DatePicker("生日日期", selection: $birthday, displayedComponents: .date) 
                        Picker("学术背景", selection: $selectBackground){
                            ForEach(grade, id: \.self){
                                Text($0)
                            }
                        }
                    }
                    Section(header: Text("学校信息")){
                        TextField("学校名称", text: $schoolname)
                        Toggle("开启推送", isOn: $newsSend)
                            .toggleStyle(SwitchToggleStyle(tint: manager.themeColor))
                    }
                }
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            dismiss()
                        }label: {
                            Label("cancel", systemImage: "xmark").labelStyle(.iconOnly)
                        }
                    }

                })
                .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.inline)
            }
    }
}

struct AddInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AddInfoView()
    }
}
