//
//  PoupularCell.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/26/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

final class PoupularCell: UITableViewCell, NibReusable {
    
    @IBOutlet private weak var popularImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    func setContentForCell(data: Popular) {
        popularImageView.sd_setImage(with: URL(string: data.photo),
                                     placeholderImage: UIImage(named: "picture_not_available"))
        titleLabel.text = data.name
        descriptionLabel.text = data.descriptionRaw
        dateLabel.text = data.scheduleStartDate.toString() + " Số người tham gia:" + String(data.goingCount)
    }
}
