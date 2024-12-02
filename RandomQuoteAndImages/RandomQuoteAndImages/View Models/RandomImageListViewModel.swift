//
//  RandomImageListViewModel.swift
//  RandomQuoteAndImages
//
//  Created by Dongik Song on 11/29/24.
//

import Foundation
import UIKit

@MainActor
class RandomImageListViewModel: ObservableObject {
    
    @Published var randomImages: [RandomImageViewModel] = []
    
    func getRandomImages(ids: [Int]) async {
        
        let webService = Webservice()
        randomImages = []
        
        do {
            try await withThrowingTaskGroup(of: RandomImage.self) { group in
                for id in ids {
                    group.addTask {
                        return try await webService.getRandomImage(id: id)
                    }
                }
                
                for try await randomImage in group {
                    randomImages.append(RandomImageViewModel(randomImage: randomImage))
                }
            }
        } catch {
            print(error)
        }
    }
}

struct RandomImageViewModel: Identifiable {
    
    let id = UUID()
    fileprivate let randomImage: RandomImage
    
    var image: UIImage? {
        UIImage(data: randomImage.image)
    }
    
    var quote: String {
        randomImage.quote.quote
    }
    
}
