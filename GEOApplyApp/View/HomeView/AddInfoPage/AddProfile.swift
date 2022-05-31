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
    @State private var isShowingSheet = false
    
    var ApplyResult = ["accepted","waiting","rejected"]
    var body: some View {
        Form{
            Section{
                Picker("School",selection: $manager.UsrSchool){
                    ForEach(manager.schools){
                        Text($0.schoolName).foregroundColor(.black.opacity(0.7)).bold().tag($0.schoolName)
                    }
                }
            }
            Section(){
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
            
            Section(header:Text("application status"),footer:Text("Status only update after you press confirm")){
                VStack{
                    ForEach(manager.schoolResults.indices,id:\.self){i in
                        HStack{
                            Spacer()
                            VStack{
                                Text(manager.schoolResults[i].schoolName)
                                Text(manager.schoolResults[i].result)
                                AsyncImage(url: URL(string: manager.schoolResults[i].schoolurl)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: manager.screenWidth*0.15, height: manager.screenWidth*0.15)
                                .padding(5)
                            }
                            Spacer()
                        }
                        
                   
                    }
                }
                Button(action: {
                    //add school result
                    isShowingSheet.toggle()
                }){
                    HStack{
                        Spacer()
                        Text("Modify")
                        Spacer()
                    }
                }            }
            
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
                        Text("Confirm")
                        Spacer()
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingSheet){
            NavigationView{
            Form{
                Section{
                    List{
                        ForEach(manager.schoolResults.indices,id:\.self){i in
                            VStack{
                                Text(manager.schoolResults[i].schoolName)
                                Text(manager.schoolResults[i].result)
                            }
                       
                        }.onDelete(perform: delete)
                
                    }
                }
                Section(header:Text("Pick Your School")){
                    Picker("School",selection: $manager.UsrAppliedSchool){
                        ForEach(manager.schools){
                            Text($0.schoolName).foregroundColor(.black.opacity(0.7)).bold().tag($0.schoolName)
                        }
                    }.pickerStyle(.wheel)
                }
                    Section(header:Text("Application Result")){
                        Picker("Result",selection: $manager.UsrSchoolResult){
                            ForEach(ApplyResult,id: \.self){
                                Text($0).tag($0)
                            }
                        }.pickerStyle(.wheel)
                    }
                
                //add school result button
                Section{
                Button(action: {
                    manager.addSchoolResult(name: manager.UsrAppliedSchool, result: manager.UsrSchoolResult)
                }){
                    HStack{
                        Spacer()
                        Text("Add")
                        Spacer()
                    }
                }
                }
                
                //go back to form
                Section{
                Button(action: { isShowingSheet.toggle()}){
                    HStack{
                        Spacer()
                        Text("Finish")
                        Spacer()
                    }
                }
                }
            }
            .toolbar(){
                EditButton()
            }
                
            }.environmentObject(manager).environment(\.colorScheme, .light)
        }
        .navigationTitle("Add Your Info")
            
    }
    func delete(at offsets: IndexSet) {
        manager.schoolResults.remove(atOffsets: offsets)
        }
}

struct AddProfile_Previews: PreviewProvider {
    static var previews: some View {
        AddProfile().environmentObject(AppManager())
    }
}
