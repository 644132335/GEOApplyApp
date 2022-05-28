//
//  RingCard.swift
//  Me View
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct RingCard: View {
    var width: CGFloat = 120
    var color = Color(hue: 0.574, saturation: 0.223, brightness: 0.9)
    let percent: CGFloat
    let chartName: String
    
    @EnvironmentObject var manager : AppManager

    var body: some View {
        let mutiplier = width / 44
        let progress = 1 - percent / 100
        
        return VStack {
            Spacer().frame(height:15)
            ZStack {
                Circle()
                    .stroke(Color.black.opacity(0.1),
                            style: StrokeStyle(lineWidth: 8 * mutiplier))
                    .frame(width: width, height: width)
                
                Circle()
                    .trim(from: progress, to: 1)
                    .stroke(
                        color,
                        style: StrokeStyle(lineWidth: 8 * mutiplier, lineCap: .round, lineJoin: .round)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: width)
                .shadow(color: color.opacity(0.1), radius: 3, x: 0, y: 3)    
            }
            Spacer().frame(height:manager.screenWidth*0.05)
            Text(chartName)
        }
        .frame(width: manager.screenWidth*0.45, height: manager.screenWidth*0.45, alignment: .center)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .gray, radius: 5)
    }
}

struct RingCard_Previews: PreviewProvider {
    static var previews: some View {
        RingCard(percent: 30, chartName: "VIP Level")
    }
}
