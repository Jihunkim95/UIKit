//
//  ImageDocDemoApp.swift
//  ImageDocDemo
//
//  Created by Neil Smyth on 7/28/22.
//

import SwiftUI

@main
struct ImageDocDemoApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: ImageDocDemoDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
