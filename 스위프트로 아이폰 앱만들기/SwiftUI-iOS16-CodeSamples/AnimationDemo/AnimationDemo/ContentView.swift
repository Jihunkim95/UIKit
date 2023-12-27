//
//  ContentView.swift
//  AnimationDemo
//
//  Created by Neil Smyth on 7/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redCircle = false
    @State private var scale: CGFloat = 1
    @State private var rotation: Double = 0
    @State private var visibility = false
    @State private var isSpinning: Bool = true
    @State private var isButtonVisible: Bool = true

    var body: some View {
         /*
        VStack {
             Toggle(isOn:$isButtonVisible.animation(
                                    .linear(duration: 2))) {
                 Text("Show/Hide Button")
             }
             .padding()
            
             if isButtonVisible {
                 Button(action: {}) {
                     Text("Example Button")
                 }
                 .font(.largeTitle)
                 .transition(.fadeAndMove)
             }
         }
        */
        
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(Color.blue)
                .frame(width: 360, height: 360)
               
            Image(systemName: "forward.fill")
               .font(.largeTitle)
               .offset(y: -180)
               .rotationEffect(.degrees(rotation))
               .animation(Animation.linear(duration: 5)
                            .repeatForever(autoreverses: false), value: rotation)
        }
        .onAppear() {
                  self.isSpinning.toggle()
                  rotation = isSpinning ? 0 : 360
               }

         
        /*
        VStack {
             Toggle(isOn: $visibility.animation(.linear(duration: 5))) {
                Text("Toggle Text Views")
             }
             .padding()
     
             if visibility {
                 Text("Hello World")
                     .font(.largeTitle)
             }
     
             if !visibility {
                 Text("Goodbye World")
                     .font(.largeTitle)
             }
         }
         */
        
        /*
        Button(action: {
            self.rotation =
                   (self.rotation < 360 ? self.rotation + 60 : 0)
            self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
            }) {
            Text("Click to animate")
                .rotationEffect(.degrees(rotation))
                .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0), value: rotation)
                .scaleEffect(scale)
        }
         */
        /*
        Circle()
            .fill(redCircle ? .red : .blue)
            .frame(width: 200, height: 200)
                .onTapGesture {
                    withAnimation {
                        redCircle.toggle()
                    }
                }
         */
    }
}

extension AnyTransition {
    static var fadeAndMove: AnyTransition {
        AnyTransition.opacity.combined(with: .move(edge: .top))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
