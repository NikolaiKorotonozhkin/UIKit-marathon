//
//  PopoverViewController.swift
//  task5
//
//  Created by Nikolai  on 05.09.2023.
//

import UIKit

class PopoverViewController: UIViewController {

    let closeButton = UIButton()
    let menuArray = ["280pt", "150pt"]
    var segmentedContol = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        createCloseButton()
        createSegmentedControl()
        
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        segmentedContol.addTarget(self, action: #selector(segmentedControlChanged(target:)), for: .valueChanged)
        
        //constraints
        let widthConstraint = self.view.widthAnchor.constraint(equalToConstant: 300)
        widthConstraint.priority = .defaultHigh
        widthConstraint.isActive = true
        let heightConstraint = self.view.heightAnchor.constraint(equalToConstant: 280)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setContentSize()
    }
    
    func setContentSize() {
        let contentSize = self.view.systemLayoutSizeFitting(
            UIView.layoutFittingCompressedSize
        )
        self.preferredContentSize = contentSize
        self.popoverPresentationController?.presentedViewController.preferredContentSize = contentSize
    }
    
    func setContentSize150() {
        var contentSize = self.view.systemLayoutSizeFitting(
            UIView.layoutFittingCompressedSize
        )
        contentSize.height = 150
        self.preferredContentSize = contentSize
        self.popoverPresentationController?.presentedViewController.preferredContentSize = contentSize
    }
    
    func createCloseButton() {
        closeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        closeButton.layer.cornerRadius = closeButton.bounds.height / 2
        closeButton.backgroundColor = .systemGray4
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .black
        closeButton.titleLabel?.textAlignment = .center
        closeButton.setTitleColor(.black, for: .normal)
        view.addSubview(closeButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc func closeButtonPressed() {
        dismiss(animated: true)
    }
    
    func createSegmentedControl() {
        segmentedContol = UISegmentedControl(items: menuArray)
        segmentedContol.selectedSegmentIndex = 0
        segmentedContol.backgroundColor = .systemGray4
        view.addSubview(segmentedContol)
        
        segmentedContol.translatesAutoresizingMaskIntoConstraints = false
        segmentedContol.widthAnchor.constraint(equalToConstant: 100).isActive = true
        segmentedContol.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedContol.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedContol.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    }
    
    @objc func segmentedControlChanged(target: UISegmentedControl) {
        if target.selectedSegmentIndex == 1 {
            setContentSize150()
        } else {
            setContentSize()
        }
    }

}
