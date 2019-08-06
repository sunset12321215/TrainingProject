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
    var news: [News] = [News]() {
        didSet {
            tableView.reloadData()
        }
    }
    var populars: [Popular] = [Popular]() {
        didSet {
            tableView.reloadData()
        }
    }
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
            $0.estimatedRowHeight = 200
            $0.rowHeight = UITableView.automaticDimension
        }
    }
}

extension PageItemCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        switch sectionOfCollection {
        case 0:
            return news.count
        case 1:
            return populars.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sectionOfCollection {
        case 0:
            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setContentForCell(data: news[indexPath.row])
            return cell
        case 1:
            let cell: PoupularCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setContentForCell(data: populars[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
}

