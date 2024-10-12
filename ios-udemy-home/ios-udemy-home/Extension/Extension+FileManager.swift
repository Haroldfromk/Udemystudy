//
//  Extension+FileManager.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/13/24.
//

import Foundation

extension FileManager {
    static func modelFromJSON<T: Decodable>(fileName: String) -> T? {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            print(">>> Error: Path not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let stringValue = String(data: data, encoding: .utf8)
            print(">>> StringValue: \(stringValue)")
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print(">>> Error reading JSON File: \(error)")
            return nil
        }
    }
}
