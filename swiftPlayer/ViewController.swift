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
import VideoToolbox

class ViewController: UIViewController {

    @IBOutlet weak var renderView: RenderView!
    
    var videoCamera: Camera?
    let rtmpConnection = RTMPConnection()
    var rtmpStream: RTMPStream!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.videoCamera = try Camera(sessionPreset: .high)
            self.videoCamera?.delegate = self
            self.videoCamera?.audioEncodingTarget = self
            self.videoCamera! --> self.renderView
            
            
            self.rtmpStream = RTMPStream(connection: rtmpConnection)
//            rtmpStream.attachAudio(AVCaptureDevice.default(for: .audio))
//            rtmpStream.attachGPUImageCamera(self.videoCamera!)
//            rtmpStream.videoSettings = [
//                "width": 1920,
//                "height": 1080,
//                "bitrate": 32 * 1024,
//                "profileLevel": kVTProfileLevel_H264_Baseline_3_1,
//                "maxKeyFrameIntervalDuration" : 2
//            ]
//
//            rtmpStream.audioSettings = [
//                "muted": false,
//                "bitrate": 32 * 1024,
//                "sampleRate": 44_100,
//            ]
            
            self.videoCamera!.startCapture()
//            rtmpConnection.connect("rtmp://x.rtmp.youtube.com/live2")
//            rtmpStream.publish("ts0q-v4w1-82ks-1yye")

            rtmpConnection.connect("rtmp://rtmpmanager-freecat.afreeca.tv/app")
            rtmpStream.publish("mycisco-1588604488")
            
            //mobqq05-382095440
            //mobqq05-382095440
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
//        let dataBuffer = CMSampleBufferGetDataBuffer(sampleBuffer)
        
        self.rtmpStream.appendSampleBuffer(sampleBuffer, withType: .video)
        
    }
}

extension ViewController: AudioEncodingTarget {
    func activateAudioTrack() {
        
    }
    
    func processAudioBuffer(_ sampleBuffer: CMSampleBuffer) {
        self.rtmpStream.appendSampleBuffer(sampleBuffer, withType: .audio)
    }
    
    
}
