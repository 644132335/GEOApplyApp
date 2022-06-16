//
//  BarView.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/20/22.
//

import SwiftUI

struct BarView: View {
    
    var value: CGFloat
    var chartText1: Double
    var chartText2: Double

    
    var body: some View {
        HStack{
            Text(chartText1.roundDouble()+"-"+chartText2.roundDouble())
            Spacer().frame(width:80)
            ZStack(alignment: .topLeading){
                Capsule().frame(width: 200, height: 30)
                    
                    .foregroundColor(Color.black.opacity(0.1))
                Capsule().frame(width: value, height: 30)
                    .foregroundColor(Color(hue: 0.574, saturation: 0.223, brightness: 0.9))
            }
            
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(value: 50, chartText1: 3.5, chartText2: 4.0)
    }
}
