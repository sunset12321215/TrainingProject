//
//  BrowseRepository.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/31/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import Foundation

protocol BrowseRepository {
    func getCategories(completion: @escaping (BaseResult<CategoriesResponse>) -> Void)
}

final class BrowseRepositoryImpl: BrowseRepository {

    private var api: APIService!
    
    required init(api: APIService) {
        self.api = api
    }
    
    func getCategories(completion: @escaping (BaseResult<CategoriesResponse>) -> Void) {
        let input = CategoryRequest()
        api.request(input: input) { (object: CategoriesResponse?, error) in
            guard let object = object else {
                guard let error = error else {
                    completion(.failure(error: nil))
                    return
                }
                completion(.failure(error: error))
                return
            }
            completion(.success(object))
        }
    }
}
