//
//  RedditResponse.swift
//  LawrenceBroomfield
//
//  Created by Lawrence Broomfield on 1/12/21.
//

import Foundation

typealias Story = RedditResponse.ResponseData.Child.Story

struct RedditResponse: Decodable {
    let data: ResponseData
    struct ResponseData: Decodable {
        let after: String
        let children: [Child]
        struct Child: Decodable {
            let data: Story
            struct Story: Decodable, Identifiable, Equatable {
                let id = UUID()
                let title: String
                let thumbnailHeight: Int?
                let thumbnailWidth: Int?
                let thumbnail: String?
                let numComments: Int
                let score: Int
                private enum CodingKeys: String, CodingKey {
                    case title
                    case thumbnailHeight = "thumbnail_height"
                    case thumbnailWidth = "thumbnail_width"
                    case thumbnail
                    case numComments = "num_comments"
                    case score
                }
            }
        }
    }
}
