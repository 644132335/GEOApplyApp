//
//  ContentView.swift
//  Me View
//
//  Created by Chris Yang on 5/12/22.
//

import SwiftUI

struct MeView: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer().frame(height: manager.screenHeight*0.05)
                    BasicCard(userName: manager.currentUser?.name ?? "unknown", likeNumber: 100, viewNumber: 45, postNumber: 10)
                        .padding()
                    Spacer().frame(height: manager.screenHeight*0.002)
                    TopTab()
                    Button(action: {
                        manager.signOut()
                    }){
                        Text("Sign Out").foregroundColor(.white).font(.title2).padding(EdgeInsets(top: 10, leading: manager.screenWidth*0.33, bottom: 10, trailing: manager.screenWidth*0.33)).background(RoundedRectangle(cornerRadius: 10).fill(.red.opacity(0.8)))
                    }.padding(5)
                }
                .padding()
                .navigationTitle("Personal Center")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddInfoView()){
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        }
                    }
                        }
            }
        }
     
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
