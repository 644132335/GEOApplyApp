//
//  GEOApplyAppApp.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI
import Firebase
@main
struct GEOApplyAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject var manager = AppManager()
    var body: some Scene {
        WindowGroup {
            switch manager.currentPage{
            case .login:
                LoginView().environmentObject(manager)
            case.main:
                ContentView().environmentObject(manager)
            }
           
        }
    }
}

class AppDelegate: NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
