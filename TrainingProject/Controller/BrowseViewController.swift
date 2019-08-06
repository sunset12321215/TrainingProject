//
//  BrowseViewController.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/25/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

final class BrowseViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarItem()
        setupTableView()
    }
    
    private func setupTabbarItem() {
        self.title = "BROWSE"
        self.tabBarItem.image = UIImage(named: "Browse")
        self.tabBarItem.selectedImage = UIImage(named: "BrowseSlected")?.withRenderingMode(.alwaysOriginal)
    }
    
    private func setupTableView() {
        tableView.do {
            $0.register(cellType: CategoryCell.self)
            $0.dataSource = self
            $0.delegate = self
        }
    }
}

extension BrowseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CategoryCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setContentForCell(data: "Đây là Cell thứ \(indexPath.row)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
