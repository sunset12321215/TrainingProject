//
//  BrowseViewController.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/25/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

final class BrowseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarItem()
    }
    
    private func setupTabbarItem() {
        self.title = "BROWSE"
        self.tabBarItem.image = UIImage(named: "Browse")
        self.tabBarItem.selectedImage = UIImage(named: "BrowseSlected")?.withRenderingMode(.alwaysOriginal)
    }

}
