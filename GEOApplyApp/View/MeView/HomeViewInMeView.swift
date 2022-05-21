//
//  HomeView.swift
//  Me View
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct HomeViewInMeView: View {
    var body: some View {
        VStack {
            HStack{
                RingCard(percent: 30, chartName: "SAT score")
                Spacer().frame(width: 25)
                RingCard(percent: 70, chartName: "GPA")
            }.padding()
            
            InfoCard(daysLeft: "999 days left", schoolName: "Penn State", country: "China", major: "Computer Science")
            MedianChart()
                
        }
    }
}

struct HomeViewInMeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewInMeView()
    }
}
