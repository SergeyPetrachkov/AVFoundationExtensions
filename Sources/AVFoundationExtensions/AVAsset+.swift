//
//  AVAsset+.swift
//  
//
//  Created by sergey on 01.09.2020.
//

import AVFoundation
import UIKit

public extension AVAsset {
  var orientation: UIInterfaceOrientation {

    guard let transform = self.tracks(withMediaType: AVMediaType.video).first?.preferredTransform else {
      return .portrait
    }
    let videoAngle = atan2(transform.b, transform.a) * 180 / CGFloat.pi
    switch videoAngle {
    case 0:
      return .landscapeRight
    case 90:
      return .portrait
    case 180:
      return .landscapeLeft
    case -90:
      return .portraitUpsideDown
    default:
      return .portrait
    }
  }
}
