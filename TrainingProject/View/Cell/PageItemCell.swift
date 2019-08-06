//
//  PageItemCell.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/26/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

final class PageItemCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var sectionOfCollection = 0
    private struct Constant {
        static let newsCellHeight = 380 * Screen.ratioHeight
        static let popularCellHeight = 240 * Screen.ratioHeight
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(cellType: PoupularCell.self)
            $0.register(cellType: NewsCell.self)
        }
    }
}

extension PageItemCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sectionOfCollection {
        case 0:
            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setContentForCell()
            return cell
        case 1:
            let cell: PoupularCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setContentForCell()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sectionOfCollection {
        case 0:
            return Constant.newsCellHeight
        case 1:
            return Constant.popularCellHeight
        default:
            return 0
        }
    }
}

