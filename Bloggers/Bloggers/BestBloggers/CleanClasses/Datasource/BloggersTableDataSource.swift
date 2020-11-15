//
//  BloggersTableDataSource.swift
//  Bloggers
//
//  Created by Mamta Sharma on 8/6/20.
//  Copyright © 2020 Mamta Sharma. All rights reserved.
//

import Foundation
import UIKit

let kBloggerCell = "BloggerCell"
class BloggersTableDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    var dataSource: [User] = [User]()
    var tableView: UITableView?
    weak var delegate: BloggersTableDataSource?
    init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView?.estimatedRowHeight = UITableView.automaticDimension
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.rowHeight = UITableView.automaticDimension
        let nib = UINib(nibName:kBloggerCell , bundle: nil)
        self.tableView?.register(nib, forCellReuseIdentifier:kBloggerCell)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:kBloggerCell,
                                                       for: indexPath) as? BloggerCell else {
                                                        return UITableViewCell()
        }
        cell.setUpCell(model: dataSource[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
