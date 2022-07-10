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
    
    private var users: [GithubSearchUserEntity] = [] {
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
        searchresultTable.dataSource = self
        
        let nib = UINib(nibName: "SearchUserTableViewCell", bundle: nil)
        searchresultTable.register(nib, forCellReuseIdentifier: "userCell")
    }
    
    func inject(presenter: SearchUserPresentation) {
        self.presenter = presenter
    }
}

extension SearchUserVC: SearchUserView {
    func reloadTableView(items: [GithubSearchUserEntity]) {
        self.users = items
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

extension SearchUserVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchResultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! SearchResultTableViewCell
        // セルに表示する値を設定する
        cell.setData(user: users[indexPath.row])
        return cell
    }
}
