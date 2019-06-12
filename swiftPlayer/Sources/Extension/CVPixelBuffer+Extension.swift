import Foundation
import AVFoundation
import AVKit
import CoreVideo

extension CVPixelBuffer {
    var width: Int {
        return CVPixelBufferGetWidth(self)
    }
    var height: Int {
        return CVPixelBufferGetHeight(self)
    }
}
