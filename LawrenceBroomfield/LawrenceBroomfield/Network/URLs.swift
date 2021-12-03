//
//  URLs.swift
//  LawrenceBroomfield
//
//  Created by Lawrence Broomfield on 1/12/21.
//

import Foundation

enum URLs {
    static private let urlBase = "https://www.reddit.com/.json"
    static let keyAfter = "$AFTER_KEY"
    static let redditURL = "\(urlBase)?after=\(keyAfter)"
}
