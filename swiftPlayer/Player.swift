//
//  Player.swift
//  swiftPlayer
//
//  Created by marbean on 2017. 2. 15..
//  Copyright © 2017년 Kim. Dae-Hyun. All rights reserved.
//

import Foundation
import Metal
import FFmpeg



public class Player: CustomDebugStringConvertible {
    public var debugDescription: String {
        
        return ""
    }
    
    
    let path: String
    let format: SweetFormat
//    var progressHandle: PlayerPr
    
    public init?(path: String) {
        
        self.path = path
        av_register_all()
        avformat_network_init()
        
        guard let format = SweetFormat() else {
            return nil
        }
        
        self.format = format
//

    }

    
}
