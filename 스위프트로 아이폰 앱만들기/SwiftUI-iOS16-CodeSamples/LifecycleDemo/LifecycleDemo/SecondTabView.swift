//
//  SecondTabView.swift
//  LifecycleDemo
//
//  Created by Neil Smyth on 8/1/22.
//

import SwiftUI

struct SecondTabView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .onChange(of: text, perform: { value in
                print("onChange triggered")
            })
    }
}

struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView()
    }
}
