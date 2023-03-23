//
//  UserListViewController.swift
//  UserPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import MJRefresh
import Toast

public class UserListViewController: UIViewController {
    
    let viewModel = UserListViewModel()
    let disposeBag = DisposeBag()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        tableView.dataSource = self
        tableView.register(cellWithClass: UserTableViewCell.self)
        return tableView
    }()

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupBinding()
        view.makeToastActivity(CSToastPositionCenter)
        viewModel.getUsers()
    }
    
    private func setupTableView() {
      
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        let footer = MJRefreshAutoNormalFooter(refreshingBlock: { [weak self] in
            self?.viewModel.getUsers()
        })
        
        tableView.mj_footer = footer
    }
    
    private func setupBinding() {
        viewModel.userList.asDriver().drive(onNext: { [weak self] array in
            self?.view.hideToastActivity()
            self?.tableView.mj_footer?.isHidden = !(self?.viewModel.loadMore ?? false)
            self?.tableView.mj_footer?.endRefreshing()
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
}

extension UserListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.value.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: UserTableViewCell.self, for: indexPath)
        cell.setupCell(name: "\(viewModel.userList.value[indexPath.row].name?.firstName ?? "") \(viewModel.userList.value[indexPath.row].name?.lastName ?? "")")
        return cell
    }
    
    
}
