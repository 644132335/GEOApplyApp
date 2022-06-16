//
//  MedianGraph.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/14/22.
//

import SwiftUI

struct MedianGraph: View {
    @EnvironmentObject var manager : AppManager
    let totalwidth = 250.0
    var max:Double
    var median:Double
   // var title:String
    var gradientColor: LinearGradient
    var showDecimal: Bool
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Text("Median Score").bold()
                ZStack(alignment: .bottom){
                    ZStack(alignment: .leading) {
                        Rectangle().frame(width: totalwidth , height: 15)
                            .opacity(0.15)
                            .foregroundColor(Color.gray)
                        Rectangle().frame(width: (median/max)*totalwidth, height: 15)
                            .foregroundStyle(gradientColor)
                        
                    }.cornerRadius(45.0)
            
                    
                }
                
                if showDecimal{
                    Text(String(format: "%.2f", median)).bold().foregroundStyle(gradientColor)
                }else{
                    Text(String(Int(median))).bold().foregroundStyle(gradientColor)
                }
                         }
            Spacer()
        }.padding(5)
    }
}
