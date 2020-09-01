//
//  AudioSessionManager.swift
//  
//
//  Created by sergey on 01.09.2020.
//

import AVFoundation

public class AudioSessionManager {

  public let session = AVAudioSession.sharedInstance()

  public init() {}

  public func setAudioState(active: Bool, options: AVAudioSession.CategoryOptions = .mixWithOthers) throws {
    let category: AVAudioSession.Category = active ? .playback : .ambient
    try self.session.setCategory(category, options: options)
  }
}
