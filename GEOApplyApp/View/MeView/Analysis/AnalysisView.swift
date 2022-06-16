//
//  ProfitView.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct AnalysisView: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        VStack{
            Spacer().frame(height: manager.screenHeight*0.02)
            HStack{
                RingCard(percent: 70, chartName: "SAT score",fullscore: 1600, formatForScore: "%.0f")
                Spacer().frame(width: manager.screenWidth*0.05)
                RingCard(percent: 70, chartName: "GPA", fullscore: 4.0, formatForScore: "%.2f")

            }.padding(.horizontal)
            MedianChart()
        }
        
    }
}

struct ProfitView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
