//
//  ViewController.swift
//  task8
//
//  Created by Nikolai  on 05.09.2023.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    let avatarView = UIImage(systemName: "person.crop.circle.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        createUI()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                if let largeTitleClass = NSClassFromString("_UINavigationBarLargeTitleView") as? UIView.Type {
                    if let largeTitleView = self.findSubview(parentView: self.navigationController!.view, type: largeTitleClass) {
                        let newView: UIImageView = UIImageView(frame: CGRect(x: 10, y: 20, width: 36, height: 36))
                        newView.image = self.avatarView
                        newView.alpha = 1
                        newView.backgroundColor = .clear
                        largeTitleView.clipsToBounds = true
                        largeTitleView.addSubview(newView)
                        newView.translatesAutoresizingMaskIntoConstraints = false

                        NSLayoutConstraint.activate([
                            newView.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor, constant: -12),
                            newView.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: -11),
                            newView.widthAnchor.constraint(equalToConstant: 36),
                            newView.heightAnchor.constraint(equalToConstant: 36)

                        ])
                        
                    }
                }
            }
    }
    
    private func setupScrollView() {
        scrollView.frame = view.bounds
        scrollView.backgroundColor = .white
        scrollView.contentSize = .init(width: view.frame.width, height: 2000)
        view.addSubview(scrollView)

    }
    
    func createUI() {
        title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    func findSubview(parentView: UIView, type: UIView.Type) -> UIView? {
        for subview in parentView.subviews {
            if subview.isKind(of: type) {
                return subview
            } else if let desiredInstance = findSubview(parentView: subview, type: type) {
                return desiredInstance
            }
        }
        return nil
     }
    
}
