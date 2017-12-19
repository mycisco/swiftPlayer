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
//import FFmpeg

/*
 
 Create a MTLDevice
 Create a CAMetalLayer
 Create a Vertex Buffer
 Create a Vertex Shader
 Create a Fragment Shader
 Create a Render Pipeline
 Create a Command Queue
 
 */



class ViewController: UIViewController {

    
    @IBOutlet var mtkView: MTKView!
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path = "http://www.ithinknext.com/mydata/board/files/F201308021823010.mp4"
        self.player = Player(path: path)
//        guard  _ player = Player(path: path) else {
//            return
//        }
        
//        
//        self.player = player
//        
//        guard let video = self.player?.v
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
