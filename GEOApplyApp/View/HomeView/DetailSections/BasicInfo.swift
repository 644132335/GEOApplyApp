//
//  BasicInfo.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/29.
//

import SwiftUI

struct BasicInfo: View {
    @EnvironmentObject var manager : AppManager
    var nationality : String
    var school : String
    var major : String
    
    var body: some View {
      
        HStack{
            Image(systemName: "person.fill").foregroundColor(manager.themeColor)
            Divider()
            VStack(alignment:.leading){
                HStack{
                    Text("PERSONAL INFO").font(.footnote).foregroundColor(manager.themeColor).bold().padding(2)
                    Spacer()
                }
                
                HStack{
                    Spacer().frame(width: 5)
                    Image(systemName: "globe.americas.fill").foregroundColor(.red.opacity(0.6)).frame(width: 10, height: 10).padding(2)
                    Text("Nationality:").font(.footnote).padding(2)
                    Spacer()
                    Text(nationality).font(.footnote).bold().padding(2)
                }.padding(2).background(RoundedRectangle(cornerRadius: 5).fill(.red.opacity(0.2)))
                HStack{
                    Spacer().frame(width: 5)
                    Image(systemName: "text.book.closed.fill").foregroundColor(.blue.opacity(0.6)).frame(width: 10, height: 10).padding(2)
                    Text("School:").font(.footnote).padding(2)
                    Spacer()
                    Text(school).font(.footnote).bold().padding(2)
                }.padding(2).background(RoundedRectangle(cornerRadius: 5).fill(.blue.opacity(0.2)))

                HStack{
                    Spacer().frame(width: 5)
                    Image(systemName: "book.fill").foregroundColor(.green.opacity(0.6)).frame(width: 10, height: 10).padding(2)
                    Text("Major:").font(.footnote).padding(2)
                    Spacer()
                    Text(major).font(.footnote).bold().padding(2)
                }.padding(2).background(RoundedRectangle(cornerRadius: 5).fill(.green.opacity(0.2)))

            }
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2)).padding(3)
    }
}


