//
//  VoiceChanger.swift
//  Fuchat
//
//  Created by Fumitaka Tokumitsu on 2020/11/14.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class VoiceChanger: ObservableObject {
  let objectWillChange = PassthroughSubject<VoiceChanger, Never>()

  private var engine = AVAudioEngine()

  var speaking = false {
    didSet {
      objectWillChange.send(self)
    }
  }
}