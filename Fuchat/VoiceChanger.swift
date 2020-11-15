//
//  VoiceChanger.swift
//  Fuchat
//
//  Created by Fumitaka Tokumitsu on 2020/11/14.
//

import AVFoundation
import Combine
import Foundation
import SwiftUI

class VoiceChanger: ObservableObject {
  let objectWillChange = PassthroughSubject<VoiceChanger, Never>()

  private var engine = AVAudioEngine()

  var isSpeaking = false {
    didSet {
      objectWillChange.send(self)
    }
  }

  init() {
    setupAudioSession()
    setupAudioEngine()
  }

  func setupAudioSession() {
    let session = AVAudioSession.sharedInstance()
    do {
      try session.setCategory(.playAndRecord, options: [.allowBluetoothA2DP])
    } catch {
      print("Failed to configure and activate session.")
    }
  }

  func setupAudioEngine() {
    let delay = AVAudioUnitDelay()
    let reverb = AVAudioUnitReverb()

    let input = engine.inputNode
    let output = engine.outputNode
    let format = engine.inputNode.inputFormat(forBus: 0)
    delay.delayTime = 2.0
    reverb.loadFactoryPreset(.largeRoom)
    reverb.wetDryMix = 40

    engine.attach(delay)
    engine.attach(reverb)
    engine.connect(input, to: delay, format: format)
    engine.connect(delay, to: reverb, format: format)
    engine.connect(reverb, to: output, format: format)
  }

  func start() {
    do {
      try engine.start()
      isSpeaking = true
    } catch {
      print("Playback failed.")
    }
  }

  func stop() {
    engine.stop()
    isSpeaking = false
  }
}
