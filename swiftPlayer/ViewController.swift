//
//  ViewController.swift
//  swiftPlayer
//
//  Created by Kim. Dae-Hyun on 2017. 2. 14..
//  Copyright © 2017년 Kim. Dae-Hyun. All rights reserved.
//

import UIKit
import Metal
import MetalKit
import QuartzCore
import FFmpeg
import AVFoundation


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension ViewController  {
    func didCaptureBuffer(_ sampleBuffer: CMSampleBuffer) {
        let dataBuffer = CMSampleBufferGetDataBuffer(sampleBuffer)
        
    }
}
