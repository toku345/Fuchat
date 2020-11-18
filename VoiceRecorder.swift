//
//  VoiceRecorder.swift
//  Fuchat
//
//  Created by Fumitaka Tokumitsu on 2020/11/18.
//

import AVFoundation
import Combine
import Foundation
import SwiftUI

class AudioRecorder: ObservableObject {
  let objectWillChange = PassthroughSubject<AudioRecorder, Never>()

  private var recorder: AVAudioRecorder!

  var recording = false {
    didSet {
      objectWillChange.send(self)
    }
  }


}
