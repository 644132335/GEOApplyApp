////
////  AddProfile.swift
////  GEOApplyApp
////
////  Created by Matthew Jiang on 2022/5/29.
////
//
//import SwiftUI
//
//struct AddProfile: View {
//
//    @EnvironmentObject var manager : AppManager
//    @Environment(\.dismiss) var dismiss
//    @State private var isShowingSheet = false
//
//    var ApplyResult = ["accepted","waiting","rejected"]
//    var body: some View {
//        Form{
//            Section(header:Text("Choose Your school")){
//                Picker("School",selection: $manager.UsrSchool){
//                    ForEach(manager.schools){
//                        Text($0.schoolName).foregroundColor(.black.opacity(0.7)).bold().tag($0.schoolName)
//                    }
//                }
//            }
//            Section(header:Text("genreal info")){
//                TextField("Nation", text: $manager.UsrNation).font(.title2)
//                TextField("Major", text: $manager.UsrMajor).font(.title2)
//            }
//
//            Section{
//                VStack{
//                    Text("SAT").bold().font(.title2).opacity(0.5)
//                    Slider(value: $manager.UsrSat, in: 0...1600,step:1)
//                    Text(String(format: "%.0f", manager.UsrSat)).bold().font(.title2).opacity(0.5)
//                }
//            }
//            Section{
//                VStack{
//                    Text("TOFEL").bold().font(.title2).opacity(0.5)
//                    Slider(value: $manager.UsrTofel, in: 0...120,step:1)
//                    Text(String(format: "%.0f", manager.UsrTofel)).bold().font(.title2).opacity(0.5)
//                }
//            }
//            Section{
//                VStack{
//                    Text("GPA").bold().font(.title2).opacity(0.5)
//                    Slider(value: $manager.UsrGPA, in: 0...4,step:0.01)
//                    Text(String(format: "%.2f", manager.UsrGPA)).bold().font(.title2).opacity(0.5)
//                }
//            }
//
//            Section(header:Text("application status"),footer:Text("Note: Status only update after you press confirm")){
//                ScrollView(.horizontal, showsIndicators: false){
//                    HStack{
//                        ForEach(manager.schoolResults.indices,id:\.self){i in
//                                schoolApplyCard(result: manager.schoolResults[i].result, school: manager.schoolResults[i].schoolName, schoolImageURL: manager.schoolResults[i].schoolurl)
//
//                        }
//                    }
//
//                }
//                Button(action: {
//                    //add school result
//                    isShowingSheet.toggle()
//                }){
//                    HStack{
//                        Spacer()
//                        Text("Modify")
//                        Spacer()
//                    }
//                }            }
//
//            Section(header:Text("Introduction")){
//                TextEditor(text:$manager.UsrIntro)
//
//            }
//
//            Section{
//                Button(action: {
//                    manager.createUserInfoCard()
//                    dismiss()
//                }){
//                    HStack{
//                        Spacer()
//                        Text("Confirm")
//                        Spacer()
//                    }
//                }
//            }
//        }
//        .sheet(isPresented: $isShowingSheet){
//            NavigationView{
//            Form{
//                Section(header:Text("Application Status"),footer:Text("Note: use edit on top right to delete")){
//                    List{
//                        if manager.schoolResults.isEmpty{
//                            HStack{
//                                Text("")
//                            }
//                        }
//                        ForEach(manager.schoolResults.indices,id:\.self){i in
//
//                            if manager.schoolResults[i].result=="accepted"{
//                                HStack{
//                                    Image(systemName: "checkmark").padding(2).foregroundColor(Color.green)
//                                    Text(manager.schoolResults[i].schoolName)
//                                }
//                            }else if manager.schoolResults[i].result=="rejected"{
//                                HStack{
//                                    Image(systemName: "xmark").padding(2).foregroundColor(Color.red)
//                                    Text(manager.schoolResults[i].schoolName)
//                                }
//                            }else{
//                                HStack{
//                                    Image(systemName: "questionmark").padding(2).foregroundColor(Color.yellow)
//                                    Text(manager.schoolResults[i].schoolName)
//                                }
//                            }
//
//                        }.onDelete(perform: delete)
//
//                    }
//                }
//                Section(header:Text("Pick Your School")){
//                    Picker("School",selection: $manager.UsrAppliedSchool){
//                        ForEach(manager.schools){
//                            Text($0.schoolName).foregroundColor(.black.opacity(0.7)).bold().tag($0.schoolName)
//                        }
//                    }.pickerStyle(.wheel)
//                }
//                    Section(header:Text("Application Result")){
//                        Picker("Result",selection: $manager.UsrSchoolResult){
//                            ForEach(ApplyResult,id: \.self){
//                                Text($0).tag($0)
//                            }
//                        }.pickerStyle(.wheel)
//                    }
//
//                //add school result button
//                Section{
//                Button(action: {
//                    manager.addSchoolResult(name: manager.UsrAppliedSchool, result: manager.UsrSchoolResult)
//                }){
//                    HStack{
//                        Spacer()
//                        Text("Add")
//                        Spacer()
//                    }
//                }
//                }
//
//                //go back to form
//                Section{
//                Button(action: { isShowingSheet.toggle()}){
//                    HStack{
//                        Spacer()
//                        Text("Finish")
//                        Spacer()
//                    }
//                }
//                }
//            }
//            .toolbar(){
//                EditButton()
//            }
//
//            }.environmentObject(manager).environment(\.colorScheme, .light)
//        }
//        .navigationTitle("Add Your Info")
//
//    }
//    func delete(at offsets: IndexSet) {
//        manager.schoolResults.remove(atOffsets: offsets)
//        }
//}
//
//struct AddProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        AddProfile().environmentObject(AppManager())
//    }
//}
