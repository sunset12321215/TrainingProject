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

    func setContentForCell(data: (name: String, isChecked: Bool)) {
        pageMenuItemLabel.text = data.name
        pageMenuItemLabel.textColor = data.isChecked ? #colorLiteral(red: 0.4864677787, green: 0.3571970463, blue: 0.7660528421, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    class func sizeForCell(data: String, height: CGFloat) -> CGSize {
        guard let cell = UINib(nibName: "PageMenuCell", bundle: nil).instantiate(withOwner: self, options: nil).first as? PageMenuCell else { return CGSize.zero }
        cell.pageMenuItemLabel.text = data
        let cellWidth = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).width
        return CGSize(width: cellWidth, height: height)
    }
}


