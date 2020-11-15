//
//  BloggerCell.swift
//  Bloggers
//
//  Created by Mamta Sharma on 8/6/20.
//  Copyright © 2020 Mamta Sharma. All rights reserved.
//

import UIKit

class BloggerCell: UITableViewCell {
    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var score: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setUpCell(model: User) {
        name?.text = model.name ?? ""
        id?.text = " - \(model.id)"
        score?.text = ", Score: \(model.averageComments)"
    }
    
}
