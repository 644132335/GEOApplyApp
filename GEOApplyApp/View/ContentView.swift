//
//  ContentView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

//let blue1 = UIColor(red: 0.4667, green: 0.7922, blue: 0.9765, alpha: 1)

struct ContentView: View {
    @EnvironmentObject var manager : AppManager
    
    var body: some View {
            TabView{
                HomeView().tabItem{Label("Home", systemImage: "house.fill")}.navigationTitle("Explore")
                CommunityView().tabItem{Label("Community", systemImage: "person.3.fill")}
                MeView().tabItem{Label("Me", systemImage: "person.fill")}
            }
            .onAppear(){
                UITabBar.appearance().backgroundColor=UIColor.white
            }

            .navigationViewStyle(StackNavigationViewStyle())
        
    }
}


