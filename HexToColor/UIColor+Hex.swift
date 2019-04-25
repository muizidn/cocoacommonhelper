//
//  UIColor+Hex.swift
//  Example
//
//  Created by pondokios on 25/04/2019.
//  Copyright © 2019 pondokios. All rights reserved.
//

import UIKit

// https://www.hackingwithswift.com/example-code/uicolor/how-to-convert-a-hex-color-to-a-uicolor
extension UIColor {
    public convenience init?(hex: String) {
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            var hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                hexColor.append("ff")
            }
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    let r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    let g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    let b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    let a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

extension UIColor {
    static let magentaHex = UIColor(hex: "#FF00FF")
}
