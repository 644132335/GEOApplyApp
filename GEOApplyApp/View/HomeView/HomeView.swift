//
//  HomeView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    VStack{
                        NavigationLink(destination: ApplyDetail()){
                            ApplyInfoCard().padding(3)
                        }
                        ApplyInfoCard().padding(3)
                        ApplyInfoCard().padding(3)
                        ApplyInfoCard().padding(3)
                        ApplyInfoCard().padding(3)
                        ApplyInfoCard().padding(3)
                    }
                }
            }.navigationTitle("Explore")
        }
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
