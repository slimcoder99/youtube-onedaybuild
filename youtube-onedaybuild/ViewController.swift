//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Nguyen Van Son on 5/31/20.
//  Copyright © 2020 Nguyen Van Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideo()
    }


}

