//
//  StringExt.swift
//  BBQuotes
//
//  Created by Dongik Song on 5/9/25.
//

import Foundation

extension String {
    func removeSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpace() -> String {
        self.removeSpaces().lowercased()
    }
}
