//
//  ChangeEmailView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/6/18.
//

import SwiftUI

struct ChangeEmailView: View {
    @State var email = ""
    var body: some View {
        List{
            TextField("Email",text: $email)
        }.navigationTitle("Change Your Email")
    }
}

struct ChangeEmailView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeEmailView()
    }
}
