//
//  UIScrollView.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/22/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import Foundation
import UIKit

public extension UIScrollView {
    
    public func scrollToBottom(animated animated: Bool) {

        let bottomOffset = CGPointMake(contentOffset.x, max(contentSize.height - bounds.size.height + contentInset.bottom, 0));
        setContentOffset(bottomOffset, animated: animated)
    }
    
}