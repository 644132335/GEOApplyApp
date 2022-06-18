//
//  CircleImage.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct CircleImage: View {
    @EnvironmentObject var manager : AppManager
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        Image("GEOtitle")
            .resizable()
            .scaledToFit()
            .frame(width:manager.screenWidth*0.27, height: manager.screenHeight*0.27)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(isDarkMode ? .gray: .white, lineWidth:1)
        }
        .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
