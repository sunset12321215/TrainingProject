//
//  CategoryCell.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/31/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

final class CategoryCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContentForCell(data: String) {
        categoryLabel.text = data
    }
}
