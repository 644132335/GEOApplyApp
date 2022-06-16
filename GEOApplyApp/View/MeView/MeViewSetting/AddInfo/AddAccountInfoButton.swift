//
//  AddAccountInfoButton.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/8/22.
//

import SwiftUI

struct AddAccountInfoButton: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        ZStack{
            Circle()
                .frame(width: manager.screenWidth*0.2)
                .foregroundColor(manager.themeColor)
            
            Image(systemName: "square.and.pencil")
                .frame(width: manager.screenWidth*0.15)
        }
        .frame(height: 50)
    }
}

struct AddAccountInfoButton_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountInfoButton()
    }
}
