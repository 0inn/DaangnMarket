//
//  HomeTableViewModel.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/20.
//

import Foundation

// 2 데이터모델 생성
class HomeTableViewModel {
    // 2-1 저장소 생성
    private var homeStorage: [Home] = []
    
    // 2-2 DummyData <-> 네크워킹
    init() {
        homeStorage = [
             Home(imageStr: "홈1", title: "고려대 100주년 시계", location: "양천구 신정2동", price: "7,000원"),
             Home(imageStr: "홈2", title: "조말론 바디크림 피오니 새제품", location: "양천구 신정6동", price: "29,000원"),
             Home(imageStr: "홈3", title: "캐나다구스 매장판 카슨 블랙라벨 판매", location: "강서구 방화제1동", price: "600,000원"),
             Home(imageStr: "홈4", title: "소파냉장고들 싸게처분해😍", location: "부천시 원미구 중1동", price: "100,000원"),
             Home(imageStr: "홈5", title: "샤넬 스노우볼 vip 기프트", location: "부천시 원미구 상동", price: "79,000원"),
             Home(imageStr: "홈6", title: "스타벅스 시계 팔아요.", location: "소사구 송내동", price: "8,000원")
        ]
    }
    
    // 2-3 데이터의 개수 -> numberOfRowAtInSection
    public var count: Int {
        return homeStorage.count
    }
    
    // 2-4 해당 인덱스의 데이터 리턴 -> CellForRowAt
    public func itemAt(_ row: Int) -> Home {
        return self.homeStorage[row]
    }
    
}