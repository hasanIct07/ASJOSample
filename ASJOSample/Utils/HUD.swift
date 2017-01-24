//
//  HUD.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/22/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import MBProgressHUD
import UIKit

extension MBProgressHUD {
  static func showHUDAddedTo(view: UIView, withMessage message: String, animated: Bool) -> MBProgressHUD! {
    let HUD = showHUDAddedTo(view, animated: true)
    HUD.labelText = message
    return HUD
  }
}

extension UIViewController {
  func showError(message: String, withTitle title: String? = nil) {
    let error = UIAlertController(title: title ?? "Error", message: message, preferredStyle: .Alert)
    error.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    presentViewController(error, animated: true, completion: nil)
  }
  
  func showError(error: NSError?) {
    showError(error?.localizedDescription ?? "Server Error")
  }
}
