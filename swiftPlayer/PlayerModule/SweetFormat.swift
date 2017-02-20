//
//  SweetFormat.swift
//  swiftPlayer
//
//  Created by marbean on 2017. 2. 15..
//  Copyright © 2017년 Kim. Dae-Hyun. All rights reserved.
//

import Foundation
import FFmpeg

class SweetFormat: CustomDebugStringConvertible {
    
    public var debugDescription: String {
    
        av_dump_format(self.formatContext, -1, self.path, 0)
        
        let description = "path: \(self.path)\nduration: \(self.duration)"
        
//        return self.str
        
        return ""
    }
    
    public var duration: Double {
        
        return 1.1
    }
    
    var formatContext: UnsafeMutablePointer<AVFormatContext>?
    var path: String = ""
//    fileprivate(set) var streamByType: [AVMediaType: [SweetStream]] = [AVMediaType: [SweetStream]]()
//    fileprivate(set) var streamsByType: [AVMediaType: [SweetStream]] = [AVMediaType:[SweetStream]]()
    
    init?() {
        
        return nil
    }
//    fileprivate(set) var streamsByType: [AVMediaType: [Sw]]
}
