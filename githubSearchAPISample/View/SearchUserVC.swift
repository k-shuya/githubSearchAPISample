// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//
//  { type.name }}VC.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/06.
//

import UIKit

protocol SearchUserView: AnyObject {
    func reloadTableView(items: [GithubSearchUserEntity])
    func showErrorAlert()
}

final class SearchUserVC: UIViewController {

    var presenter: SearchUserPresentation!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchresultTable: UITableView!
    
    private var repositories: [GithubSearchUserEntity] = [] {
        didSet {
            DispatchQueue.main.async {
                self.searchresultTable.reloadData() // 画面の更新
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchresultTable.delegate = self
    }
    
    func inject(presenter: SearchUserPresentation) {
        self.presenter = presenter
    }
}

extension SearchUserVC: SearchUserView {
    func reloadTableView(items: [GithubSearchUserEntity]) {
        DispatchQueue.main.async {
            self.searchresultTable.reloadData()
        }
    }
}

extension SearchUserVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }

        presenter.searchButtonDidPush(searchText: text)

        searchBar.resignFirstResponder()
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "ネットワークエラー", message: "しばらく時間をおいてから再度お試しください", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension SearchUserVC: UITableViewDelegate {
    
}
