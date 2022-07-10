//
//  AppPresenter.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/10.
//

import Foundation

protocol AppPresentation: AnyObject {
    func didFinishLaunch()
}

final class AppPresenter {
    private let router: AppWireframe
    
    init(router: AppWireframe) {
        self.router = router
    }
}

extension AppPresenter: AppPresentation {
    func didFinishLaunch() {
        router.showSearchUserView()
    }
}
