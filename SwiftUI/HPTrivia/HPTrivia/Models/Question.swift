//
//  Question.swift
//  HPTrivia
//
//  Created by Dongik Song on 6/13/25.
//

import Foundation

struct Question: Codable {
    let id: Int
    let question: String
    let answer: String
    let wrong: [String]
    let book: Int
    let hint: String
}
