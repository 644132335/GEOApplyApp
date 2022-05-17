//
//  EssaySec.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/12.
//

import SwiftUI

struct EssaySec: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        HStack{
            Image(systemName: "book.fill").foregroundColor(manager.themeColor)
            Divider()
            VStack(alignment:.leading){
                HStack{
                    Text("APPLICATION ESSAYS").font(.footnote).foregroundColor(manager.themeColor).bold().padding(2)
                    Spacer()
                }
                ZStack(alignment:.center){
                    HStack{
                        schoolApplyCard(result: false, school: "Havard University")
                        schoolApplyCard(result: false, school: "Havard University")
                    }.blur(radius: 10)
                    //RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.9)).frame(width: 320, height: 170, alignment: .center)
                    VStack{
                        Text("Subscribe to Unlock").foregroundColor(Color.black.opacity(0.5)).font(.title3).bold()
                        Button("Subscribe"){
                        }.padding(5).background(RoundedRectangle(cornerRadius: 5).fill(.blue.opacity(0.6)).shadow(radius: 2)).padding(5).foregroundColor(.white)
                    }
                    
                }
               
                
                
            }
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2)).padding(3)
    }
}


