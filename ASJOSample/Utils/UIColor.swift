//
//  UIColor.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/22/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(hex: String) {
    let value = strtoll(hex.cStringUsingEncoding(NSASCIIStringEncoding)!, nil, 16)
    let red = (value & 0xff0000) >> 16
    let green = (value & 0x00ff00) >> 8
    let blue = (value & 0x0000ff) >> 0
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
}