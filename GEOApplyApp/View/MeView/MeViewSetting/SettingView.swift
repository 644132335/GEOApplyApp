//
//  SettingVIew.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/8/22.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var manager : AppManager
    @State private var openSignOutDialog = false
    @Environment(\.dismiss) var dismiss


    var body: some View {
        List{
            Section(){
                NavigationLink(destination:ChangeEmailView()){
                    HStack{
                        Text("Email")
                        Spacer()
                        Text(manager.currentUser?.email ?? "")
                    }
                    
                }
                NavigationLink(destination:(ChangePassword())){
                    HStack{
                        Text("Change Password")
                        
                    }
                    
                }
                NavigationLink(destination:(FeedbackView())){
                    HStack{
                        Text("Feedback")
                    }
                    
                }
            }
            
                
            
            Section(){
                Button(action: {
                    openSignOutDialog = true
                }){
                    HStack{
                        Spacer()
                        Text("Sign Out")
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                }
                .padding(5)
                .confirmationDialog("Are you sure you want sign out?", isPresented:$openSignOutDialog, titleVisibility: .visible){
                    Button(action: {
                        manager.signOut()
                    }, label: {
                        Text("Sign Out")

                            })
                            Button(action: {
                                openSignOutDialog = false
                            }, label: {
                                Text("Not Now")
                            })

                        }
                }.listRowBackground(Color.red)
                
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
            .navigationTitle("Setting")
            .navigationBarTitleDisplayMode(.inline)
        //}
        
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(AppManager())
    }
}
