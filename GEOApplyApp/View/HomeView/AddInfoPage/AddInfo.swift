//
//  AddInfo.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/16.
//

import SwiftUI

struct AddInfo: View {
    @EnvironmentObject var manager : AppManager
    @Environment(\.dismiss) var dismiss
    @State private var name=""
    @State private var school=""
    @State private var nation=""
    @State private var major=""
    @State private var sat=0.0
    @State private var tofel=0.0
    @State private var gpa=0.0
    @State private var userid=""
    var body: some View {
        ScrollView{
            VStack{
//                TextField("User ID", text: $userid).font(.title2).padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                TextField("Name", text: $name).font(.title2)
                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                TextField("School", text: $school).font(.title2)
                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                TextField("Nationality", text: $nation).font(.title2)
                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                TextField("Major", text: $major).font(.title2)
                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                HStack{
                    VStack{
                        Text("SAT").bold().font(.title2).opacity(0.5)
                        Slider(value: $sat, in: 0...1600,step:1)
                        Text(String(format: "%.0f", sat)).bold().font(.title2).opacity(0.5)
                    }
                } .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                
                VStack{
                    Text("TOFEL").bold().font(.title2).opacity(0.5)
                    Slider(value: $tofel, in: 0...120,step:1)
                    Text(String(format: "%.0f", tofel)).bold().font(.title2).opacity(0.5)
                }.padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                
                VStack{
                    Text("GPA").bold().font(.title2).opacity(0.5)
                    Slider(value: $gpa, in: 0...4,step:0.01)
                    Text(String(format: "%.2f", gpa)).bold().font(.title2).opacity(0.5)
                }.padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2))).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                HStack{
                    Button(action: {
                        manager.addUser(userid: userid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gpa: gpa)
                        dismiss()
                    }){
                        Text("SUBMIT").foregroundColor(.white).bold().font(.title2).padding(15).background(RoundedRectangle(cornerRadius: 10).fill(manager.themeColor)).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                    }
                }
            }
            Spacer()
        }.navigationTitle("Add Your Info")
        
    }
}

struct AddInfo_Previews: PreviewProvider {
    static var previews: some View {
        AddInfo()
    }
}
