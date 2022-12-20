//
//  RedditListViewControllerExtension.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import Foundation
import UIKit

extension RedditListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: RedditListTableViewCell.reuseIdentifier, for: indexPath) as?  RedditListTableViewCell {
            let mappedData = viewModel.output.getDataForRows(index: indexPath)
            cell.mappedValues(model: mappedData)
            return cell
        }
        return UITableViewCell()
    }
}

extension RedditListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            viewModel.input.didCancelSearch()
            return
        }
        viewModel.input.didSearch(inputString: searchText)
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.input.didCancelSearch()
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            viewModel.input.didCancelSearch()
            searchBar.resignFirstResponder()
            return
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
}
