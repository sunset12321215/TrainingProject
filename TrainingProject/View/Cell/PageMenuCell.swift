//
//  PageMenuCell.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/26/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

final class PageMenuCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var pageMenuItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setContentForCell(data: String) {
        pageMenuItemLabel.text = data
    }
    
    class func sizeForCell(data: String, height: CGFloat) -> CGSize {
        guard let cell = UINib(nibName: "PageMenuCell", bundle: nil).instantiate(withOwner: self, options: nil).first as? PageMenuCell else { return CGSize.zero }
        cell.pageMenuItemLabel.text = data
        let cellWidth = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).width
        return CGSize(width: cellWidth, height: height)
    }
}


