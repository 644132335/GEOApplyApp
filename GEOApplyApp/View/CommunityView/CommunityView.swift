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
        
        VStack{
            Text("community view")
            Button(action: {
                manager.signOut()
            }){
                Text("sign out")
            }
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
