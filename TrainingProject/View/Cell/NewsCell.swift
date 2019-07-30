//
//  NewsCell.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/26/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit
import SDWebImage

final class NewsCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
    }
    
    func setContentForCell(data: News) {
        newsImageView.sd_setImage(with: URL(string: data.thumb_img),
                                  placeholderImage: UIImage(named: "picture_not_available"))
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
}
