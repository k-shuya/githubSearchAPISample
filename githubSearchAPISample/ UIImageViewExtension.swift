//
//   UIImageViewExtension.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/11.
//

import UIKit

extension UIImageView {
    func circle() {
        layer.masksToBounds = false
        layer.cornerRadius = self.bounds.width / 2.0
        clipsToBounds = true
    }
}
