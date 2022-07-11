// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//
//  { type.name }}VC.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/06.
//

import UIKit
import WebKit

protocol UserInfoView: AnyObject {
    func request(url: URL)
}

final class UserInfoVC: UIViewController {
    var presenter: UserInfoPresentation!
    @IBOutlet weak var webView: WKWebView!
    
    private var progressView = UIProgressView(progressViewStyle: .bar)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupProgressView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        progressView.layer.removeAllAnimations()
        progressView.isHidden = true
    }
    
    func inject(presenter: UserInfoPresentation) {
        self.presenter = presenter
    }
    
    private func setupProgressView() {
        guard let navigationBarH = self.navigationController?.navigationBar.frame.size.height else {
            assertionFailure()
            return
        }
        progressView = UIProgressView(frame: CGRect(x: 0.0, y: navigationBarH, width: self.view.frame.size.width, height: 0.0))
        navigationController?.navigationBar.addSubview(progressView)

        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else {
            assertionFailure()
            return
        }
        
        if keyPath == "estimatedProgress" {
            progressView.alpha = 1.0
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            
            if webView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: { [weak self] in
                    self?.progressView.alpha = 0.0
                }, completion: { (finished: Bool) in
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        }
    }
}

extension UserInfoVC: UserInfoView {
    func request(url: URL) {
        let request = URLRequest(url: url)
        self.webView.load(request)
    }
}
