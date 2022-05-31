//
//  ApplyInfoSec.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/29.
//

import SwiftUI

struct ApplyInfoSec: View {
    @EnvironmentObject var manager : AppManager
    var userinfo : [schoolReslt]
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
                        ForEach(userinfo,id:\.self){i in
                            schoolApplyCard(result: i.result, school: i.schoolName, schoolImageURL: i.schoolurl)
                        }
//
//
//                        schoolApplyCard(result: "accepted", school: "Pennsylvania State University",schoolImageURL: "https://upload.wikimedia.org/wikipedia/zh/thumb/6/6e/Harvard_Wreath.svg/400px-Harvard_Wreath.svg.png")
//                        schoolApplyCard(result: "rejected", school: "Havard University",schoolImageURL: "https://upload.wikimedia.org/wikipedia/zh/thumb/6/6e/Harvard_Wreath.svg/400px-Harvard_Wreath.svg.png")
//                        schoolApplyCard(result: "waiting", school: "Havard University",schoolImageURL: "https://upload.wikimedia.org/wikipedia/zh/thumb/6/6e/Harvard_Wreath.svg/400px-Harvard_Wreath.svg.png")
                        
                    }
                }
                
            }
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2)).padding(3)
    }
}


