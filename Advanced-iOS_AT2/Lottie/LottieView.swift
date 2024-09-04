//
//  LottieView.swift
//  Week4_Tutorial
//
//  Created by Byron Lester on 28/8/2024.
//
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let name: String
    let loopMode: LottieLoopMode
    let animationSpeed: CGFloat
    let animationView = LottieAnimationView()
    var size: CGSize
    
    init(name: String,
         loopMode: LottieLoopMode = .playOnce,
         animationSpeed: CGFloat = 1, width: Int, height: Int) {
        self.name = name
        self.loopMode = loopMode
        self.animationSpeed = animationSpeed
        self.size = CGSize(width: width, height: height)
    }
    
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
            let view = UIView(frame: .zero)
            
            animationView.animation = LottieAnimation.named(name)
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = loopMode
            animationView.play()
            
            view.addSubview(animationView)
            
            animationView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                animationView.widthAnchor.constraint(equalToConstant: size.width),
                animationView.heightAnchor.constraint(equalToConstant: size.height),
                animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            
            return view
    }
        
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        // Update view if needed
    }

}

