//
//  VideoClips.swift
//  TikTokClone
//
//  Created by Dongik Song on 5/26/24.
//

import UIKit
import AVKit

struct VideoClips: Equatable {
    
    let videoUrl: URL
    let cameraPosition: AVCaptureDevice.Position
    
    init(videoUrl: URL, cameraPosition: AVCaptureDevice.Position?) {
        self.videoUrl = videoUrl
        self.cameraPosition = cameraPosition ?? .back
    }
    
    static func ==(lhs: VideoClips, rhs:VideoClips) -> Bool {
        return lhs.videoUrl == rhs.videoUrl && lhs.cameraPosition == rhs.cameraPosition
    }
    
}
