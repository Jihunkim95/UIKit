//
//  ContentView.swift
//  UIViewDemo
//
//  Created by Neil Smyth on 8/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyScrollView(text: "UIView in SwiftUI")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
