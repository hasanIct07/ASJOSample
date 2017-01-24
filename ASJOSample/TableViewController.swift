//
//  TableViewController.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/24/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import UIKit
import AlamofireImage

class TableViewController: UITableViewController {
    
    let reuseIdentifier = "tableCell"
    
    var Songitems = [
        [
            "image": "https://s-media-cache-ak0.pinimg.com/236x/01/0d/ca/010dcac847e4abe5431302666bfbf3a8.jpg",
            "song": "Love the way you lie.",
            "artist": "Eminem Ft Rihanna"
        ],
        [
            "image": "http://4.bp.blogspot.com/_mupIVJbjvuU/TDDbhr2XopI/AAAAAAAAEcQ/0zBzrZGx13k/s1600/Made+by+Panda.png",
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
            "artist": "E F R"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func dismissFullscreenImage(sender: UITapGestureRecognizer) {
        
        self.tableView.scrollEnabled = true
        
        sender.view?.removeFromSuperview()
    }
    
    //MARK:- UITableViewDelegate
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.Songitems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(self.reuseIdentifier, forIndexPath: indexPath) as! TVCell
        
        let song = self.Songitems[indexPath.row] as [String : String]
        let imageURLStr = song["image"]! as String
        
        cell.songImageView.af_setImageWithURL(NSURL(string: imageURLStr)!, placeholderImage: UIImage(named: "placeholder"))
        
        cell.trackNameLabel.text = song["song"]
        cell.artistNameLabel.text = song["artist"]
        cell.delegate = self
        
        return cell
    }
    
    
    //MARK:- UITableViewDataSource
}

extension TableViewController: TVCellDelegate {
    
    func didTapImageView(imageView: UIImageView) {

        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = self.view.bounds
        newImageView.backgroundColor = .blackColor()
        newImageView.contentMode = .ScaleAspectFit
        newImageView.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(TableViewController.dismissFullscreenImage(_:)))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        
        self.tableView.scrollEnabled = false
        
    }
}


