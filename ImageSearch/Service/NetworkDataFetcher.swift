//
//  NetworkDataFetcher.swift
//  ImageSearch
//
//  Created by Cheremisin Andrey on 20.06.2022.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    func fetchImage(searchTerm: String, completion: @escaping (SearchResult?)->()) {
        networkService.request(searchTerm: searchTerm) { data, error in
            if let error = error {
                print(error)
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: SearchResult.self, from: data)
            completion(decode)
            
        }
    }
    func fetchImageRandom(completion: @escaping ([UnsplashPhoto]?)->()) {
        networkService.requestRandom { data, error in
            if let error = error {
                print(error)
                completion(nil)
            }
            let decode = self.decodeJSON(type: [UnsplashPhoto].self, from: data)
            completion(decode)
            
        }
    }
    
    func decodeJSON<T: Decodable> ( type: T.Type, from: Data?)-> T? {
        
        let decoder = JSONDecoder()
        guard let data = from else {
            return nil
        }
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch {
            print("Don't parse JSON: \(error)")
            return nil
        }
    }
}
