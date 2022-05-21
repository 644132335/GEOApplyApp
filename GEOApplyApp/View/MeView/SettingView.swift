//
//  SettingView.swift
//  Me View
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
       
            List{
                Text("Change Email")
                Text("Change  Password")
                Text("Check the subscription")
                Text("Server")
                Text("Contact us")
                Text("Protocol of usage")
            }
    
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
