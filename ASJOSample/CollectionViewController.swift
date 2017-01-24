//
//  CollectionViewController.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/24/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionViewController: UICollectionViewController {
    
    let reuseIdentifier = "collectionCell"
    
    
    var Songitems = [
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ],
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ],
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ],
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ],
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ],
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ],
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ],
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ],
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ],
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ],
        [
            "image": "https://s3.amazonaws.com/images.sheetmusicdirect.com/Product/smd_h_0000000000741981/large.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem"
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.Songitems.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CVCell
        
        
        let song = self.Songitems[indexPath.item] as [String : String]

        cell.trackNameLabel.text = song["song"]
        cell.artistNameLabel.text = song["artist"]
    
        let imageURLStr = song["image"]
        cell.imageView.sd_setImageWithURL(NSURL(string: imageURLStr!), placeholderImage:UIImage(named:"placeholder.png")!)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

}
