//
//  RedditViewModel.swift
//  LawrenceBroomfield
//
//  Created by Lawrence Broomfield on 1/12/21.
//

import Foundation
import Combine

@MainActor
class RedditViewModel: ObservableObject {
    
    @Published private(set) var stories = [Story]()
    
    private let service: RedditService
    private var after = ""
    private var isLoading = false
    
    init(service: RedditService = RedditService()) {
        self.service = service
    }
    
    func loadInformation() async throws {
        guard !isLoading else { return }
        isLoading = true
        let url = URLs.redditURL.replacingOccurrences(of: URLs.keyAfter, with: after)
        let response = try await service.getModel(from: url)
        after = response.data.after
        stories.append(contentsOf: response.data.children.map { $0.data })
        isLoading = false
    }
    
}
