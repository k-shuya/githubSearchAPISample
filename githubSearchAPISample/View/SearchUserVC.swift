// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//
//  { type.name }}VC.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/06.
//

import UIKit

protocol SearchUserViewInterface: class {
    // 実装すべきメソッド
}

final class SearchUserVC: UIViewController {

    var presenter: SearchUserPresenterInterface!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchUserVC {
    // 追加
}
