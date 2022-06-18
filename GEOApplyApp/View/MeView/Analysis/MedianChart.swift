//
//  MedianChart.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/20/22.
//

import SwiftUI

struct MedianChart: View {
    @EnvironmentObject var manager : AppManager
    @State var pickerSelected1 = 0
    @State var pickerSelected2 = 0
    @State var pickerSelected3 = 0
    
    var body: some View {
        if manager.currentUser?.applyDegree=="Bachelor"{
            VStack {
                Picker(selection: $pickerSelected1, label: Text("")) {
                    Text("GPA").tag(0)
                    Text("SAT").tag(1)
                    Text("TOEFL").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                if pickerSelected1 == 0{
                    
                    MedianGraph(max: 4.0, median: manager.currentUser?.gpa ?? 0.0,text: "       You: ", gradientColor: manager.GPAGradientColor, showDecimal: true)
                    MedianGraph(max: 4.0, median: 3.5,text: "Median: ", gradientColor: manager.GPAGradientColor, showDecimal: true)
                    
                    
                    
                }
                if pickerSelected1 == 1{
                    MedianGraph(max: 1600, median: manager.currentUser?.sat ?? 0.0,text: "       You: ",  gradientColor: manager.satGradientColor, showDecimal: false)
                    MedianGraph(max: 1600, median: 1350,text: "Median: ",  gradientColor: manager.satGradientColor, showDecimal: false)
                    
                    
                }
                else if pickerSelected1 == 2{
                    MedianGraph(max: 120, median: manager.currentUser?.tofel ?? 0.0,text: "       You: ",  gradientColor: manager.TofelGradientColor, showDecimal: false)
                    MedianGraph(max: 120, median: 100,text: "Median: ",  gradientColor: manager.TofelGradientColor, showDecimal: false)
                }
                Spacer().frame(height:manager.screenHeight*0.1)
            }
        }else if manager.currentUser?.applyDegree=="Master"{
            VStack {
                Picker(selection: $pickerSelected2, label: Text("")) {
                    Text("GPA").tag(0)
                    Text("GRE").tag(1)
                    Text("TOEFL").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                if pickerSelected2 == 0{
                    
                    MedianGraph(max: 4.0, median: manager.currentUser?.gpa ?? 0.0,text: "       You: ", gradientColor: manager.GPAGradientColor, showDecimal: true)
                    MedianGraph(max: 4.0, median: 3.5,text: "Median: ", gradientColor: manager.GPAGradientColor, showDecimal: true)
                    
                    
                }
                if pickerSelected2 == 1{
                    MedianGraph(max: 320, median: manager.currentUser?.gre ?? 0.0,text: "       You: ",  gradientColor: manager.satGradientColor, showDecimal: false)
                    MedianGraph(max: 320, median: 310,text: "Median: ",  gradientColor: manager.GREGradientColor, showDecimal: false)
                    
                    
                }
                else if pickerSelected2 == 2{
                    MedianGraph(max: 120, median: manager.currentUser?.tofel ?? 0.0,text: "       You: ",  gradientColor: manager.TofelGradientColor, showDecimal: false)
                    MedianGraph(max: 120, median: 100,text: "Median: ",  gradientColor: manager.TofelGradientColor, showDecimal: false)
                }
                Spacer().frame(height:manager.screenHeight*0.1)
            }
        }else{
            VStack {
                Picker(selection: $pickerSelected3, label: Text("")) {
                    Text("GPA").tag(0)
                    Text("TOEFL").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                if pickerSelected3 == 0{
                    
                    MedianGraph(max: 4.0, median: manager.currentUser?.gpa ?? 0.0,text: "       You: ", gradientColor: manager.GPAGradientColor, showDecimal: true)
                    MedianGraph(max: 4.0, median: 3.5,text: "Median: ", gradientColor: manager.GPAGradientColor, showDecimal: true)
                    
                    
                    
                }
                else if pickerSelected3 == 1{
                    MedianGraph(max: 120, median: manager.currentUser?.tofel ?? 0.0,text: "       You: ",  gradientColor: manager.satGradientColor, showDecimal: false)
                    MedianGraph(max: 120, median: 90,text: "Median: ",  gradientColor: manager.satGradientColor, showDecimal: false)
                    
                    
                }
                
                Spacer().frame(height:manager.screenHeight*0.1)
            }
        }
        
    }
}

struct MedianChart_Previews: PreviewProvider {
    static var previews: some View {
        MedianChart().environmentObject(AppManager())
    }
}

