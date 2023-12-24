//
//  ContentView.swift
//  GameSlider
//
//  Created by PASGON TEXTILE on 24.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = 50.0
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвинь меня поближе к: \(targetValue)")
                .padding()
            SliderRepresentative(value: $currentValue, targetValue: targetValue)
                .padding()
            VStack {
                Button("Начать заново") {
                    targetValue = Int.random(in: 1...100)
                    currentValue = 50.0
                }
                .padding()
                Button("Проверь меня") {
                    showAlert = true
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    let score = computeScore()
                    return Alert(title: Text("Ваш результат: \(score)"))
                }
            }
            
        }
    }
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
