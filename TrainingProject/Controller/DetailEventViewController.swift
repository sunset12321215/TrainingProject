//
//  DetailEventViewController.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/30/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit
import SDWebImage

final class DetailEventViewController: UIViewController {
    
    var popular: Popular?
    
    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }
    
    private func setupView() {
        detailImageView.sd_setImage(with: URL(string: popular?.photo ?? ""),
                                    placeholderImage: UIImage(named: "picture_not_available"))
        titleLabel.text = popular?.name
        descriptionLabel.text = popular?.descriptionRaw
        dateLabel.text = popular?.scheduleStartDate.toString() ?? "" + " Số người tham gia: " + String(popular?.goingCount ?? 0)
    }
    
    @IBAction func backToPrevous(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
