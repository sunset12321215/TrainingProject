//
//  HomeController.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/25/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

final class HomeController: UIViewController {
    
    @IBOutlet private weak var pageMenuCollectionView: UICollectionView!
    @IBOutlet private weak var pageItemCollectionView: UICollectionView!
    
    private struct Constant {
        static let pageMenuArray = ["News", "Popular"]
    }
    private let newsRepository = HomeRepositoryImpl(api: APIService.share)
    private let popularRepository = HomeRepositoryImpl(api: APIService.share)
    private var news: [News] = [News]()
    private var populars: [Popular] = [Popular]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupTabbarItem()
        setupCollectionViews()
    }
    
    private func setupCollectionViews() {
        pageMenuCollectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(cellType: PageMenuCell.self)
        }
        
        pageItemCollectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(cellType: PageItemCell.self)
        }
    }
    
    private func setupTabbarItem() {
        self.title = "HOME"
        self.tabBarItem.image = UIImage(named: "Home")
        self.tabBarItem.selectedImage = UIImage(named: "HomeSlected")?.withRenderingMode(.alwaysOriginal)
    }
    
    private func fetchData() {
        newsRepository.getNews { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let newsResponse):
                guard let newsResults = newsResponse?.news else { return }
                self?.news = newsResults
            case .failure(let error):
                print(error as Any)
            }
        }
        
        popularRepository.getPopular { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let popularResponse):
                guard let popularResults = popularResponse?.populars else { return }
                self?.populars = popularResults
                self?.pageItemCollectionView.reloadData()
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case pageMenuCollectionView:
            return Constant.pageMenuArray.count
        case pageItemCollectionView:
            return Constant.pageMenuArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == pageMenuCollectionView {
            let cell: PageMenuCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.pageMenuItemLabel.text = Constant.pageMenuArray[indexPath.row]
            return cell
        } else {
            let cell: PageItemCell = collectionView.dequeueReusableCell(for: indexPath)
            let item = indexPath.row % 2 == 0 ? 0 : 1
            cell.sectionOfCollection = item
            cell.news = news
            cell.populars = populars
            return cell
        }
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case pageMenuCollectionView:
            return PageMenuCell.sizeForCell(data: Constant.pageMenuArray[indexPath.row],
                                            height: pageMenuCollectionView.frame.height)
        case pageItemCollectionView:
            return CGSize(width: pageItemCollectionView.frame.width,
                          height: pageItemCollectionView.frame.height)
        default:
            return CGSize.zero
        }
    }
}
