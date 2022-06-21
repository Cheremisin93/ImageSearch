//
//  SearchResult.swift
//  ImageSearch
//
//  Created by Cheremisin Andrey on 20.06.2022.
//

import Foundation

struct SearchResult: Decodable {
    
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKing.RawValue: String]
    
    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
        
    }
}
