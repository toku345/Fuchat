//
//  FuchatApp.swift
//  Fuchat
//
//  Created by Fumitaka Tokumitsu on 2020/11/13.
//

import SwiftUI

@main
struct FuchatApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(voiceRecorder: VoiceRecorder(), voiceChanger: VoiceChanger())
    }
  }
}
