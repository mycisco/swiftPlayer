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

    @IBOutlet weak var cameraContainer: UIView!
    
    private var camera: Camera?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.camera = try Camera(sessionPreset: .hd1920x1080)
        } catch {
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
