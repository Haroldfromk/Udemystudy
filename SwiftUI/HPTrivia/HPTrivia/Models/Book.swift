//
//  Book.swift
//  HPTrivia
//
//  Created by Dongik Song on 6/20/25.
//

import Foundation

struct Book: Identifiable {
    let id: Int
    let image: String
    let questions: [Question]
    var status: BookStatus
    
    
}

enum BookStatus {
    case active, inactive, locked
}
