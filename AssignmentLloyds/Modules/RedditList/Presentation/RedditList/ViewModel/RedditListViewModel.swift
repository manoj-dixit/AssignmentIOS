//
//  RedditListViewModel.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import Foundation


protocol RedditListViewModelInput {
    func viewDidLoad()
    func didSearch(inputString: String)
    func didCancelSearch()
}

protocol RedditListViewModelOutput {
    var loaderStatus: Dynamic<Bool> { get }
    var reloadTable: Dynamic<Bool> { get }
    var showError: Dynamic<String?> { get }
    func numberOfSection() -> Int
    func getDataForRows(index: IndexPath) -> RedditListEntity?
    func getScreenTitle() -> String?
}

protocol RedditListViewModelType: RedditListViewModelInput, RedditListViewModelOutput {
    var input: RedditListViewModelInput { get }
    var output: RedditListViewModelOutput { get }
}

final class RedditListViewModel: RedditListViewModelType {
    var input: RedditListViewModelInput { return self }
    var output: RedditListViewModelOutput { return self }
    var redditList: [RedditListEntity]? = []
    var loaderStatus: Dynamic<Bool> = Dynamic(false)
    var reloadTable: Dynamic<Bool> = Dynamic(false)
    var showError: Dynamic<String?> = Dynamic(nil)
    private var searchString: String? = nil
    internal var useCase: UseCase
    
    init(useCase: UseCase) {
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        self.useCase.fetchList { result in
            switch result {
            case let .success(list):
                self.loaderStatus.value = false
                self.reloadTableData()
                self.redditList = list
            case let .failure(error):
                self.loaderStatus.value = false
                self.showError.value = error.localizedDescription
            }
        }
    }
    
    func numberOfSection() -> Int {
        guard let list = self.getRedditList(), !list.isEmpty else { return 0 }
        return list.count
    }
    
    func getScreenTitle() -> String? {
        return RedditModuleConstant.NavigationBarTitle.title
    }
    
    func getDataForRows(index: IndexPath) -> RedditListEntity? {
        guard let list = self.getRedditList(), !list.isEmpty else { return nil }
        let rowIndex = index.row
        guard list.count > rowIndex else { return nil }
        return list[rowIndex]
    }
    
    func getRedditList() -> [RedditListEntity]? {
        guard let searchString = self.searchString else {
            return self.redditList
        }
        let searchedList = self.redditList?.filter({ dataEntity in
            guard let authorName = dataEntity.authorName else { return false }
            return authorName.lowercased().contains(searchString.lowercased())
        })
        guard let isEmptyList = searchedList?.isEmpty, !isEmptyList else {
            self.showError.value = RedditModuleConstant.noSearchResult
            return nil
        }
        return searchedList
    }
    
    func didSearch(inputString: String) {
        searchString = inputString
        reloadTableData()
    }
    
    func didCancelSearch() {
        searchString = nil
        reloadTableData()
    }
    
    private func reloadTableData() {
        self.reloadTable.value = true
    }
}
