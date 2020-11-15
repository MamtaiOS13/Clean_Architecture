//
//  Models.swift
//  Bloggers
//
//  Created by Mamta Sharma on 8/6/20.
//  Copyright © 2020 Mamta Sharma. All rights reserved.
//

import Foundation

class User:Codable {
    let id : Int
    let name: String?
    var averageComments:Float = 0
    private enum CodingKeys: String, CodingKey{
        case id
        case name
    }
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}

class Post:Codable {
    let id : Int
    let userId : Int
    private enum CodingKeys: String, CodingKey{
        case id
        case userId
    }
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        userId = try (container.decodeIfPresent(Int.self, forKey: .userId) ?? 0)
    }
}

class Comment:Codable {
    let id : Int
    let postId : Int
    private enum CodingKeys: String, CodingKey{
        case id
        case postId
    }
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        postId = try (container.decodeIfPresent(Int.self, forKey: .postId) ?? 0)
    }
}
