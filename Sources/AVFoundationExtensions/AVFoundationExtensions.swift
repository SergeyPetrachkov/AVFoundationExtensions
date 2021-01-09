//
//  AudioTrackContainable.swift
//  
//
//  Created by sergey on 01.09.2020.
//

import AVFoundation

public protocol AudioTrackContainable {
  var hasAudioTrack: Bool { get }
}

extension AVAsset: AudioTrackContainable {
  public var hasAudioTrack: Bool {
    self.tracks(withMediaType: .audio).isEmpty == false
  }
}

extension AVPlayerItem: AudioTrackContainable {
  public var hasAudioTrack: Bool {
    self.asset.hasAudioTrack
  }
}

extension AVPlayer: AudioTrackContainable {
  public var hasAudioTrack: Bool {
    self.currentItem?.hasAudioTrack ?? false
  }
}

extension AVAssetTrack {
  public var isSquare: Bool {
    self.naturalSize.width == self.naturalSize.height
  }

  public var isVertical: Bool {
    self.naturalSize.width < self.naturalSize.height
  }

  public var isHorizontal: Bool {
    self.naturalSize.width > self.naturalSize.height
  }
}
