//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Nguyen Van Son on 6/8/20.
//  Copyright © 2020 Nguyen Van Son. All rights reserved.
//

import Foundation

struct Response: Decodable {
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        //  Parse Item
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
