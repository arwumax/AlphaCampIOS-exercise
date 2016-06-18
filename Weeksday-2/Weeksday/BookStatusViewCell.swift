//
//  BookStatusViewCell.swift
//  Weeksday
//
//  Created by Edward Chiang on 3/14/16.
//  Copyright © 2016 Soleil Studio. All rights reserved.
//

import UIKit

class BookStatusViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var specialPriceLabel: UILabel!
    @IBOutlet weak var deliverStatusLabel: UILabel!
    @IBOutlet weak var contentDescriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
