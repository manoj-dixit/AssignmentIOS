//
//  RedditListViewController.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import UIKit

final class RedditListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: RedditListViewModelType?
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initObjects()
        viewModel?.input.viewDidLoad()
    }
    
    private func initObjects() {
        self.setUpTableView()
        self.setUpSearchBar()
        self.setUpBindingObjects()
        self.setUpNavigationTitle()
    }
    
    private func setUpSearchBar() {
        searchBar.placeholder = RedditModuleConstant.searchBarTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.accessibilityIdentifier = RedditModuleConstant.redditListAccessbiliy
    }
    
    private func setUpNavigationTitle() {
        self.title = self.viewModel?.output.getScreenTitle()
    }
    
    private func setUpTableView() {
        tableView.separatorStyle = .none
        tableView.register(RedditListTableViewCell.nib, forCellReuseIdentifier: RedditListTableViewCell.reuseIdentifier)
    }
    
    private func setUpBindingObjects() {
        self.viewModel?.output.reloadTable.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        self.viewModel?.output.loaderStatus.bind { [weak self] status in
            status ? self?.showLoading() : self?.hideLoading()
        }
        
        self.viewModel?.output.showError.bind { [weak self] errorMessage in
            if let message = errorMessage {
                DispatchQueue.main.async {
                    self?.dismiss(animated: true, completion: { [weak self] in
                        self?.showAlert(withMessage: message)
                    })}
            }
        }
    }
}

extension RedditListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.output.numberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: RedditListTableViewCell.reuseIdentifier, for: indexPath) as?  RedditListTableViewCell {
            let mappedData = viewModel?.output.getDataForRows(index: indexPath)
            cell.mappedValues(model: mappedData)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let mappedData = viewModel?.output.getDataForRows(index: indexPath) else {  return }
        RedditModuleRouter().goToDetailViewController(redditItem: mappedData, view: self)
        
    }
}

extension RedditListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            viewModel?.input.didCancelSearch()
            return
        }
        viewModel?.input.didSearch(inputString: searchText)
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.input.didCancelSearch()
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            viewModel?.input.didCancelSearch()
            searchBar.resignFirstResponder()
            return
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
}

