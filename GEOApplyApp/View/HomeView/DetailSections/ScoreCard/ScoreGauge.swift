//
//  ScoreGauge.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/11.
//

import SwiftUI

struct ScoreGauge: View {
    
    @EnvironmentObject var manager : AppManager
    var sat : Int
    var tofel : Int
    var GPA : Double
    
    var body: some View {
        HStack{
            Text("gauge")
        }
    }
}

struct ScoreGauge_Previews: PreviewProvider {
    static var previews: some View {
        ScoreGauge(sat: 1500, tofel: 99, GPA: 3.7)
    }
}
