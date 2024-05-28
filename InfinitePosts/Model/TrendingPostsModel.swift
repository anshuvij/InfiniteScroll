//
//  TrendingPostsModel.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import Foundation

// MARK: - TrendingPostsModel
struct TrendingPostsModel: Codable {
        let userID, id: Int
        let title, body: String

        enum CodingKeys: String, CodingKey {
            case userID = "userId"
            case id, title, body
        }
    }

    typealias TrendingPost = [TrendingPostsModel]
