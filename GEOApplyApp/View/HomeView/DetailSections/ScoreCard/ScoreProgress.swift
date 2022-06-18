//
//  ScoreProgress.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/12.
//

import SwiftUI

struct ScoreProgress: View {
    @EnvironmentObject var manager : AppManager
    let totalwidth = 250.0
    var max:Double
    var cur:Double
    var title:String
    var gradientColor: LinearGradient
    var showDecimal: Bool
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Text(title).bold()
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: manager.screenWidth*0.6 , height: manager.screenWidth*0.05)
                        .opacity(0.15)
                        .foregroundColor(Color.gray)
                    Rectangle().frame(width: (cur/max)*manager.screenWidth*0.6, height: manager.screenWidth*0.05)
                        .foregroundStyle(gradientColor)
                }.cornerRadius(45.0)
                if showDecimal{
                    Text(String(format: "%.2f", cur)).bold().foregroundStyle(gradientColor)
                   
                }else{
                    Text(String(Int(cur))).bold().foregroundStyle(gradientColor)
                }
                         }
            Spacer()
        }.padding(5).background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2)).padding(3)
    }
}
