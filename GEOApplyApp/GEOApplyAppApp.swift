//
//  GEOApplyAppApp.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

@main
struct GEOApplyAppApp: App {
    @StateObject var manager = AppManager()
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(manager)
        }
    }
}
