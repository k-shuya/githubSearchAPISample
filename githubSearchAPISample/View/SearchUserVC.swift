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
        
        let nib = UINib(nibName: SearchUserConfig.resultTVCNibName, bundle: nil)
        searchresultTable.register(nib, forCellReuseIdentifier: SearchUserConfig.resultTVCIdentifier)
        
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = SearchUserConfig.serchBarPlaceholder
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
    
    // - TODO: 実際のエラーに即した実装に変える
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: true)
       presenter.didSelect(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
}

extension SearchUserVC: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.isHidden = users.isEmpty ? true : false
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchResultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! SearchResultTableViewCell
        
        cell.avatarImageView.image = UIImage(systemName: "photo")
        // セルに表示する値を設定する
        cell.setData(user: users[indexPath.row])
        return cell
    }
}
