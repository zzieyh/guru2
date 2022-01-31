//
//  ViewController.swift
//  KeywordNews
//
//  Created by 이현영 on 2022/01/29.
//

import SnapKit
import UIKit

final class NewListViewController: UIViewController {
    private lazy var presenter  = NewsListPresenter(viewContorller: self)
    
    //위로 당겼을 때 리로드
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didCalledRefresh), for: .valueChanged)
        
        return refreshControl
    }()
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.delegate = presenter
        tableView.dataSource = presenter
        
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: NewsListTableViewCell.identifier)
        
        tableView.register(
            NewsListTableViewHeaderView.self,
            forHeaderFooterViewReuseIdentifier: NewsListTableViewHeaderView.identifier)
        
        
        tableView.refreshControl = refreshControl
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
        NewsSearchManager()
            .request(from: "아이폰", start: 1, display: 20) { newsArray in
                //print(newsArray)
            }
    }
}

extension NewListViewController: NewsListProtocol{
    func setupNavigationBar(){
        navigationItem.title = "NEWS" //메인화면 제목
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    //이 함수 없으면 계속 리프레싱됨
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
    
//    웹 뷰 구현(뉴스 불러오기)
    
    func moveToNewsWebViewController(with news: News) {
        let newsWebViewController = NewsWebViewController(news: news)
        navigationController?.pushViewController(newsWebViewController, animated: true)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
}

private extension NewListViewController {
    @objc func didCalledRefresh() {
        presenter.didCalledRefresh()
    }
}

