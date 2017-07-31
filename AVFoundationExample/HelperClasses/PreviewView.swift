//
//  PreviewView.swift
//  AVFoundationExample
//
//  Created by Bindu on 24/07/17.
//  Copyright © 2017 Xminds. All rights reserved.
//

import UIKit
import AVFoundation

class PreviewView: UIView {
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    var session: AVCaptureSession? {
        get {
            return videoPreviewLayer.session
        }
        set {
            videoPreviewLayer.session = newValue
            videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer.connection.isEnabled = true
        }
    }
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    private var orientationMap: [UIDeviceOrientation : AVCaptureVideoOrientation] = [
        .portrait           : .portrait,
        .portraitUpsideDown : .portraitUpsideDown,
        .landscapeLeft      : .landscapeRight,
        .landscapeRight     : .landscapeLeft,
        ]
    func updateVideoOrientationForDeviceOrientation() {
        if let videoPreviewLayerConnection = videoPreviewLayer.connection {
           // let deviceOrientation = UIDevice.current.orientation
//            guard let newVideoOrientation = .p /*orientationMap[deviceOrientation],
//                deviceOrientation.isPortrait || deviceOrientation.isLandscape*/
//                else {
//                    return
//            }
            videoPreviewLayerConnection.videoOrientation = .portrait
        }
    }
}
