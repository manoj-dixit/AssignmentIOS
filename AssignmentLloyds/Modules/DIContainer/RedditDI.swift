//
//  RedditModules.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 11/01/23.
//

import Foundation
import UIKit

typealias IdentifierName = String

final class RedditModule {
    
    private let networkManager: INetworkManager
    private let redditList: IdentifierName = "RedditListViewController"

    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func generateViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: RedditModuleConstant.mainStoryboard, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: redditList) as? RedditListViewController  else {
            fatalError()
        }
        viewController.viewModel = generateRedditListViewModel()
        return viewController
    }
}

private extension RedditModule {
    private func generateRedditListViewModel() -> RedditListViewModel {
        let viewModel = RedditListViewModel(useCase: generateRedditListUseCase())
        return viewModel
    }
    
    private func generateRedditListUseCase() -> UseCase {
        let useCase = RedditListUseCase(repository: generateRedditRepository())
        return useCase
    }
    
    private func generateRedditRepository() -> RedditListRepository {
        let repository = RedditListRepositoryImpl(remote: createRedditListService())
        return repository
    }
    
    private func createRedditListService() -> RedditListRemoteService {
        let service = RedditListRemoteService(networkManager: self.networkManager)
        return service
    }
}

final class RedditDetailModule {
    private let redditDetail: IdentifierName = "redditDetailsViewController"

    func generateDetailViewController(redditItem: RedditListEntity) -> UIViewController? {
        let storyboard = UIStoryboard(name: RedditModuleConstant.mainStoryboard, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: redditDetail) as? RedditDetailsViewController  else {
            fatalError()
        }
        viewController.viewModel = RedditDetailsViewModel(redditDetails: redditItem)
        return viewController
    }
}
