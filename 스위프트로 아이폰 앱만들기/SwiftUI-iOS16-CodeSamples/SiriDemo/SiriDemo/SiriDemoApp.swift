//
//  SiriDemoApp.swift
//  SiriDemo
//
//  Created by Neil Smyth on 7/29/22.
//

import SwiftUI
import Intents

@main
struct SiriDemoApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { phase in
            INPreferences.requestSiriAuthorization({status in
                // Handle errors here
            })
        }
    }
}
