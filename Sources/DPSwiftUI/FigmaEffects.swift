//
//  FigmaEffects.swift
//  Team DayPic
//
//  Created by 박준홍 on 6/1/24.
//

import SwiftUI

struct LayerBlur: ViewModifier {
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .blur(radius: radius)
    }
}

struct DropShadow: ViewModifier {
    var x: CGFloat
    var y: CGFloat
    var blur: CGFloat
    var spread: CGFloat
    var color: Color = Color.black
    var opacity: CGFloat = 0.25
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(opacity), radius: blur, x: x, y: y)
            .padding(spread)
    }
}

struct InnerShadow: ViewModifier {
    var x: CGFloat
    var y: CGFloat
    var blur: CGFloat
    var spread: CGFloat
    var color: Color = Color.black
    var opacity: CGFloat = 0.25
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: spread)
                    .stroke(color.opacity(opacity), lineWidth: 2)
                    .shadow(color: color.opacity(opacity), radius: blur, x: x, y: y)
                    .clipShape(RoundedRectangle(cornerRadius: spread))
            )
    }
}

struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct BackgroundBlur: ViewModifier {
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .blur(radius: radius)
            )
    }
}

extension View {
    func layerBlur(radius: CGFloat) -> some View {
        self.modifier(LayerBlur(radius: radius))
    }
    
    func dropShadow(x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat, color: Color = .black, opacity: CGFloat = 0.25) -> some View {
        self.modifier(DropShadow(x: x, y: y, blur: blur, spread: spread, color: color, opacity: opacity))
    }
    
    func innerShadow(x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat, color: Color = .black, opacity: CGFloat = 0.25) -> some View {
        self.modifier(InnerShadow(x: x, y: y, blur: blur, spread: spread, color: color, opacity: opacity))
    }
    
    func backgroundBlur(radius: CGFloat) -> some View {
        self.modifier(BackgroundBlur(radius: radius))
    }
}
