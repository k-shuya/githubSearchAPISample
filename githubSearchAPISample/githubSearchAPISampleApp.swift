//
//  githubSearchAPISampleApp.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/06.
//

import SwiftUI

struct githubSearchAPISampleApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
        }
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let appPresenter = AppRouter.assembleModules(window: UIWindow(frame: UIScreen.main.bounds))

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        appPresenter.didFinishLaunch()
        
        return true
    }
    // 必要に応じて処理を追加
}
