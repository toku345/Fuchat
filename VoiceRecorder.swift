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

  func startRecording() {
    let session = AVAudioSession.sharedInstance()
    do {
      try session.setCategory(.playAndRecord, mode: .default)
      try session.setActive(true)
    } catch {
      print("Failed to configure and activate session.")
    }

    let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let audioFilename = documentPath.appendingPathComponent("voice.mp4")

    let settings = [
      AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
      AVSampleRateKey: 12000,
      AVNumberOfChannelsKey: 1,
      AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
    ]

    do {
      recorder = try AVAudioRecorder(url: audioFilename, settings: settings)
      recorder.record()
      recording = true
    } catch {
      print("Could not start recording.")
    }
  }
}
