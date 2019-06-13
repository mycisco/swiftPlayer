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
import GPUImage

class ViewController: UIViewController {

    @IBOutlet weak var renderView: RenderView!
    
    var videoCamera: Camera?
    let rtmpConnection = RTMPConnection()
    var rtmpStream: RTMPStream!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.videoCamera = try Camera(sessionPreset: .low)
            self.videoCamera?.delegate = self
            self.videoCamera! --> self.renderView
            
            
            self.rtmpStream = RTMPStream(connection: rtmpConnection)
            rtmpStream.attachAudio(AVCaptureDevice.default(for: .audio))
            rtmpStream.attachGPUImageCamera(self.videoCamera!)
            rtmpStream.videoSettings = [
                "width": 720,
                "height": 1280,
            ]
            
            self.videoCamera!.startCapture()
            rtmpConnection.connect("rtmp://x.rtmp.youtube.com/live2")
            rtmpStream.publish("28m9-c8tz-vmqu-dh9s")
            
            
        } catch {
            self.videoCamera = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension ViewController: CameraDelegate  {
    func didCaptureBuffer(_ sampleBuffer: CMSampleBuffer) {
        let dataBuffer = CMSampleBufferGetDataBuffer(sampleBuffer)
        
        self.rtmpStream.appendSampleBuffer(sampleBuffer, withType: .video)
        
    }
}
