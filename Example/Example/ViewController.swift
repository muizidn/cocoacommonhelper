//
//  ViewController.swift
//  Example
//
//  Created by pondokios on 24/04/2019.
//  Copyright © 2019 pondokios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nibInstantiable()
    }
    
    private func nibInstantiable() {
        if let view1 = CustomView.fromNib() {
            view1.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
            view.addSubview(view1)
        }
        
        if let view2 = CustomView(index: 1) {
            view2.frame = CGRect(x: 50, y: 200, width: 100, height: 100)
            view.addSubview(view2)
        }
        
        if let view3 = CustomView.withOwner(UIView.self, index: 2) {
            view3.frame = CGRect(x: 50, y: 350, width: 100, height: 100)
            view.addSubview(view3)
        }
    }
}

