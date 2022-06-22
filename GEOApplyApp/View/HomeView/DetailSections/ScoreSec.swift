//
//  ScoreSec.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/11.
//

import SwiftUI

struct ScoreSec: View {
    @EnvironmentObject var manager : AppManager
    var sat:Double
    var tofel:Double
    var gpa:Double
    var gre:Double
    var degree:String
    var body: some View {
        HStack{
            Image(systemName: "graduationcap.fill").foregroundColor(manager.themeColor)
            Divider()
            VStack(alignment:.leading){
                HStack{
                    Text("SCORES").font(.footnote).foregroundColor(manager.themeColor).bold().padding(2)
                    Spacer()
                }
                ScrollView(showsIndicators: false){
                    VStack{
                        if degree == "Master"{
                            ScoreProgress(max: 320, cur: gre, title: "GRE", gradientColor: manager.GREGradientColor, showDecimal: false)
                        }else if degree == "Bachelor"{
                            ScoreProgress(max: 1600, cur: sat, title: "SAT", gradientColor: manager.satGradientColor, showDecimal: false)
                        }else{
                            //show nothing if applying for doctrol
                        }
                        ScoreProgress(max: 120, cur: tofel, title: "TOFEL", gradientColor: manager.TofelGradientColor, showDecimal: false)
                        ScoreProgress(max: 4.0, cur: gpa, title: "GPA", gradientColor: manager.GPAGradientColor, showDecimal: true)
                        
                    
                    }
                }
                
            }
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2)).padding(3)
    }
}

