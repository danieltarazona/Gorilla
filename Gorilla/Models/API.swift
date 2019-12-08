//
//  API.swift
//  Gorilla
//
//  Created by Daniel Tarazona on 12/7/19.
//  Copyright © 2019 Gorilla. All rights reserved.
//

import Foundation

class API {

  let URL: String

  init(URL: String) {
    self.URL = URL
  }

  func getPage(completion: (@escaping ([Post]) -> Void )) -> Void {

    let request = NSMutableURLRequest(
      url: NSURL(string: "https://gl-endpoint.herokuapp.com/feed")! as URL,
      cachePolicy: .useProtocolCachePolicy,
      timeoutInterval: 10.0
    )
    request.httpMethod = "GET"

    let session = URLSession.shared
    let dataTask = session.dataTask(
      with: request as URLRequest,
      completionHandler: { (data, response, error) -> Void in
        if error != nil {
          print("Error: \(String(describing: error))")
        } else {

          if data != nil {

            let decoder = JSONDecoder()
            let posts = try! decoder.decode([Post].self, from: data!)

            completion(posts)
          }
        }
    })

    dataTask.resume()
  }
}

