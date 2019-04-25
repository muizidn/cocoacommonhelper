//
//  CustomView.swift
//  Example
//
//  Created by pondokios on 24/04/2019.
//  Copyright © 2019 pondokios. All rights reserved.
//

import UIKit

public class CustomView: UIView {}

public class ModuleBundle {
    private init() {}
    // Cross Module usage
    public static let bundle = Bundle(for: ModuleBundle.self)
}

extension Bundle {
    // Internal usage
    static let module = ModuleBundle.bundle
}
