//
//  ViewController.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import UIKit

class ReposListViewController: UITableViewController {
    
    var reposAPI: ReposAPI?

    var user: User!
    var repos: [Repo] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadRepos()
    }
    
    private func setupViews() {
        tableView.tableHeaderView = TableHeaderView.build(from: user)
        
        tableView.register(TableSectionHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = TableSectionHeaderView.heightConstant
    }

    private func loadRepos() {
        reposAPI?.getAll(by: user, completionHandler: { [weak self] loadedRepos in
            self?.repos = loadedRepos
        
        }, failureHandler: { error in
            let message = """
                Não foi possível carregar lista de repos do usuário.
                \(error.localizedDescription)
            """
            
            UIAlertController.showError(message, in: self)
        })
    }
    
}
// MARK: - UITableViewDataSource implementations

extension ReposListViewController {
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as? RepoTableViewCell else {
            fatalError("Não foi possível recuperar célula para a lista de repos")
        }
        
        cell.repo = repos[indexPath.row]
        return cell
    }
    
}
// MARK: - UITableViewDelegate implementations

extension ReposListViewController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.reuseId) as? TableSectionHeaderView else {
            fatalError("Não foi possível recuperar section header view para tabela")
        }
        
        headerView.title = "Repositories"
        return headerView
    }
    
}
