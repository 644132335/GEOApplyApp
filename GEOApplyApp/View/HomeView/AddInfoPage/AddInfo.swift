////
////  AddInfo.swift
////  GEOApplyApp
////
////  Created by Matthew Jiang on 2022/5/16.
////
//
//import SwiftUI
//
//struct AddInfo: View {
//    @EnvironmentObject var manager : AppManager
//    @Environment(\.dismiss) var dismiss
//    @State private var name=""
//    @State private var isShowingSheet = false
//    @State private var school="school"
//    @State private var nation=""
//    @State private var major=""
//    @State private var sat=0.0
//    @State private var tofel=0.0
//    @State private var gpa=0.0
//    @State private var intro=" "
//    var body: some View {
//        ScrollView{
//            VStack{
//                Form{
//                    TextField("School", text: $school).font(.title2)
//                }
//                Button(action: {
//                    isShowingSheet.toggle()
//                }){
//                    HStack{
//                        Text(school).foregroundColor(Color.gray.opacity(0.6)).font(.title2)
//                        Spacer()
//                        Image(systemName: "arrowtriangle.down.fill").foregroundColor(Color.gray.opacity(0.6))
//                    }.padding(EdgeInsets(top: 15, leading: manager.screenWidth*0.23, bottom: 15, trailing: manager.screenWidth*0.23)).background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 5))
//                }
//                .fixedSize()
//
//                TextField("Nationality", text: $nation).font(.title2)
//                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 5)).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
//                TextField("Major", text: $major).font(.title2)
//                    .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 5)).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
//                Group{
//                    HStack{
//                        VStack{
//                            Text("SAT").bold().font(.title2).opacity(0.5)
//                            Slider(value: $sat, in: 0...1600,step:1)
//                            Text(String(format: "%.0f", sat)).bold().font(.title2).opacity(0.5)
//                        }
//                    } .padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 5)).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
//
//                    VStack{
//                        Text("TOFEL").bold().font(.title2).opacity(0.5)
//                        Slider(value: $tofel, in: 0...120,step:1)
//                        Text(String(format: "%.0f", tofel)).bold().font(.title2).opacity(0.5)
//                    }.padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 5)).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
//
//                    VStack{
//                        Text("GPA").bold().font(.title2).opacity(0.5)
//                        Slider(value: $gpa, in: 0...4,step:0.01)
//                        Text(String(format: "%.2f", gpa)).bold().font(.title2).opacity(0.5)
//                    }.padding(15).background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 5)).padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
//                }
//
//                VStack{
//                    HStack(alignment:.center){
//                        Text("Introduction").font(.title).bold()
//                    }
//                    TextEditor(text:$intro)
//                        .frame(height:manager.screenHeight*0.2)
//                        .cornerRadius(10)
//                        .shadow(radius: 5)
//                        //.colorMultiply(manager.backgroundColor)
//                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 5, trailing: 30))
//                }.padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
//
//                HStack{
//                    Button(action: {
////                        manager.createUserInfoCard(username: name, school: school, nationality: nation, major: major, sat: sat, tofel: tofel, gpa: gpa, intro: intro)
////                        manager.addUser(userid: userid, name: name, school: school, nation: nation, major: major, sat: sat, tofel: tofel, gpa: gpa, intro: intro)
//                        dismiss()
//                    }){
//                        Text("SUBMIT").foregroundColor(.white).font(.title2).padding(EdgeInsets(top: 10, leading: manager.screenWidth*0.34, bottom: 10, trailing: manager.screenWidth*0.34)).background(RoundedRectangle(cornerRadius: 10).fill(manager.themeColor))
//                    }
//                }
//            }
//            Spacer()
//        }
//        .sheet(isPresented: $isShowingSheet){
//            Text("worked")
//        }
//        .navigationTitle("Add Your Info")
//            .onAppear{
//                if manager.currentUser?.profile==true{
//                    name=manager.currentUserInfoCard?.name ?? ""
//                    school=manager.currentUserInfoCard?.school ?? ""
//                    nation=manager.currentUserInfoCard?.nation ?? ""
//                    major=manager.currentUserInfoCard?.major ?? ""
//                    sat=manager.currentUserInfoCard?.sat ?? 0.0
//                    tofel=manager.currentUserInfoCard?.tofel ?? 0.0
//                    gpa=manager.currentUserInfoCard?.gpa ?? 0.0
//                    intro=manager.currentUserInfoCard?.intro ?? ""
//                }
//            }
//
//    }
//}
//
//struct AddInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        AddInfo()
//    }
//}
