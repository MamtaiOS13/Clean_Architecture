//
//  BloggersWorker.swift
//  Bloggers
//
//  Created by Mamta Sharma on 8/6/20.
//  Copyright © 2020 Mamta Sharma. All rights reserved.
//

import Foundation
import UIKit
class BloggersWorker {
    func getAllData(completionBlock : @escaping (([User], [Post], [Comment]) -> Void)){
        //Resource Enum as mentioned to fetch the data
        Resource.users.data { (users) in
            Resource.posts.data { (posts) in
                Resource.comments.data { (comments) in
                    if let users = users as? [User],
                        let posts = posts as? [Post],
                        let comments = comments as? [Comment] {
                        completionBlock(users,posts,comments)
                    }
                    
                }
            }
        }
    }
    func calculationEngagingBlogger(users:[User],
                         posts:[Post],
                         comments:[Comment],
                         completionBlock : @escaping (([User]) -> Void)){
        var topBloggers = [User]()
        for user in users {
            // For each user check total number of posts
            let allPostArray = posts.filter() { $0.userId == user.id }
            
            // For all post of a particulat user
            // Fetch the total of all the comments in all the posts
            var allPostsCommentCount = 0
            for post in allPostArray {
                let allCommets = comments.filter() { $0.postId == post.id }
                allPostsCommentCount += allCommets.count
            }
            // Calculated the average number of comments per user
            var average:Float = 0
            if allPostArray.count > 0 {
                // Mertics is Total no of comments in all the post / Number of total post
                average = Float(allPostsCommentCount) / Float (allPostArray.count)
            }
            // set the average comments in the users property
            user.averageComments = average
        }
        
        // Sort the users based on average comments
        let sortedUsers = users.sorted {
            $0.averageComments > $1.averageComments
        }
        //  Fetch the 3 most engaging bloggers, sort order, and output the result.
        topBloggers = Array(sortedUsers.prefix(3))
        completionBlock(topBloggers)
    }
}
