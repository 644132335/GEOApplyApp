//
//  MedianChart.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/20/22.
//

import SwiftUI

struct MedianChart: View {
    @EnvironmentObject var manager : AppManager
    @State var pickerSelected = 0
    
    var body: some View {
        
        VStack {
            Picker(selection: $pickerSelected, label: Text("")) {
                Text("GPA").tag(0)
                Text("SAT").tag(1)
                Text("TOEFL").tag(2)
                Text("GRE").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            if pickerSelected == 0{
//                ScoreProgress(max: 4.0, cur: manager.currentUserInfoCard?.gpa ?? 0.0, title: "Median", gradientColor: manager.GPAGradientColor, showDecimal: true)
                MedianGraph(max: 4.0, median: 3.5, gradientColor: manager.GPAGradientColor, showDecimal: true)
                
                
                
            }
            if pickerSelected == 1{
//                ScoreProgress(max: 1600, cur: manager.currentUserInfoCard?.sat ?? 0.0, title: "Median", gradientColor: manager.satGradientColor, showDecimal: false)
                MedianGraph(max: 1600, median: 1350,  gradientColor: manager.satGradientColor, showDecimal: false)
                
            }
            if pickerSelected == 2{
//                ScoreProgress(max: 120, cur: manager.currentUserInfoCard?.tofel ?? 0.0, title: "Median", gradientColor: manager.TofelGradientColor, showDecimal: false)
                MedianGraph(max: 120, median: 100,  gradientColor: manager.TofelGradientColor, showDecimal: false)
                
            }
            else if pickerSelected == 3{

                MedianGraph(max: 340, median: 320,  gradientColor: manager.LoginbuttonColor, showDecimal: false)
                
            }

        }
    }
}

struct MedianChart_Previews: PreviewProvider {
    static var previews: some View {
        MedianChart()
    }
}

