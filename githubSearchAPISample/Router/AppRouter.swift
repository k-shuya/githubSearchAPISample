//
//  AppRouter.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/10.
//

import UIKit

protocol AppWireframe: AnyObject {
    func showSearchUserView()
}

final class AppRouter {
    private let window: UIWindow
    
    private init(window: UIWindow) {
        self.window = window
    }
    
    static func assembleModules(window: UIWindow) -> AppPresentation {
        let router = AppRouter(window: window)
        let presenter = AppPresenter(router: router)
        
        return presenter
    }
}

extension AppRouter: AppWireframe {
    func showSearchUserView() {
        let searchUserView = SearchUserRouter.assembleModules()
        let navigationController = UINavigationController(rootViewController: searchUserView)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
