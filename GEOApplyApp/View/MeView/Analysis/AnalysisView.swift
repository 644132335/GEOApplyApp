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
            ScrollView(.horizontal,showsIndicators: false){
                // if user apply for master only show gre gpa tofel, if bachelor show sat tofel, others just show gpa and tofel
                if manager.currentUser?.applyDegree=="Master"{
                    HStack{
                        
                        RingCard(color: manager.GPAGradientColor,chartName: "GPA", fullscore: 4.0,curscore: manager.currentUser?.gpa ?? 0.0, formatForScore: "%.2f")
                        Spacer().frame(width: manager.screenWidth*0.05)
                        RingCard(color: manager.GREGradientColor,chartName: "GRE", fullscore: 340,curscore: manager.currentUser?.gre ?? 0.0, formatForScore: "%.0f")
                        Spacer().frame(width: manager.screenWidth*0.05)
                        RingCard(color: manager.TofelGradientColor,chartName: "TOFEL", fullscore: 120,curscore: manager.currentUser?.tofel ?? 0.0, formatForScore: "%.0f")
                    }.padding()
                }else if manager.currentUser?.applyDegree=="Bachelor"{
                    HStack{
                        RingCard(color: manager.GPAGradientColor,chartName: "GPA", fullscore: 4.0,curscore: manager.currentUser?.gpa ?? 0.0, formatForScore: "%.2f")
                        Spacer().frame(width: manager.screenWidth*0.05)
                        RingCard(color: manager.satGradientColor,chartName: "SAT", fullscore: 1600,curscore: manager.currentUser?.sat ?? 0.0, formatForScore: "%.0f")
                        Spacer().frame(width: manager.screenWidth*0.05)
                        RingCard(color: manager.TofelGradientColor,chartName: "TOFEL", fullscore: 120,curscore: manager.currentUser?.tofel ?? 0.0, formatForScore: "%.0f")
                    }.padding()
                }else{
                    HStack{
                        RingCard(color: manager.GPAGradientColor,chartName: "GPA", fullscore: 4.0,curscore: manager.currentUser?.gpa ?? 0.0, formatForScore: "%.2f")
                        Spacer().frame(width: manager.screenWidth*0.05)
                        RingCard(color: manager.TofelGradientColor,chartName: "TOFEL", fullscore: 120,curscore: manager.currentUser?.tofel ?? 0.0, formatForScore: "%.0f")
                    }.padding()
                }
                
            }
            
            MedianChart()
        }
        
    }
}

struct ProfitView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
