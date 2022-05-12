//
//  ApplyInfoSec.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/29.
//

import SwiftUI

struct ApplyInfoSec: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        HStack{
            Image(systemName: "building.columns.fill").foregroundColor(manager.themeColor)
            Divider()
            VStack(alignment:.leading){
                HStack{
                    Text("APPLICATION RESULTS").font(.footnote).foregroundColor(manager.themeColor).bold().padding(2)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        schoolApplyCard(result: true, school: "Pennsylvania State University")
                        schoolApplyCard(result: false, school: "Havard University")
                        schoolApplyCard(result: false, school: "Havard University")
                        
                    }
                }
                
            }
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2)).padding(3)
    }
}


