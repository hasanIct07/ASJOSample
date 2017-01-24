//
//  VendorCalloutView.swift
//  Cyoo
//
//  Created by Mehedi Hasan on 12/27/16.
//  Copyright © 2016 Ruslan Sokolov. All rights reserved.
//

import UIKit

class VendorCalloutView: UIView {
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var promotionNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var redeemButton: UIButton!
    @IBOutlet weak var myRedeemButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func redeemButtonTapped() {
        delegate?.didTapRedeemInVendorCalloutView(self)
    }
    
    @IBAction func myRedeemButtonTapped() {
        
        delegate?.didTapMyRedeemInVendorCalloutView(self)
    }
    
    @IBAction func closeButtonTapped() {
        delegate?.didTapCloseInVendorCalloutView(self)
    }
    
    // MARK: - Public
    
    static func viewFromNib() -> VendorCalloutView {
        let view = UINib(nibName: "VendorCalloutView", bundle: NSBundle.mainBundle()).instantiateWithOwner(nil, options: nil).first as! VendorCalloutView
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    weak var delegate: VendorCalloutViewDelegate?
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.text = nil
        promotionNameLabel.text = nil
        usernameLabel.text = nil
        descriptionLabel.text = nil
        timeLeftLabel.text = nil
        
        imageView.layer.cornerRadius = imageView.bounds.width / 2.0
        
        redeemButton.layer.cornerRadius = 4.0
        myRedeemButton.layer.cornerRadius = 4.0
    }
}

protocol VendorCalloutViewDelegate: class {
    func didTapRedeemInVendorCalloutView(callout: VendorCalloutView)
    func didTapMyRedeemInVendorCalloutView(callout: VendorCalloutView)
    func didTapCloseInVendorCalloutView(callout: VendorCalloutView)
}