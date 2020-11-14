//
//  ContentView.swift
//  Fuchat
//
//  Created by Fumitaka Tokumitsu on 2020/11/13.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var voiceChanger: VoiceChanger

  var body: some View {
    VStack {
      if voiceChanger.speaking == false {
        Button(action: { print("Button Tapped!") }) {
          Image(systemName: "arrow.up.message.fill")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .foregroundColor(.green)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(voiceChanger: VoiceChanger())
  }
}
