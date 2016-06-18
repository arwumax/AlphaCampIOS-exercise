//
//  PoetTableViewCell.swift
//  唐詩三百首
//
//  Created by WuKwok Ho on 14/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class PoetTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameOfPoet: UILabel!
    @IBOutlet weak var dynasty: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var poetImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
