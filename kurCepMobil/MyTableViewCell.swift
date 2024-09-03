//
//  MyTableViewCell.swift
//  kurCepMobil
//
//  Created by Apple Atölyesi on 28.08.2024.
//

import Foundation
import UIKit

class MyTableViewCell:UITableViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!

    @IBOutlet weak var currencyIcon: UIImageView!
    
    @IBOutlet weak var changeRateLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    
    
    @IBOutlet weak var iconLabel: UILabel!
    override func layoutSubviews() {
        super.layoutSubviews()
        currencyIcon?.image = UIImage(named: "circle")
        currencyIcon.frame = CGRect(x: 10, y: 0, width: 45, height: 45)
    }
}
