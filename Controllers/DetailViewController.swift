//
//  DetailViewController.swift
//  youtube-onedaybuild
//
//  Created by Nguyen Van Son on 6/27/20.
//  Copyright © 2020 Nguyen Van Son. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        descriptionTextView.text = ""
        
        // Check if there is a video
        guard video != nil else {
            return
        }
        
        // Create embedURLString
        let urlEmbedStringVideo = Constants.YT_EMBED_LINK_VIDEO + video!.videoId
        let urlRequest = URLRequest(url: URL(string: urlEmbedStringVideo)!)
        
        // Load it into webview
        webView.load(urlRequest)
        
        // Set Title
        titleLabel.text = video!.title
        
        // Set Date
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: video!.published)
        
        // Set Desciption
        descriptionTextView.text = video!.description
    }
}
