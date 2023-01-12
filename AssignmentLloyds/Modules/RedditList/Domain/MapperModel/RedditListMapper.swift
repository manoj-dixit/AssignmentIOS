//
//  RedditListMapper.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 19/12/22.
//

import Foundation

protocol RedditListMapperProtocol {
    func mappedModels(inputModels: RedditListResponse) -> [RedditListEntity]
}

struct RedditListMapper: RedditListMapperProtocol {
    
    func mappedModels(inputModels: RedditListResponse) -> [RedditListEntity] {
        guard let childernList = inputModels.data?.children, !childernList.isEmpty else { return [] }
        return childernList.map { reddit in
            return RedditListEntity(title: reddit.data?.title, imageUrl: reddit.data?.thumbnail, totalAwardsReceived: reddit.data?.totalAwardsReceived, authorName: reddit.data?.authorName)
        }
    }
}
