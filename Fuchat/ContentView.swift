//
//  ContentView.swift
//  Fuchat
//
//  Created by Fumitaka Tokumitsu on 2020/11/13.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var voiceRecorder: VoiceRecorder
  @ObservedObject var voiceChanger: VoiceChanger

  var body: some View {
    VStack {
      HStack {
        if voiceRecorder.recording == false {
          Button(action: self.voiceRecorder.startRecording) {
            Image(systemName: "circle.fill")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 100, height: 100)
              .foregroundColor(.red)
          }
        } else {
          Button(action: self.voiceRecorder.stopRecording) {
            Image(systemName: "stop.fill")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 100, height: 100)
              .foregroundColor(.red)
          }
        }

        Spacer()

        if voiceChanger.isSpeaking == false {
          Button(action: self.voiceChanger.start) {
            Image(systemName: "arrow.up.message.fill")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 100, height: 100)
              .foregroundColor(.green)
          }
        } else {
          Button(action: self.voiceChanger.stop) {
            Image(systemName: "stop.fill")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 100, height: 100)
              .foregroundColor(.red)
          }
        }
      }.padding(50)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(voiceRecorder: VoiceRecorder(), voiceChanger: VoiceChanger())
  }
}
