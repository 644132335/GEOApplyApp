//
//  ContentView.swift
//  Me View
//
//  Created by Chris Yang on 5/12/22.
//

import SwiftUI
import SDWebImageSwiftUI
struct MeView: View {
    @EnvironmentObject var manager : AppManager
    @State private var showAddInfoView = false
//    @State var authenticationManager = AuthenticationManager()
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack{
                    VStack {
                        HStack{
                            Button(action: {
                                    manager.changeAcountImage = true
                                    manager.openConfirmationDialog = true
                                }, label: {
                                    CircleImage()
                                }).padding(EdgeInsets(top: manager.screenWidth*0.1, leading: 0, bottom: manager.screenWidth*0.0, trailing: 0))

                                .confirmationDialog("Alubms/Camera", isPresented:$manager.openConfirmationDialog, titleVisibility: .visible){
                                        Button(action: {
                                            manager.source = .library
                                            manager.showPicker = true
                                        }, label: {
                                            Text("Alubms")
                                        })
                                        Button(action: {
                                            manager.source = .camera
                                            manager.showPicker = true
                                        }, label: {
                                            Text("Camera")
                                        })
                                    }
                            Spacer().frame(width: manager.screenWidth*0.05)
                            VStack(alignment: .leading){
                                Text(manager.currentUser?.name ?? "unknown")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                Spacer().frame(height: manager.screenWidth*0.02)
                                Group{
                                    HStack{
                                        Text(manager.currentUser?.email ?? "Unknown").font(.caption)
                                            .fontWeight(.light)
                                    }.lineLimit(1)
                                    HStack{
                                        Text(manager.currentUser?.school ?? "Unknown").font(.caption)
                                            .fontWeight(.light)
                                    }.lineLimit(1)
                                    
                                }
                            }.padding(EdgeInsets(top: manager.screenWidth*0.1, leading: 0, bottom: manager.screenWidth*0.0, trailing: 0))
                            
                            Spacer()
                        
                        }.fullScreenCover(isPresented: $manager.showPicker, onDismiss: {manager.saveAvatar()}) {
                            ImagePicker(selectedImage: $manager.imageSelected, sourceType: manager.source == .library ? .photoLibrary : .camera)
                                }
                        .padding(.horizontal)
                      //  .padding(.vertical)
                        
                        HStack{
                            HStack{
                                Text("\(manager.currentUser?.age ?? 0) years old").font(.caption)
                                    .fontWeight(.light)
                                    .padding(manager.screenWidth*0.02)
                                    .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray).opacity(0.2)
                                            )
                            }
                            .lineLimit(1)
                            HStack{
                                Text(manager.currentUser?.gender ?? "Unknown").font(.caption)
                                    .fontWeight(.light)
                                    .padding(manager.screenWidth*0.02)
                                    .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray).opacity(0.2)
                                            )
                            }.lineLimit(1)
                            Spacer()
                        }.padding(EdgeInsets(top: 0, leading: manager.screenWidth*0.05, bottom: 0, trailing: manager.screenWidth*0.05))
                        
                        HStack{
                            Group{
                                VStack{
                                    Text("\(manager.currentUserInfoCard?.view ?? 0)")
                                        .fontWeight(.light)
                                    Text("View")
                                        .fontWeight(.bold)
                                }
                                VStack{
                                    Text("\(manager.currentUserInfoCard?.follow ?? 0)")
                                        .fontWeight(.light)
                                    Text("Follower")
                                        .fontWeight(.bold)
                                }
                            }
                            .padding()
                            .foregroundColor(.black)
                            
                            
                            Spacer()
                            
                            EditProfileButton().padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: manager.screenWidth*0.05))
                            
                            NavigationLink(destination: SettingView()){
                                Image(systemName: "gearshape").foregroundColor(.black)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray).opacity(0.2)
                                    .frame(width: manager.screenWidth*0.1, height: manager.screenWidth*0.1)
                                    )
                            Spacer().frame(width:manager.screenWidth*0.02)
                        }
                        
                        VStack{
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 20){
                                TopTab()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
                            .padding(.vertical)
                            .background(.white)
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                        }
                    } // vstack
                   // .navigationTitle("Personal Center")
                    .navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.inline)
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            NavigationLink(destination: SettingView()){
//                                Image(systemName: "gearshape")
//                            }
//                        }
//                    }
                    
                    //zstack
                }.background(manager.LoginbuttonColor)
                    

            }.ignoresSafeArea(.all)
        }//.navigationview
        .sheet(isPresented: $showAddInfoView){
            AddInfoView()
        }
     
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView().environmentObject(AppManager())
    }
}
