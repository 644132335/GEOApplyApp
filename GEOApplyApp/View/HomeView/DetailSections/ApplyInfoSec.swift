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
                            ForEach(manager.schoolRanked){j in
                                if i.schoolName==j.schoolName{
                                    NavigationLink(destination: SchoolDetail(schoolname: j.schoolName, schoolimage: j.schoolImageUrl, rank: j.rank, intro: j.intro)){
                                        schoolApplyCard(result: i.result, school: i.schoolName, schoolImageURL: i.schoolurl,major: i.major)
                                    }
                                    
                                    //schoolApplyCard(result: i.result, school: j.schoolname, schoolImageURL: j.,major: i.major)
                                }
                                
                            }
                            
                        }
                        
                    }
                }
                
            }
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2)).padding(3)
    }
}


