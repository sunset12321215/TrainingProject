//
//  NearMeViewController.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/25/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

final class NearMeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarItem()
    }
    
    private func setupTabbarItem() {
        self.title = "NEAR ME"
        self.tabBarItem.image = UIImage(named: "NearMe")
        self.tabBarItem.selectedImage = UIImage(named: "NearMeSlected")?.withRenderingMode(.alwaysOriginal)
    }
}
