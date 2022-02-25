//
//  Home.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/20.
//

import Foundation

// 1 원하는 데이터 모델 생성
struct Home {
    var imageStr: String
    var title: String
    var location: String
    var price: String
    var time: String
}

struct MyDongne {
    var first: String
    var second: String?
}

struct Dongne {
    var keyword: String
    var content: String
    var name: String
    var location: String
    var time: String
}

struct Chat {
    var name: String
    var profile: String
    var location: String
    var time: String
    var content: String
    var imageStr: String
}

struct MyPage {
    var imageStr: String
    var title: String
}

struct Mini {
    var img: String
    var title: String
    var content: String
}
