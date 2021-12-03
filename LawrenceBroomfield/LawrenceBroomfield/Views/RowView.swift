//
//  RowView.swift
//  LawrenceBroomfield
//
//  Created by Lawrence Broomfield on 1/12/21.
//

import SwiftUI

struct RowView: View {
    
    let title: String
    let comments: String
    let score: String
    let urlImage: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            if urlImage.hasPrefix("http"), let url = URL(string: urlImage) {
                AsyncImage(url: url)
            }
            Text("Comments: \(comments)")
            Text("Score: \(score)")
        }
    }
}
