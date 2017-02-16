//
//  SweetStream.swift
//  swiftPlayer
//
//  Created by marbean on 2017. 2. 15..
//  Copyright © 2017년 Kim. Dae-Hyun. All rights reserved.
//

import Foundation
import AVFoundation
import FFmpeg

public class SweetStream: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        
        return ""
    }
    
    let format: UnsafeMutablePointer<AVFormatContext>
    let stream: UnsafeMutablePointer<AVStream>
    var codec: UnsafeMutablePointer<AVCodecContext>?
    let index: Int32
    let type: AVMediaType
    
    var w: Int32 {
        guard let c = self.codec else {
            return 0
        }
        
        return c.pointee.width
    }
    
    var h: Int32 {
        guard let c = self.codec else {
            return 0
        }
        
        return c.pointee.height
    }
    
    var videoSize: CGSize {
        return CGSize(width: Int(w), height: Int(h))
    }
    
    var fps: Double {
        let fps = av_q2d(self.stream.pointee.avg_frame_rate)
        return fps
    }
    
    var time_base: AVRational {
        switch self.type {
        case AVMEDIA_TYPE_VIDEO, AVMEDIA_TYPE_AUDIO:
            return self.stream.pointee.time_base
        default:
            return AVRational()
        }
    }
    
    var colorSpace: AVColorSpace {
        return self.stream.pointee.codecpar.pointee.color_space
    }
    
    init?(format: UnsafeMutablePointer<AVFormatContext>?, type: AVMediaType = AVMEDIA_TYPE_UNKNOWN, index: Int32 = -1) {
        
        guard let f = format else {
            return nil
        }

        self.format = f
        self.type = type
        
        guard type != AVMEDIA_TYPE_UNKNOWN || 0 <= index else {
            
            return nil
        }
        
        
        if 0 <= index {
            if index >= Int32(self.format.pointee.nb_streams) {
                return nil
            }
            self.index = index
        } else {
            self.index = av_find_best_stream(format, type, -1, -1, nil, 0)
            
            if 0 > self.index {
                return nil
            }
        }
        
        
        guard let s = self.format.pointee.streams[Int(self.index)], s.pointee.codecpar.pointee.codec_type == type else {
            return nil
        }
        
        self.stream = s
    }
    
    func open() -> Bool {
        guard let c = avcodec_find_decoder(self.stream.pointee.codecpar.pointee.codec_id) else {
            return false
        }
        
        self.codec = avcodec_alloc_context3(c)
        
        guard av_success_desc(avcodec_pa, <#T##desc: String##String#>)
        
        
        debugPrint("open stream -> \(self)")
        return true
    }
}
