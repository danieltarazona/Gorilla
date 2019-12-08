//
//  Post.swift
//  Gorilla
//
//  Created by Daniel Tarazona on 12/7/19.
//  Copyright © 2019 Gorilla. All rights reserved.
//

import Foundation

class Post: Codable {

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case first_name = "first_name"
    case last_name = "last_name"
    case post_body = "post_body"
    case unix_timestamp = "unix_timestamp"
    case image = "image"
  }

  let id: Int
  let first_name: String
  let last_name: String
  let post_body: String
  let unix_timestamp: String
  let image: String

  required init(from decoder: Decoder) throws {

    let values = try decoder.container(keyedBy: CodingKeys.self)

    id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
    first_name = try values.decodeIfPresent(String.self, forKey: .first_name) ?? ""
    last_name = try values.decodeIfPresent(String.self, forKey: .last_name) ?? ""
    post_body = try values.decodeIfPresent(String.self, forKey: .post_body) ?? ""
    unix_timestamp = try values.decodeIfPresent(String.self, forKey: .unix_timestamp) ?? ""
    image = try values.decodeIfPresent(String.self, forKey: .image) ?? ""
  }

  public func encode(to encode: Encoder) throws {
    var container = encode.container(keyedBy: CodingKeys.self)

    try container.encode(id, forKey: .id)
    try container.encode(first_name, forKey: .first_name)
    try container.encode(last_name, forKey: .last_name)
    try container.encode(post_body, forKey: .post_body)
    try container.encode(unix_timestamp, forKey: .unix_timestamp)
    try container.encode(image, forKey: .image)
  }

}
