//
//  BloggersInteractor.swift
//  Bloggers
//
//  Created by Mamta Sharma on 8/6/20.
//  Copyright © 2020 Mamta Sharma. All rights reserved.
//

import Foundation
import UIKit
class BloggersInteractor {
    var worker = BloggersWorker()
    var presenter: BloggersPresenter?
    func fetchTopBloggers(){
        self.setUpDataSource([User]())
        self.presenter?.showLoader()
        //This delay is just to show the loader , as if data is from api
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.worker.getAllData { (users, posts, comments) in
                self.worker.calculationEngagingBlogger(users: users,
                                                       posts: posts,
                                                       comments: comments) { (users) in
                                                        self.setUpDataSource(users)
                                                        self.presenter?.hideLoader()
                }
            }
        }
    }
    func initialSetup(){
        if let vco = self.presenter?.viewcontroller {
            vco.bloggersDataSource = BloggersTableDataSource(tableView: vco.tableView)
            setUpDataSource([User]())
        }
    }
    func setUpDataSource(_ users:[User]) {
        if let vco = self.presenter?.viewcontroller {
            vco.bloggersDataSource?.dataSource = users
            self.presenter?.reloadTable()
        }
    }
}
