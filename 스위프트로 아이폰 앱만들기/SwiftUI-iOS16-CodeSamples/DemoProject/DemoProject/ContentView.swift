//
//  ContentView.swift
//  DemoProject
//
//  Created by Neil Smyth on 7/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13")
                .previewDisplayName("iPhone 13")
            ContentView()
                .previewDevice("iPhone SE (2nd generation)")
                .previewDisplayName("iPhone SE")
        }

    }
}
