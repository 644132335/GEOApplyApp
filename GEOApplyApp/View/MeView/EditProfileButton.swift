//
//  EditProfileButton.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/12/22.
//

import SwiftUI

struct EditProfileButton: View {
    @State var toSettingView : Bool = false
    var body: some View {
        NavigationLink(destination: AddInfoView(), isActive: self.$toSettingView){EmptyView()}.disabled(true)
        Button{
            self.toSettingView = true
        }label: {
            Label("Profile", systemImage: "square.and.pencil" )
        }
        .buttonStyle(.bordered)
        .tint(.gray)
        .buttonBorderShape(.roundedRectangle(radius: 20))
        
        
    }
}

struct EditProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileButton()
    }
}
