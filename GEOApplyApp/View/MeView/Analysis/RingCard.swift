//
//  RingCard.swift
//  Me View
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct RingCard: View {
    var width: CGFloat = 120
    var color : LinearGradient
    //let percent: CGFloat
    let chartName: String
    let fullscore : Double
    var curscore : Double
    let formatForScore : String
    
    @EnvironmentObject var manager : AppManager
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        let mutiplier = width / 44
        let progress = 1 - (curscore/fullscore)
        
        return VStack {
            Spacer().frame(height:15)
            ZStack {
                Circle()
                    .stroke(isDarkMode ? .white.opacity(0.3): .black.opacity(0.1),
                            style: StrokeStyle(lineWidth: 8 * mutiplier))
                    .frame(width: width, height: width)
                //let score = fullscore/100 * percent
                let formatted = String(format: formatForScore, curscore)
                Text(formatted)
                    .bold()
                    .foregroundStyle(color)
                    .foregroundColor(isDarkMode ? .white : .black)
                Circle()
                    .trim(from: progress, to: 1)
                    .stroke(
                        color,
                        style: StrokeStyle(lineWidth: 8 * mutiplier, lineCap: .round, lineJoin: .round)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: width)
                //.shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 3)
            }
            Spacer().frame(height:manager.screenWidth*0.05)
            Text(chartName)
                .foregroundColor(isDarkMode ? .white : .black)
        }
        .frame(width: manager.screenWidth*0.45, height: manager.screenWidth*0.45, alignment: .center)
        .padding(5)
        //.background(Color.white)
        .background(isDarkMode ? .black : .white)
//        .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(manager.LoginbuttonColor, lineWidth: 3)
//                )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .gray, radius: 5)
    }
}



