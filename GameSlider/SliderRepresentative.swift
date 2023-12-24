//
//  SliderRepresentative.swift
//  GameSlider
//
//  Created by PASGON TEXTILE on 24.12.23.
//

import SwiftUI

struct SliderRepresentative: UIViewRepresentable {
    
    @Binding var value: Double
    var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 1
        slider.maximumValue = 100
        slider.value = Float(value)
        
        slider.addTarget(
            context.coordinator,
                         
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        let difference = abs(targetValue - lround(value))
        let alpha = CGFloat(100 - difference) / 100
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(alpha)
}
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    }
extension SliderRepresentative {
    class Coordinator: NSObject {
        @Binding var value: Double
        init(value: Binding<Double>) {
            self._value = value
        }
        @objc
        func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
        
    }
}

#Preview {
    SliderRepresentative(value: .constant(80), targetValue: 50)
}
