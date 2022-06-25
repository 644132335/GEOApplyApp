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
        ScrollView{
            VStack{
                ForEach(manager.schools){i in
                    HStack{
                        Rectangle().fill(.white).frame(width:manager.screenWidth*0.3)
                        schoolApplyCard(result: "accepted", school: i.schoolName, schoolImageURL: i.schoolImageUrl,major: "").padding()
                        Rectangle().fill(.white).frame(width:manager.screenWidth*0.3)
                    }
                    
                }
            }
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
