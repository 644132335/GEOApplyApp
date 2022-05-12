//
//  schoolApplyCard.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/29.
//

import SwiftUI

struct schoolApplyCard: View {
    @EnvironmentObject var manager : AppManager
    var result : Bool
    var school : String
    
    var body: some View {
        if result == true{
            VStack{
                RoundedRectangle(cornerRadius: 10).fill(manager.themeColor.opacity(0.6)).frame(width: 100, height: 70).padding(3)
               
                HStack{
                    Spacer()
                    Text(school).font(.footnote).fixedSize(horizontal: false, vertical: true).frame(width: 100, height: 40, alignment: .center).padding(1)
                    Spacer()
                    Image(systemName: "checkmark").padding(1).foregroundColor(Color.green)
                    
                    Spacer()
                    
                }
            }.padding(1).background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(color:.green.opacity(0.8) ,radius: 3)).padding(2)
        }
        
        else{
            VStack{
                RoundedRectangle(cornerRadius: 10).fill(manager.themeColor.opacity(0.6)).frame(width: 100, height: 70).padding(3)
               
                HStack{
                    Spacer()
                    Text(school).font(.footnote).fixedSize(horizontal: false, vertical: true).frame(width: 100, height: 40, alignment: .center).padding(1)
                    Spacer()
                    Image(systemName: "xmark").padding(1).foregroundColor(Color.red)
                    Spacer()
                    
                }
            }.padding(1).background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(color:.red.opacity(0.8) ,radius: 3)).padding(2)
        }
        
            
        
    }
}

