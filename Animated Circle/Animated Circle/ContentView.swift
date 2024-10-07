//
//  ContentView.swift
//  Animated Circle
//
//  Created by PM Student on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animation = true
    private struct AnimationData: Equatable {
        
        let offset: CGSize
        let color: Color
        
        //Animation locations.
        static let array: [Self] = [
            .init(
                offset: .init(width: 0, height: 0),
                color: .green),
            .init(
                offset: .init(width: 100, height: 0),
                color: .blue),
            .init(
                offset: .init(width: 100, height: -100),
                color: .red),
            .init(
                offset: .init(width: -100, height: -100),
                color: .orange),
            .init(
                offset: .init(width: -100, height: 0),
                color: .yellow),
        ]
    }
    
    @State private var animatedData = AnimationData.array[0]
    var body: some View {
        Circle()
            .scaleEffect(0.5)
            .foregroundColor(animatedData.color)
        // Calls an offset and moves the circle around the screen.
            .animation(.default, value: animatedData)
            .offset(animatedData.offset)
            .padding()
        
            //Starts the animation sequence when the view appears.
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    for (index, data) in
                            AnimationData.array.enumerated()
                                .dropFirst() {
                        // adds a delay with each step.
                        DispatchQueue.main.asyncAfter(deadline: .now()
                                    + .seconds(index)){
                            animatedData = data
                        }
                    }
                }
                }
            }
        }
#Preview {
    ContentView()
}
