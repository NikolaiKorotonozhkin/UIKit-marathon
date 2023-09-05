//
//  ViewController.swift
//  task3
//
//  Created by Nikolai  on 05.09.2023.
//

import UIKit

class ViewController: UIViewController {

    var animator: UIViewPropertyAnimator!
    var animatedView = UIView()
    let slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        createSlider()
        
        animator = UIViewPropertyAnimator(duration: 2, curve: .linear, animations: {
            self.animatedView.center.x = self.view.frame.width - ((self.animatedView.frame.width * 1.5) / 2) - self.view.layoutMargins.right
            self.animatedView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2).scaledBy(x: 1.5, y: 1.5)
        })
        
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderChanged2), for: .touchUpInside)
        
    }

    @objc func sliderChanged(_ sender: UISlider) {
        animator.pausesOnCompletion = true
        animator.fractionComplete = CGFloat(sender.value)
        animator.pauseAnimation()
    }
    
    @objc func sliderChanged2(_ sender: UISlider) {
        animator.startAnimation()
        
        //анимация ползунка слайдера
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveLinear) {
            sender.setValue(1, animated: true)
        }
    }
    
    func createView() {
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        animatedView.backgroundColor = UIColor.blue
        animatedView.layer.cornerRadius = 10
        animatedView.center.y = view.center.y - 200
        view.addSubview(animatedView)
        
        animatedView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
        animatedView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        animatedView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        animatedView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    
    func createSlider() {
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        
        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500).isActive = true
        slider.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        slider.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
    }
  
}

