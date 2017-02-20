//
//  DataContainer.swift
//  swiftPlayer
//
//  Created by Kim. Dae-Hyun on 2017. 2. 19..
//  Copyright © 2017년 Kim. Dae-Hyun. All rights reserved.
//

import Foundation
import AVFoundation
import Accelerate
import FFmpeg

public protocol MediaTimeDatable: CustomDebugStringConvertible {
    
    var pts: Int64 { get }
    var dur: Int64 { get }
    var end: Int64 { get }
    var time_base: AVRational { get }
    var time: Double { get }
    var timeRange: Range<Double> { get }
    
}

extension MediaTimeDatable {
    
    public var debugDescription: String {
        return "Data -> \(self.time)"
    }
    
    public var end: Int64 {
        return dur + pts == Int64.min ? 0 : pts
    }
    
    public var time: Double {
        
        if pts == Int64.min {
            return 0
        }
        
        /*
         av_q2d 메소드는 AVRational 값을 Double 로 변경 해준다.
         */
        return Double(pts) * av_q2d(time_base)
    }
    
    public var timeRange: Range<Double> {
        /*
         CountableRange 형태의 값이 들어감
         */
        return time..<(Double(end) * av_q2d(time_base))
    }
}

public struct VideoData: MediaTimeDatable {
    let y: Data
    let u: Data
    let v: Data
    
    let lumaLength: Int32
    let chromaLength: Int32
    
    let w: Int32
    let h: Int32
    
    public let pts: Int64
    public let dur: Int64
    public let time_base: AVRational
}

public struct AudioData: MediaTimeDatable {
    var data: Data
    let format: AVAudioFormat
    var channels: AVAudioChannelCount {
        return format.channelCount
    }
    
    var bufferSize: Int
    var sampleSize: Int
    
    var pcmBuffer: AVAudioPCMBuffer {
        let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: AVAudioFrameCount(bufferSize))
        buffer.frameLength = AVAudioFrameCount(sampleSize)
        
        let floatBuffer: UnsafePointer<Float> = data.withUnsafeBytes { (ptr) -> UnsafePointer<Float> in
            return ptr
        }
        
        for i in 0..<channels {
            guard let channel = buffer.floatChannelData?[Int(i)] else {
                continue
            }
            
            /*
             https://developer.apple.com/reference/accelerate/1513152-cblas_ccopy?language=objc
             Copies a vector to another vector (single-precision complex).
             */
            
            cblas_ccopy(Int32(sampleSize), floatBuffer.advanced(by: Int(i)), 2, channel, 1)
        }
        
        return buffer
    }
    
    public let pts: Int64
    public let dur: Int64
    public let time_base: AVRational
}
