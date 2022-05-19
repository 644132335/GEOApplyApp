//
//  CircleImage.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("WechatIMG206")
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
