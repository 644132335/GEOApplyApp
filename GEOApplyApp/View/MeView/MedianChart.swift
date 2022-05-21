//
//  MedianChart.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/20/22.
//

import SwiftUI

struct MedianChart: View {
    @State var pickerSelected = 0
    var body: some View {
        
        VStack {
            Picker(selection: $pickerSelected, label: Text("")) {
                Text("GPA 中位值").tag(0)
                Text("GRE 中位值").tag(1)
                Text("TOEFL 中位值").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
          //  ScrollView(.horizontal){
            VStack(){
                BarView(value: 50, chartText1: 0.0, chartText2: 2.5)
                BarView(value: 30, chartText1: 2.6, chartText2: 2.7)
                BarView(value: 110, chartText1: 2.8, chartText2: 2.9)
                BarView(value: 77, chartText1: 3.0, chartText2: 3.1)
                BarView(value: 130, chartText1: 3.2, chartText2: 3.3)
                BarView(value: 100, chartText1: 3.4, chartText2: 3.5)
                BarView(value: 200, chartText1: 3.6, chartText2: 3.7)
                BarView(value: 98, chartText1: 3.8, chartText2: 3.9)
                BarView(value: 67, chartText1: 4.0, chartText2: 4.0)
            }
          //  }
        }
    }
}

struct MedianChart_Previews: PreviewProvider {
    static var previews: some View {
        MedianChart()
    }
}
