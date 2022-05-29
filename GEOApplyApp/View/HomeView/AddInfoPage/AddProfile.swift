//
//  AddProfile.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/29.
//

import SwiftUI

struct AddProfile: View {
    
    @EnvironmentObject var manager : AppManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form{
            Section(header:Text("general info")){
                TextField("School", text: $manager.UsrSchool).font(.title2)
                TextField("Nation", text: $manager.UsrNation).font(.title2)
                TextField("Major", text: $manager.UsrMajor).font(.title2)
            }
            
            Section{
                VStack{
                    Text("SAT").bold().font(.title2).opacity(0.5)
                    Slider(value: $manager.UsrSat, in: 0...1600,step:1)
                    Text(String(format: "%.0f", manager.UsrSat)).bold().font(.title2).opacity(0.5)
                }
            }
            Section{
                VStack{
                    Text("TOFEL").bold().font(.title2).opacity(0.5)
                    Slider(value: $manager.UsrTofel, in: 0...120,step:1)
                    Text(String(format: "%.0f", manager.UsrTofel)).bold().font(.title2).opacity(0.5)
                }
            }
            Section{
                VStack{
                    Text("GPA").bold().font(.title2).opacity(0.5)
                    Slider(value: $manager.UsrGPA, in: 0...4,step:0.01)
                    Text(String(format: "%.2f", manager.UsrGPA)).bold().font(.title2).opacity(0.5)
                }
            }
            
            Section(header:Text("Introduction")){
                TextEditor(text:$manager.UsrIntro)
                    
            }
            
            Section{
                Button(action: {
                    manager.createUserInfoCard()
                    dismiss()
                }){
                    HStack{
                        Spacer()
                        Text("Create")
                        Spacer()
                    }
                    
                }
            }
            
        }.navigationTitle("Add Your Info")
            
    }
}

struct AddProfile_Previews: PreviewProvider {
    static var previews: some View {
        AddProfile()
    }
}
