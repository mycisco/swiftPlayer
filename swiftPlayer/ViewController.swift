//
//  ViewController.swift
//  swiftPlayer
//
//  Created by Kim. Dae-Hyun on 2017. 2. 14..
//  Copyright © 2017년 Kim. Dae-Hyun. All rights reserved.
//

import UIKit
import FFmpeg

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ffmpegInit()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    var formatContext: UnsafeMutablePointer<AVFormatContext>?
    func ffmpegInit() {
        
        av_register_all()
        avformat_network_init()
        
        let path: String = "http://www.ithinknext.com/mydata/board/files/F201308021823010.mp4"
        guard av_success_desc(avformat_open_input(&formatContext, path, nil, nil), "open failed") else {
            return
        }
        
        guard av_success_desc(avformat_find_stream_info(formatContext, nil), "find stream info") else {
            return
        }
        
        av_dump_format(formatContext, -1, path, 0)
        
//        if let vidoes = formatContext?.pointee.str
    }
}


//// Extension
//extension AVFormatContext {
//    mutating func streamArray(_ type: AVMediaType) -> []
//}
