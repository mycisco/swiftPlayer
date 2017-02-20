//
//  MediaHelper.swift
//  swiftPlayer
//
//  Created by Kim. Dae-Hyun on 2017. 2. 19..
//  Copyright © 2017년 Kim. Dae-Hyun. All rights reserved.
//

import Foundation
import AVFoundation
import FFmpeg

class MediaHelper {
    
    var engine: AVAudioEngine
    var player: AVAudioNode
    
    static let audioDefaultFormat: AVAudioFormat = AVAudioFormat(commonFormat: .pcmFormatFloat32, sampleRate: 44100, channels: 2, interleaved: false)
    static var defaultSampleRate: Int32 {
        return Int32(self.audioDefaultFormat.sampleRate)
    }
    
    static var defaultChannels: Int32 {
        return Int32(self.audioDefaultFormat.channelCount)
    }
    
    
}
