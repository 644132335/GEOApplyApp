//
//  ChangeProfileLine.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/15/22.
//

import SwiftUI

struct ChangeProfileLine: View {
    @EnvironmentObject var manager : AppManager
    @EnvironmentObject var authenticationManager: AuthenticationManager

    var body: some View {
        switch authenticationManager.biometryType{
        case.faceID:
            HStack{
                Spacer().frame(width: manager.screenWidth*0.011)
                Image(systemName: "faceid")
                    .foregroundColor(.blue)
                Spacer().frame(width: manager.screenHeight*0.015)

                Text("账号与安全")
            }.onTapGesture {
                Task.init{
                    await authenticationManager.authenticateWithBiometrics()
                }
            }
        case.touchID:
            HStack{
                Spacer().frame(width: manager.screenWidth*0.011)
                Image(systemName: "touchid")
                    .foregroundColor(.blue)
                Spacer().frame(width: manager.screenHeight*0.015)
                Text("账号与安全")
            }
            .onTapGesture {
                Task.init{
                    await authenticationManager.authenticateWithBiometrics()
                }
            }
        default:
            NavigationLink {
                                CredentialsLoginView()
                                    .environmentObject(authenticationManager)
                            } label: {
                                HStack{
                                    Spacer().frame(width: manager.screenWidth*0.011)
                                    Image(systemName: "person.crop.circle")
                                        .foregroundColor(.blue)
                                    Spacer().frame(width: manager.screenHeight*0.015)

                                    Text("账号与安全")
                                }
                            }
        }
    }
}

struct ChangeProfileLine_Previews: PreviewProvider {
    static var previews: some View {
        ChangeProfileLine().environmentObject(AuthenticationManager())
    }
}
