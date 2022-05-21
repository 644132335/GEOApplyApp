//
//  CircleImage.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct CircleImage: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        Image("GEOtitle")
            .resizable()
            .scaledToFit()
            .frame(width:manager.screenWidth*0.32, height: manager.screenHeight*0.32)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth:4)
        }
        .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
