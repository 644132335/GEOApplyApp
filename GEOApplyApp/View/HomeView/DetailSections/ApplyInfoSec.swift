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
                        schoolApplyCard(result: true, school: "Pennsylvania State University",schoolImageURL: "https://upload.wikimedia.org/wikipedia/zh/thumb/6/6e/Harvard_Wreath.svg/400px-Harvard_Wreath.svg.png")
                        schoolApplyCard(result: false, school: "Havard University",schoolImageURL: "https://upload.wikimedia.org/wikipedia/zh/thumb/6/6e/Harvard_Wreath.svg/400px-Harvard_Wreath.svg.png")
                        schoolApplyCard(result: false, school: "Havard University",schoolImageURL: "https://upload.wikimedia.org/wikipedia/zh/thumb/6/6e/Harvard_Wreath.svg/400px-Harvard_Wreath.svg.png")
                        
                    }
                }
                
            }
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2)).padding(3)
    }
}


