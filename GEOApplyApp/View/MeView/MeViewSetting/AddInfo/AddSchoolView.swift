//
//  AddSchoolView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/6/20.
//

import SwiftUI

struct AddSchoolView: View {
    @EnvironmentObject var manager : AppManager
    @Binding var isShowingSheet : Bool
    @State var errorMessageMajor=""
    @State var major=""
    var ApplyResult = ["accepted","waiting","rejected"]
    var body: some View {
        NavigationView{
        Form{
            Section(header:Text("Application Status"),footer:Text("Note: swipe left to delete or use edit on top right")){
                List{
                    if manager.schoolResults.isEmpty{
                        HStack{
                            Text("")
                        }
                    }
                    ForEach(manager.schoolResults.indices,id:\.self){i in
                        
                        if manager.schoolResults[i].result=="accepted"{
                            HStack{
                                Image(systemName: "checkmark").padding(2).foregroundColor(Color.green)
                                Text(manager.schoolResults[i].schoolName)
                            }
                        }else if manager.schoolResults[i].result=="rejected"{
                            HStack{
                                Image(systemName: "xmark").padding(2).foregroundColor(Color.red)
                                Text(manager.schoolResults[i].schoolName)
                            }
                        }else{
                            HStack{
                                Image(systemName: "questionmark").padding(2).foregroundColor(Color.yellow)
                                Text(manager.schoolResults[i].schoolName)
                            }
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
            Section(header:Text("Major Applied"),footer:Text(errorMessageMajor).foregroundColor(.red)){
                TextField("Major",text: $manager.UsrSchoolMajor).lineLimit(1)
            }
            
            //add school result button
            Section{
            Button(action: {
                if manager.UsrSchoolMajor==""{
                    errorMessageMajor="Please Fill Your Major"
                }else{
                    manager.addSchoolResult(name: manager.UsrAppliedSchool, result: manager.UsrSchoolResult,major: manager.UsrSchoolMajor)
                    manager.UsrSchoolMajor=""
                }
                
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
    func delete(at offsets: IndexSet) {
        manager.schoolResults.remove(atOffsets: offsets)
        }
}


