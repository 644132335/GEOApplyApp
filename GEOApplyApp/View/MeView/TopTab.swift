//
//  TopTab.swift
//  Me View
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct TopTab: View {
    
    @State var tabIndex = 0
    
    var body: some View {
        VStack{
            CustomTopTabBar(tabIndex: $tabIndex)
            if tabIndex == 0 {
                HomeViewInMeView()
            }
            else if tabIndex == 1{
                AnalysisView()
            }
            else{
                FavoriteView()
            }  
        }
        .frame(width: UIScreen.main.bounds.width , alignment: .center)
        //.padding(.horizontal, 12)
        Spacer()
    }
}

struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            TabBarButton(text: "Profile", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
            Spacer()
            TabBarButton(text: "Analysis", isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }
            Spacer()
            TabBarButton(text: "Follows", isSelected: .constant(tabIndex == 2))
                .onTapGesture { onButtonTapped(index: 2) }
            Spacer()
        }
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

