//
//  ViewController.swift
//  Bloggers
//
//  Created by Mamta Sharma on 8/6/20.
//  Copyright © 2020 Mamta Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var interactor: BloggersInteractor?
    var bloggersDataSource: BloggersTableDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
    }
    func setupComponents() {
        let presenter = BloggersPresenter()
        presenter.viewcontroller = self
        interactor = BloggersInteractor()
        interactor?.presenter = presenter
        interactor?.initialSetup()
    }
    @IBAction func checkData(_ sender: Any) {
        interactor?.fetchTopBloggers()
    }
}

