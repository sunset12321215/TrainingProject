//

import Foundation

protocol NewsRepository {
    func getNews(completion: @escaping (BaseResult<NewsResponse>) -> Void)
}

final class NewsRepositoryImpl: NewsRepository {
    
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
}
