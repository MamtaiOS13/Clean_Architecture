//
//  parseData.swift
//  Bloggers
//
//  Created by Mamta Sharma on 8/5/20.
//  Copyright © 2020 Mamta Sharma. All rights reserved.
//

import Foundation

enum Resource: String {
    case users
    case posts
    case comments
    func data(completionBlock : @escaping (([Any]) -> Void)){
        switch self {
        case .users:  Utility.shared.data(forResponse: User.self,
                                          with: Resource.users.rawValue,
                                          completionBlock: { (users) in
                                            completionBlock(users)
        }) { (error) in
            completionBlock([])
            }
        case .posts:  Utility.shared.data(forResponse: Post.self,
                                          with: Resource.posts.rawValue,
                                          completionBlock: { (posts) in
                                            completionBlock(posts)
        }) { (error) in
            completionBlock([])
            }
        case .comments:  Utility.shared.data(forResponse: Comment.self,
                                             with:  Resource.comments.rawValue,
                                             completionBlock: { (comments) in
                                                completionBlock(comments)
        }) { (error) in
            completionBlock([])
            }
        }
    }
}

class Utility {
    static let shared = Utility()
    private init() {
    }
    func data<T:Decodable>(forResponse type: T.Type,
                           with name: String,
                           completionBlock : @escaping (([T]) -> Void),
                           errorBlock : @escaping ((String) -> Void)) {
        if let path = Bundle.main.path(forResource: name,
                                       ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path),
                                        options: Data.ReadingOptions.mappedIfSafe)
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode([T].self,
                                                      from: jsonData)
                    completionBlock(response)
                } catch let error  {
                    errorBlock(error.localizedDescription)
                }
            } catch let error as NSError {
                errorBlock(error.localizedDescription)
            }
        } else {
            errorBlock("Invalid filename/path.")
        }
    }
    
}


