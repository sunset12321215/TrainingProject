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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContentForCell() {
        titleLabel.text = "D1 -  Thứ 7 Truyền Nghề"
        descriptionLabel.text = "Phát triển ứng dụng android theo mô hình MVP sử dụng Dagger và RxAnroid"
        dateLabel.text = "26/7/2019 - 40 Người tham gia"
    }
}
