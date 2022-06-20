//
//  NetworkService.swift
//  ImageSearch
//
//  Created by Cheremisin Andrey on 20.06.2022.
//

import Foundation

class NetworkService {
    
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        let parameters = self.prepareParameters(searchTerm: searchTerm)
        let url = self.url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeders()
        request.httpMethod = "get"
        let task = createDataTask(request: request, comletion: completion)
        task.resume()
    }
    private func prepareHeders() -> [String: String]? {
        var heders = [String:String]()
        heders["Authorization"] = "Client-ID u9sgTS9AYO6DUSDoXcz7E4iR7yi4UMP1ybcjlbZZIho"
        return heders
    }
    private func prepareParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
        
    }
    private func createDataTask(request: URLRequest, comletion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                comletion(data, error)
            }
        }
        
    }
}
