//
//  EditProfileButton.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/12/22.
//

import SwiftUI

struct EditProfileButton: View {
    @EnvironmentObject var manager : AppManager
    @State var toSettingView : Bool = false
    var body: some View {
        NavigationLink(destination: AddInfoView(), isActive: self.$toSettingView){EmptyView()}.disabled(true)
        Button{
            self.toSettingView = true
        }label: {
            Label("Edit", systemImage: "square.and.pencil" ).foregroundColor(.black)
        }
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray).opacity(0.2)
                .frame(width: manager.screenWidth*0.23, height: manager.screenWidth*0.1)
                )
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        
        
    }
}

struct EditProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileButton()
    }
}
