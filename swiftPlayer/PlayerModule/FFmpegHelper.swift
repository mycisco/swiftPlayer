//
//  FFmpegHelper.swift
//  swiftPlayer
//
//  Created by marbean on 2017. 2. 15..
//  Copyright © 2017년 Kim. Dae-Hyun. All rights reserved.
//

import Foundation
import FFmpeg

func av_success_desc(_ ret: Int32, _ desc: String) -> Bool {
    if (0 <= ret) {
        return true
    }
    
    debugPrint(desc)
    
    return false
}
