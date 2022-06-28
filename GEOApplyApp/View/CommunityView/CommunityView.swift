//
//  CommunityView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

struct CommunityView: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators:false){
            VStack{
                ForEach(manager.schoolRanked){i in
                    HStack{
                        NavigationLink(destination: SchoolDetail(schoolname: i.schoolName, schoolimage: i.schoolImageUrl, rank: i.rank, intro: i.intro)){
                            schoolCard(rank: i.rank, Imageurl: i.schoolImageUrl, schoolname: i.schoolName).padding(EdgeInsets(top: manager.screenWidth*0.01, leading: manager.screenWidth*0.001, bottom: manager.screenWidth*0.01, trailing: manager.screenWidth*0.001))
                        }
                        
                    }
                    
                }
            }
        }.navigationTitle("School Ranks").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView().environmentObject(AppManager())
    }
}
