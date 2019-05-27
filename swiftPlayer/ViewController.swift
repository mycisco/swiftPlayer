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

class ViewController: UIViewController, CameraDelegate {

    @IBOutlet weak var renderView: RenderView!
    
    private var camera: Camera?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.camera = try Camera(sessionPreset: .hd1280x720)
//            self.camera!.runBenchmark = true
            
            let filter = SaturationAdjustment()
            
            self.camera! --> filter --> renderView
            
//            self.camera?.addTarget(renderView)
            self.camera?.startCapture()
            self.camera?.delegate = self
        } catch {
            self.camera = nil
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension ViewController  {
    func didCaptureBuffer(_ sampleBuffer: CMSampleBuffer) {
        
    }
}
