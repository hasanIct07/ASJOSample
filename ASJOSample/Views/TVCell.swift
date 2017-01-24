//
//  TVCell.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/24/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import UIKit

class TVCell: UITableViewCell {
    
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    weak var delegate: TVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.songImageView.layer.cornerRadius = 3;
        self.songImageView.clipsToBounds = true;
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TVCell.tapHandler(_:)))
        self.songImageView.addGestureRecognizer(tapGestureRecognizer)
        self.songImageView.userInteractionEnabled = true
    }
    
    func tapHandler(sender: UITapGestureRecognizer) {
        
        if sender.state == .Ended {
            
            delegate?.didTapImageView(self.songImageView)
        }
    }
}


protocol TVCellDelegate: class {
    
    func didTapImageView(imageView: UIImageView)
}