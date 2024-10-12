//
//  APIResponse.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import Foundation

struct APIResponse: Decodable {
    
    let status: Int
    let layouts: [Layout]
    
    enum Layout: Decodable {
        case mainBanner(String, MainBanner)
        case textHeader(String, TextHeader)
        case courseSwimlane(String, [Course])
        case categories(String, Categories)
        case featuredCourse(String, Course)
        case udemyBusinessBanner(String, UdemyBusinessBanner)
        case unknown(String)
        
        private enum CodingKeys: String, CodingKey {
            case type, value, id
        }
        
        init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(String.self, forKey: .type)
            let id = try container.decode(String.self, forKey: .id)
            switch type {
            case "mainBanner":
                let model = try container.decode(MainBanner.self, forKey: .value)
                self = .mainBanner(id, model)
            case "textHeader":
                let model = try container.decode(TextHeader.self, forKey: .value)
                self = .textHeader(id, model)
            case "courseSwimlane":
                let models = try container.decode([Course].self, forKey: .value)
                self = .courseSwimlane(id, models)
            case "categories":
                let model = try container.decode(Categories.self, forKey: .value)
                self = .categories(id, model)
            case "featuredCourse":
                let model = try container.decode(Course.self, forKey: .value)
                self = .featuredCourse(id, model)
            case "udemyBusinessBanner":
                let model = try container.decode(UdemyBusinessBanner.self, forKey: .value)
                self = .udemyBusinessBanner(id, model)
            default:
                self = .unknown(type)
            }
        }
    }
    
    struct MainBanner: Decodable {
        let id: String
        let imageLink: String
        let title: String
        let caption: String
    }
    
    struct TextHeader: Decodable {
        let id: String
        let text: String
        let highlightedText: String?
    }
    
    struct Course: Decodable {
        let id: String
        let imageLink: String
        let title: String
        let author: String
        let rating: Double
        let reviewCount: Int
        let price: Decimal
        let tag: String
    }
    
    struct Categories: Decodable {
        let id: String
        let titles: [String]
    }
    
    struct UdemyBusinessBanner: Decodable {
        let id: String
        let link: String
    }
    
}
