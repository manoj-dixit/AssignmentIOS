//
//  MockData.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/01/23.
//

import Foundation
@testable import AssignmentLloyds

final class MockData {
    
    static var redditList: RedditListResponse {
        try! JSONDecoder().decode(RedditListResponse.self, from: redditListData)
    }
    
    static var domainRedditList: RedditListResponse {
        return redditList
    }

    static var entityList: [RedditListEntity] {
        return RedditListMapper().mappedModels(inputModels: domainRedditList)
    }

    static var redditItem: RedditListEntity {
        return entityList.first!
    }
    
    static var redditListData: Data {
        loadJsonData("RedditListInfo")
    }
    
    static func loadJsonData(_ fromFile: String) -> Data {
        let path = Bundle(for: self).path(forResource: fromFile, ofType: "json")
        let jsonString = try! String(contentsOfFile: path!, encoding: .utf8)
        let data = jsonString.data(using: .utf8)!
        return data
    }
}
