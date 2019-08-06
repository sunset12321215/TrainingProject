//
//  NewsCell.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/26/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

final class NewsCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setContentForCell()
    }
    
    func setContentForCell() {
        titleLabel.text = "#News#TruyenNghe"
        descriptionLabel.text = "description"
    }
}
