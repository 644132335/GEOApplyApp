//
//  ContentView.swift
//  Me View
//
//  Created by Chris Yang on 5/12/22.
//

import SwiftUI

struct MeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                    VStack {
                            Spacer().frame(height: 100)
                            BasicCard(userName: "Matthew1234", likeNumber: 100, viewNumber: 45, postNumber: 10)
                                .padding()
                            Spacer().frame(height: 10)
                            TopTab()
                        }
                        .padding()
                        .navigationTitle("Personal Center")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                NavigationLink(destination: SettingView()){
                                    Image(systemName: "gearshape")
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
