//
//  ViewController.swift
//  task7
//
//  Created by Nikolai  on 05.09.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let imageView = UIImageView(image: .init(named: "testImage"))
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.delegate = self
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        scrollView.addSubview(imageView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        imageView.frame = .init(x: .zero,
                                y: -scrollView.safeAreaInsets.top,
                                width: scrollView.frame.width,
                                height: imageHeight)
        
        scrollView.contentSize = .init(width: view.frame.width, height: 2000)
    }
    
    private let imageHeight: CGFloat = 270
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + scrollView.safeAreaInsets.top
        if y < 0 {
            imageView.frame = .init(x: .zero,
                                    y: -scrollView.safeAreaInsets.top + y,
                                    width: scrollView.frame.width,
                                    height: imageHeight + abs(y))
        }
        
        scrollView.scrollIndicatorInsets.top = imageView.frame.height - scrollView.safeAreaInsets.top
        
    }
}

