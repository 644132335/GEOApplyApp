//
//  AddInfoView.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/23/22.
//

import SwiftUI

struct AddInfoView: View {
    @State private var isShowingSheet = false
    @EnvironmentObject var manager : AppManager
    private var genderArray=["Male","Female","Other"]
    private var degreeArray=["Bachelor","Master","Doctor"]
    //   @State private var newsSend = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //    NavigationView{
        
        Form{
            // user info
            Section(header: Text("User Information")){
                TextField("Username", text: $manager.meUsername)
                TextField("Email", text: $manager.meEmail)
            }
            Section(header: Text("Basic Information")){
                //age setting
                Picker("Age",selection: $manager.meAge){
                    ForEach(0...100,id:\.self){
                        Text("\($0)")
                    }
                }
                
                //gender setting
                Picker("Gender",selection: $manager.meGender){
                    ForEach(genderArray,id:\.self){
                        Text($0)
                    }
                }
                
                
                //School
                Picker("School",selection: $manager.meSchool){
                    ForEach(manager.schools){
                        Text($0.schoolName).tag($0.schoolName)
                    }
                }
                
                //major
                NavigationLink(destination: ChangeMajorView()){
                    HStack{
                        Text("Major")
                        Spacer()
                        Text(manager.UsrMajor).opacity(0.5)
                    }
                }
                //country
                NavigationLink(destination: ChangeNationView()){
                    HStack{
                        Text("Country")
                        Spacer()
                        Text(manager.UsrNation).opacity(0.5)
                    }
                }
                
            }
                
                
            Section(header:Text("Score"),footer:Text("(Note: Choose degree you are applying for and Enter 0 if not taken certain test above)")){
                    //Degree
                    Picker("Apply For",selection: $manager.meDegree){
                        ForEach(degreeArray,id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented).padding(5)
                    
                    if manager.meDegree=="Bachelor"{
                        Section{
                            VStack{
                                Text("SAT").bold().font(.title2).opacity(0.5)
                                Slider(value: $manager.meSat, in: 0...1600,step:1)
                                Text(String(format: "%.0f", manager.meSat)).bold().font(.title2).opacity(0.5)
                            }
                        }
                        Section{
                            VStack{
                                Text("TOFEL").bold().font(.title2).opacity(0.5)
                                Slider(value: $manager.meTofel, in: 0...120,step:1)
                                Text(String(format: "%.0f", manager.meTofel)).bold().font(.title2).opacity(0.5)
                            }
                        }
                        Section{
                            VStack{
                                Text("GPA").bold().font(.title2).opacity(0.5)
                                Slider(value: $manager.meGPA, in: 0...4,step:0.01)
                                Text(String(format: "%.2f", manager.meGPA)).bold().font(.title2).opacity(0.5)
                            }
                        }
                    }else if manager.meDegree=="Master"{
                        Section{
                            VStack{
                                Text("GRE").bold().font(.title2).opacity(0.5)
                                Slider(value: $manager.meGRE, in: 0...320,step:1)
                                Text(String(format: "%.0f", manager.meGRE)).bold().font(.title2).opacity(0.5)
                            }
                        }
                        Section{
                            VStack{
                                Text("TOFEL").bold().font(.title2).opacity(0.5)
                                Slider(value: $manager.meTofel, in: 0...120,step:1)
                                Text(String(format: "%.0f", manager.meTofel)).bold().font(.title2).opacity(0.5)
                            }
                        }
                        Section{
                            VStack{
                                Text("GPA").bold().font(.title2).opacity(0.5)
                                Slider(value: $manager.meGPA, in: 0...4,step:0.01)
                                Text(String(format: "%.2f", manager.meGPA)).bold().font(.title2).opacity(0.5)
                            }
                        }
                    }else{
                        Section{
                            VStack{
                                Text("TOFEL").bold().font(.title2).opacity(0.5)
                                Slider(value: $manager.meTofel, in: 0...120,step:1)
                                Text(String(format: "%.0f", manager.meTofel)).bold().font(.title2).opacity(0.5)
                            }
                        }
                        Section{
                            VStack{
                                Text("GPA").bold().font(.title2).opacity(0.5)
                                Slider(value: $manager.meGPA, in: 0...4,step:0.01)
                                Text(String(format: "%.2f", manager.meGPA)).bold().font(.title2).opacity(0.5)
                            }
                        }
                    }
                }
            
            Section(header:Text("application status"),footer:Text("Note: Profile will not be created unless you add at least 1 school!")){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(manager.schoolResults.indices,id:\.self){i in
                                schoolApplyCard(result: manager.schoolResults[i].result, school: manager.schoolResults[i].schoolName, schoolImageURL: manager.schoolResults[i].schoolurl)
                       
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
                }}
            Section(header:Text("Application Process")){
                TextEditor(text:$manager.UsrIntro)
                    
            }
                
            Section(footer: Text("Information will not updated unless you clicked save")){
                Button(action: {
                    //save me info
                    if manager.schoolResults != []{
                        manager.createUserInfoCard()
                    }
                    manager.saveMeInfo()
                    dismiss()
                }){
                    HStack{
                        Spacer()
                        Text("SAVE")
                            .foregroundColor(Color.green)
                        Spacer()
                    }
                }
                .padding(5)
                
            }
        }.sheet(isPresented: $isShowingSheet){
            AddSchoolView(isShowingSheet: $isShowingSheet)
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
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
        
        
        //    }
        
        
    }
}

//major
struct ChangeMajorView: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        List{
            TextField("Major",text: $manager.UsrMajor)
        }.navigationTitle("Enter Your Major")
    }
}

//nation
struct ChangeNationView: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        List{
            TextField("Country",text: $manager.UsrNation)
        }.navigationTitle("Enter Your Country")
    }
}




struct AddInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AddInfoView()
    }
}
