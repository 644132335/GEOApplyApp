//
//  CircleImage.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI
import SDWebImageSwiftUI
struct CircleImage: View {
    @EnvironmentObject var manager : AppManager
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        ZStack(alignment:.bottomTrailing){
            WebImage(url: URL(string: manager.currentUser?.avatarImageUrl ?? manager.DefaultAvatarUrl))
                .resizable()
                .clipShape(Circle())
                .frame(width:manager.screenWidth*0.27, height: manager.screenHeight*0.15)
                .overlay{
                    Circle().stroke(isDarkMode ? .gray: .white, lineWidth:1)
            }
            .shadow(radius: 7)
            Image(systemName: "camera.circle.fill").resizable().frame(width: manager.screenWidth*0.08, height: manager.screenWidth*0.08).foregroundStyle(.white).background(Circle().fill(manager.LoginbuttonColor))
//            Circle().frame(width: manager.screenWidth*0.07, height: manager.screenWidth*0.07, alignment: .bottomTrailing)
        }
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            CircleImage().environmentObject(AppManager())
        }.background(AppManager().LoginbuttonColor)
        
    }
}
