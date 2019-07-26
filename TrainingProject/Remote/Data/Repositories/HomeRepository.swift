//

import Foundation

protocol HomeRepository {
    func getNews(completion: @escaping (BaseResult<NewsResponse>) -> Void)
    func getPopular(completion: @escaping (BaseResult<PopularResponse>) -> Void)
}

final class HomeRepositoryImpl: HomeRepository {
    private var api: APIService!
    
    required init(api: APIService) {
        self.api = api
    }
    
    func getNews(completion: @escaping (BaseResult<NewsResponse>) -> Void) {
        let input = NewsRequest()
        api.request(input: input) { (object: NewsResponse?, error) in
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
    
    func getPopular(completion: @escaping (BaseResult<PopularResponse>) -> Void) {
        let input = PopularRequest()
        api.request(input: input) { (object: PopularResponse?, error) in
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
