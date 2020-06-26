//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Nguyen Van Son on 6/20/20.
//  Copyright © 2020 Nguyen Van Son. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setVideo(_ v: Video) {
        self.video = v

        // setup title
        titleLabel.text = self.video?.title
        
        // setup date
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: video!.published)
        
        // download thumbnail
        guard video!.thumbnail != nil else {
            return
        }
        
        // Check if thumbnail video has been downloaded
        if let cachedData = CacheManager.getCacheVideo(self.video!.thumbnail) {
            let image = UIImage(data: CacheManager.getCacheVideo(self.video!.thumbnail)!)
            self.thumbnailImageView.image = image
            return
        }
        
        let url = URL(string: video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil{
                // Check if
                CacheManager.setCacheVideo(url!.absoluteString, data)
                if url?.absoluteString != self.video?.thumbnail {
                    return
                }
                
                let image = UIImage(data: data!)
                
                // Set ui on main thread
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                    self.thumbnailImageView.contentMode = .scaleAspectFill
                }
            }
        } // Resume dataTask
        dataTask.resume()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
