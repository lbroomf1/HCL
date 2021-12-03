//
//  RedditService.swift
//  LawrenceBroomfield
//
//  Created by Lawrence Broomfield on 1/12/21.
//

import Foundation

class RedditService: NetworkProtocol {
    
    typealias Model = RedditResponse
    
    func getModel(from url: String) async throws -> RedditResponse {
        let data = try await getData(from: url)
        return try JSONDecoder().decode(Model.self, from: data)
    }
    
}
