//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Nguyen Van Son on 6/26/20.
//  Copyright © 2020 Nguyen Van Son. All rights reserved.
//

import Foundation

class CacheManager {
    static var  cache: [String: Data] = [String: Data]()
    
    static func setCacheVideo(_ url: String, _ data: Data?) {
        cache[url] = data
    }
    
    static func getCacheVideo(_ url: String) -> Data? {
        return cache[url]
    }
}
