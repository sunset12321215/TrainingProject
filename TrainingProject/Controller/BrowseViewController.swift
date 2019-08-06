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
    
    private let categoriesRepository = BrowseRepositoryImpl(api: APIService.share)
    private var categories = [Category]() {
        didSet {
            tableView.reloadData()
        }
    }
    private struct Constant {
        static let categoryCellHeight: CGFloat = 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarItem()
        setupTableView()
        fetchData()
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
    
    private func fetchData() {
        categoriesRepository.getCategories { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let categoryResponse):
                guard let categoryResults = categoryResponse?.categories else { return }
                self?.categories = categoryResults
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}

extension BrowseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CategoryCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setContentForCell(data: categories[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.categoryCellHeight
    }
}
