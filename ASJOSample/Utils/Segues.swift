//
//  Segues.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/22/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import UIKit

class DismissSegue: UIStoryboardSegue {
  override func perform() {
    let presenting = sourceViewController.presentingViewController
    presenting?.dismissViewControllerAnimated(true) {
      if let nav = presenting as? UINavigationController ?? presenting?.navigationController {
        nav.pushViewController(self.destinationViewController, animated: true)
      } else {
        presenting?.presentViewController(self.destinationViewController, animated: true, completion: nil)
      }
    }
  }
}
