//
//  CredentialsLoginView.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/15/22.
//

import SwiftUI

struct CredentialsLoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 40) {
            
            TextField("Username", text: $username)
            
            SecureField("Password", text: $password)
            
            Text("Change")
                .background(.white)
                .cornerRadius(30)
                .onTapGesture {
                    authenticationManager.authenticateWithCredentials(username: username, password: password)
                }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct CredentialsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsLoginView()
            .environmentObject(AuthenticationManager())
    }
}
