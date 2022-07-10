//
//  UIStoryBoardExtension.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/10.
//

import UIKit

extension UIStoryboard {
    static var searchUser: UIStoryboard {
        UIStoryboard(name: StoryBoardNames.searchUser, bundle: nil)
    }
    
    static var userInfo: UIStoryboard {
        UIStoryboard(name: StoryBoardNames.userInfo, bundle: nil)
    }
}
