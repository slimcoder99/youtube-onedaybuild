//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Nguyen Van Son on 6/4/20.
//  Copyright © 2020 Nguyen Van Son. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videoFetched(_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideo() {
        //Create a URL object
        let url = URL(string: Constants.API_URL)
        guard url != nil else {
            return
        }
        //Get a URLSession object
        let session = URLSession.shared
        //Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            //Check if there is any error
            if error != nil || data == nil {
                return
            }
            
            do {
                //Parsing data into video project
                let decoder = JSONDecoder()
                //  Format date for all date type in json response
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        // Call the "videoFetched" of the delegate
                        self.delegate?.videoFetched(response.items!)
                    }
                }
                
//                dump(response)
            } catch {
                
            }
        }
        //Kick off the task
        dataTask.resume()
    }
}
