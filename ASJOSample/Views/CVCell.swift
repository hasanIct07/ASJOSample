//
//  CVCell.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/24/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import UIKit

class CVCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2 - 10;
        self.imageView.clipsToBounds = true;
    }
}
