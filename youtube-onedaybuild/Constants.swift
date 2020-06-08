//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Nguyen Van Son on 6/4/20.
//  Copyright © 2020 Nguyen Van Son. All rights reserved.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyBjXZHa9BWo8DtnFwcvNRgGxuFL5HnnaF0"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
