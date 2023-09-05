//
//  ViewController.swift
//  task5
//
//  Created by Nikolai  on 05.09.2023.
//

import UIKit

class ViewController: UIViewController {

    let presentButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPresentButton()
        presentButton.addTarget(self, action: #selector(presentButtonPressed), for: .touchUpInside)
    }
    
    func createPresentButton() {
        presentButton.frame = CGRect(x: 0, y: 80, width: 100, height: 40)
        presentButton.center.x = view.center.x
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.link, for: .normal)
        view.addSubview(presentButton)
    }
    
    @objc func presentButtonPressed() {
        let popoverVC = PopoverViewController()
        popoverVC.modalPresentationStyle = .popover
        //popoverVC.preferredContentSize = CGSize(width: 300, height: 280)
        
        guard let presentationVC = popoverVC.popoverPresentationController else { return }
        presentationVC.delegate = self
        presentationVC.sourceView = presentButton
        presentationVC.permittedArrowDirections = .up
        presentationVC.sourceRect = CGRect(x: presentButton.bounds.midX,
                                           y: presentButton.bounds.maxY + 5,
                                           width: 0,
                                           height: 0)
        present(popoverVC, animated: true)
        
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

