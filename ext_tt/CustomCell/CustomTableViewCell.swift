//
//  CustomTableViewCell.swift
//  ext_tt
//
//  Created by Олександр Олійник on 01.09.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieYearLabel: UILabel!
    
    func setup(title: String, year: Int) {
        movieTitleLabel.text = title
        movieYearLabel.text = "\(year)"
    }
}
