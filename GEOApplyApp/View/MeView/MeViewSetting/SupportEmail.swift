//
//  SupportEmail.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/9/22.
//

import UIKit
import SwiftUI

struct SupportEmail {
    let toAddress: String
    let subject: String
    let messageHeader: String
    var body: String {"""
        Application Name: \(Bundle.main.displayName)
        iOS: \(UIDevice.current.systemVersion)
        Device Model: \(UIDevice.current.modelName)
        App Version: \(Bundle.main.appVersion)
        
        \(messageHeader)
    --------------------------------------
    """
        //App Build: \(Bundle.main.appBuild)
    }
    
    func send(openURL: OpenURLAction) {
        let urlString = "mailto:\(toAddress)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")&body=\(body.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"
        guard let url = URL(string: urlString) else { return }
        openURL(url) { accepted in
            if !accepted {
                print("""
                This device does not support email
                \(body)
                """
                )
            }
        }
    }
    
}
