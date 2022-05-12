//
//  IntroSec.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/29.
//

import SwiftUI

struct IntroSec: View {
    @EnvironmentObject var manager : AppManager
    var text : String
    
    var body: some View {
        HStack{
            Image(systemName: "pencil").foregroundColor(manager.themeColor)
            Divider()
            VStack(alignment:.leading){
                HStack{
                    Text("INTRODUCTION").font(.footnote).foregroundColor(manager.themeColor).bold().padding(2)
                    Spacer()
                }
                
                Text(text).font(.footnote).fixedSize(horizontal: false, vertical: true)
            }
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2)).padding(3)
    }
}


