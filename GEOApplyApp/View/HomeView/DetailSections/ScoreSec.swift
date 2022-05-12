//
//  ScoreSec.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/11.
//

import SwiftUI

struct ScoreSec: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        HStack{
            Image(systemName: "graduationcap.fill").foregroundColor(manager.themeColor)
            Divider()
            VStack(alignment:.leading){
                HStack{
                    Text("Scores").font(.footnote).foregroundColor(manager.themeColor).bold().padding(2)
                    Spacer()
                }
                ScrollView(showsIndicators: false){
                    VStack{
                        ScoreProgress(max: 1600, cur: 1400, title: "SAT", gradientColor: manager.satGradientColor, showDecimal: false)
                        ScoreProgress(max: 120, cur: 110, title: "TOFEL", gradientColor: manager.TofelGradientColor, showDecimal: false)
                        ScoreProgress(max: 4.0, cur: 3.77, title: "GPA", gradientColor: manager.GPAGradientColor, showDecimal: true)
                    
                    }
                }
                
            }
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2)).padding(3)
    }
}

struct ScoreSec_Previews: PreviewProvider {
    static var previews: some View {
        ScoreSec()
    }
}#imageLiteral(resourceName: "simulator_screenshot_9E8BC45D-495D-4986-8DF4-989F35B5370A.png")
