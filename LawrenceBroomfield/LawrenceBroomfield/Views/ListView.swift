//
//  ContentView.swift
//  LawrenceBroomfield
//
//  Created by Lawrence Broomfield on 1/12/21.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject private var viewModel = RedditViewModel()
    
    var body: some View {
        VStack {
            Text("Reddit Service").font(.largeTitle)
            if viewModel.stories.isEmpty  {
                ProgressView()
            }
            List(viewModel.stories) { story in
                RowView(title: story.title, comments: "\(story.numComments)", score: "\(story.score)", urlImage: story.thumbnail ?? "")
                Text(story.title)
                    .onAppear {
                        if isLastRow(story) {
                            // load more
                            Task {
                                await loadMoreData()
                            }
                        }
                    }
            }
        }
        .task {
            guard viewModel.stories.isEmpty else { return }
            await loadMoreData()
        }
    }
    
    private func isLastRow(_ story: Story) -> Bool {
        viewModel.stories.last == story
    }
    
    private func loadMoreData() async {
        do {
            try await viewModel.loadInformation()
        } catch { }
    }
}
