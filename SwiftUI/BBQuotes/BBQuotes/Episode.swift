//
//  Episode.swift
//  BBQuotes
//
//  Created by Dongik Song on 5/9/25.
//

import Foundation

struct Episode: Decodable {
    let episode: Int // 101, 512
    let title: String
    let image: URL
    let synopsis: String
    let writtenBy: String
    let directedBy: String
    let airDate: String

    var seasonEpisode: String {
        "Season \(episode / 100) Episode \(episode % 100)"
    }
}
