//
//  StargazerDetailsDataSource.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 16/12/22.
//

import Foundation

protocol StargazerDetailsDataSource {
    func fetchStargazersDetails(_ request: API?, completion: @escaping (BaseResponseModel) -> Void, error: @escaping (ErrorResponse) -> Void)
}
