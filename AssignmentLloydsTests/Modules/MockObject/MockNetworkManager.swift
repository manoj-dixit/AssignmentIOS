//
//  MockNetworkManager.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/01/23.
//

import Foundation
@testable import AssignmentLloyds

final class MockNetworkManager: INetworkManager {

    var redditList: RedditListResponse?
    var error: Error?

    func request<T>(from endPoint: APIEndPointInterface, completion: @escaping Response<T>) where T : Decodable {
        if let _ = error {
            completion(.failure(NetworkError.failed))
        } else if let reddList = redditList {
            completion(.success(reddList as! T))
        }
    }
}
