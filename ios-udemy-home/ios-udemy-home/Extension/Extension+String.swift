//
//  Extension+String.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import Foundation

extension String {
    var withBrackets: String {
        String(format: "(%@)", self)
    }
    
    var camelCaseToEnglish: String {
        var result = ""
        var wordStartIndex = self.startIndex
        
        for (index, char) in self.enumerated() {
            if index > 0 && char.isUppercase {
                let previousWord = self[wordStartIndex..<self.index(self.startIndex, offsetBy: index)]
                if !previousWord.isEmpty {
                    result += "\(previousWord) "
                }
                wordStartIndex = self.index(self.startIndex, offsetBy: index)
            }
        }
        
        let lastWord = self[wordStartIndex..<self.endIndex]
        if !lastWord.isEmpty {
            result += "\(lastWord)"
        }
        return result
    }
    
    var useShortAndFormat: String {
        replacingOccurrences(of: "And", with: " & ")
    }
}
