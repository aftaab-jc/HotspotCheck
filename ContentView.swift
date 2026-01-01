//
//  ContentView.swift
//  Hotspot check
//
//  Created by Aftaab Mulla on 01/01/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var hotspotchecker = HotspotChecker()
    var body: some View {
        VStack {
            Button {
                if hotspotchecker.alreadyConnectedToHotspot {
                    Connected_Page()
                } else {
                    NotConnectedPage()
                }
            } label: {
                Text("Check for connection")
            }

        }
    }
}

#Preview {
    ContentView()
}
