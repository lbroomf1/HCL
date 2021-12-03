//
//  FakeRedditService.swift
//  LawrenceBroomfieldTests
//
//  Created by Lawrence Broomfield on 1/12/21.
//

import Foundation
@testable import LawrenceBroomfield

class FakeRedditService: RedditService {
    
    typealias Model = RedditResponse
    
    var response: RedditResponse?
    var error: Error?
    
    override func getModel(from url: String) async throws -> RedditResponse {
        
        if let error = error { throw error }
        
        if let response = response {
            return response
        }
        
        fatalError("Need error or response")
    }
    
}

