//
//  BloggersPresenter.swift
//  Bloggers
//
//  Created by Mamta Sharma on 8/6/20.
//  Copyright © 2020 Mamta Sharma. All rights reserved.
//

import Foundation
import UIKit

class BloggersPresenter {
    weak var viewcontroller: ViewController?
    func showLoader() {
        if let vco =  self.viewcontroller {
            vco.activityIndicator.startAnimating()
        }
    }
    func hideLoader() {
        if let vco =  self.viewcontroller {
            vco.activityIndicator.stopAnimating()
        }
    }
    func reloadTable() {
        if let vco =  self.viewcontroller {
            vco.bloggersDataSource?.tableView?.reloadData()
        }
    }
}
