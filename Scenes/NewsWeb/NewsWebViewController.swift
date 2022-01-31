//
//  NewsWebViewController.swift
//  KeywordNews
//
//  Created by 김동주 on 2022/01/30.
//

import WebKit
import SnapKit
import UIKit


final class NewsWebViewController: UIViewController {
    private let news: News
    
//    웹 뷰 구현
    
    private let webView = WKWebView()
    
    
//      링크 버튼 구현
    
    private let rightBarButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "link"),
        style: .plain,
        target: self,
        action: #selector(didTapRightBarButtonItem)
        
        )
    
    init(news: News) {
        self.news = news
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
        setupWebView()
        
    }
    
    
}

private extension NewsWebViewController {
    func setupNavigationBar() {
        navigationItem.title = news.title.htmlToString
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
    }
    
//    웹 뷰 띄우기
    
    func setupWebView() {
        guard let linkURL = URL(string: news.link) else {
            navigationController?.popViewController(animated: true)
            return
        }
        
        view = webView
        
        let urlRequest = URLRequest(url: linkURL)
        webView.load(urlRequest)
    }
    
    
    
//    클립보드 저장 구현
    
    @objc func didTapRightBarButtonItem() {
        UIPasteboard.general.string = news.link
        
        
    }
}
