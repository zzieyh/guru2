//
//  NewsResponseModel.swift
//  KeywordNews
//
//  Created by 홍정민 on 2022/01/30.
//

import Foundation

struct NewsResponseModel: Decodable {
    var items: [News] = []
}

struct News: Decodable {
    let title: String
    let link: String
    let description: String
    let pubDate: String
}
