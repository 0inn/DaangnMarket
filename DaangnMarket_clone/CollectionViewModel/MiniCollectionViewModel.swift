//
//  MiniCollectionViewModel.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/25.
//

import Foundation

class MiniCollectionViewModel {
    
    public var miniStorage: [Mini] = []
    
    init() {
        miniStorage = [
            Mini(img: "당근미니1.png", title: "GS 마감할인판매", content: "GS25와 GS 수퍼마켓의 마감할인상품이 당근마켓에 찾아갑니다"),
            Mini(img: "당근미니2.png", title: "청소연구소", content: "청소를 바꿉니다. 생활을 바꿉니다. 집청소는 청소연구소에 맡기세요"),
            Mini(img: "당근미니3.png", title: "포스텔러", content: "매일 400만명이 확인하고 힘을 얻는 행운족보! 당신의 기회입니다"),
            Mini(img: "당근미니1.png", title: "GS 마감할인판매", content: "GS25와 GS 수퍼마켓의 마감할인상품이 당근마켓에 찾아갑니다"),
            Mini(img: "당근미니1.png", title: "GS 마감할인판매", content: "GS25와 GS 수퍼마켓의 마감할인상품이 당근마켓에 찾아갑니다"),
            Mini(img: "당근미니1.png", title: "GS 마감할인판매", content: "GS25와 GS 수퍼마켓의 마감할인상품이 당근마켓에 찾아갑니다")
        ]
    }
    
    public var count: Int {
        return miniStorage.count
    }
    
    public func itemAt(_ row: Int) -> Mini {
        return self.miniStorage[row]
    }
    
}
