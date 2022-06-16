//
//  ChartView.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/8/22.
//

import SwiftUI

struct ChartView: View {
    @EnvironmentObject var manager : AppManager
    let data: [Double]
    let maxY : Double
    let minY : Double
    @State private var percentage: CGFloat = 0

//    init(){
//        data = [4,6,10,4,33,50,55,29]
//         maxY = data.max() ?? 0
//         minY = data.min() ?? 0
//    }
    var body: some View {
        VStack(){
            chartView
                .frame(height: manager.screenHeight*0.13)
                .background(
                    VStack{
                        Divider()
                        Spacer()
                        Divider()
                        Spacer()
                        Divider()
                        Spacer()
                        Divider()
                    }
                )
                .overlay(alignment: .leading){
                    VStack{
                        Text("100")
                        Spacer()
                        Text("75")
                        Spacer()
                        Text("50")
                        Spacer()
                        Text("25")
                        
                    }
                }
        
        }
        .font(.caption)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.linear(duration: 3.0)) {
                    percentage = 1.0
                }
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(data: [4,6,10,4,33,50,55,29], maxY: 55, minY: 4)

    }
}


extension ChartView {
    private var chartView: some View{
        GeometryReader{ geometry in
            Path { path in
                for i in data.indices {

                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(i + 1)

                    let yAxis = maxY - minY

                    let yPosition = CGFloat(1 - (data[i] - minY) / yAxis) * geometry.size.height

                    if i == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .trim(from: 0, to: percentage)
            .stroke(manager.themeColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .shadow(color: manager.themeColor, radius: 10, x: 0.0, y: 5)
            .shadow(color: manager.themeColor.opacity(0.3), radius: 10, x: 0.0, y: 10)
            .shadow(color: manager.themeColor.opacity(0.1), radius: 10, x: 0.0, y: 15)
        }
    }
    
}
