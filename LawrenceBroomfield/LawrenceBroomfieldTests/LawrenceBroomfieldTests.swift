//
//  LawrenceBroomfieldTests.swift
//  LawrenceBroomfieldTests
//
//  Created by Lawrence Broomfield on 1/12/21.
//

import XCTest
@testable import LawrenceBroomfield

class LawrenceBroomfieldTests: XCTestCase {

    private let fakeRedditService = FakeRedditService()
    private var viewModel: RedditViewModel!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = RedditViewModel(service: fakeRedditService)
    }
    
    @MainActor
    func testLoadDataSuccess() async throws {
        
        // Given
        let data = try load(json: "data")
        let response = try JSONDecoder().decode(RedditResponse.self, from: data)
        fakeRedditService.response = response
        
        // When
        try await viewModel.loadInformation()
        XCTAssertEqual(viewModel.stories.count, 25)
        
    }

    private func load(json: String) throws -> Data {
        let bundle = Bundle(for: LawrenceBroomfieldTests.self)
        
        guard let file = bundle.url(forResource: json, withExtension: "json")
        else { fatalError("File \(json) could not be loaded") }
        
        return try Data(contentsOf: file)
    }

}
