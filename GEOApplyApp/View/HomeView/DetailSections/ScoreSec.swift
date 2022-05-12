//
//  ScoreSec.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/11.
//

import SwiftUI

struct ScoreSec: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        HStack{
            Image(systemName: "graduationcap.fill").foregroundColor(manager.themeColor)
            Divider()
            VStack(alignment:.leading){
                HStack{
                    Text("Scores").font(.footnote).foregroundColor(manager.themeColor).bold().padding(2)
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

struct ScoreSec_Previews: PreviewProvider {
    static var previews: some View {
        ScoreSec()
    }
}
