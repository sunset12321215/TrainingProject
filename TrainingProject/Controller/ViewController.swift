//
//  ViewController.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/25/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private let newsRepository = NewsRepositoryImpl(api: APIService.share)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        newsRepository.getNews { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let newsResponse):
                guard let results = newsResponse?.news else { return }
                print(results)
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}
