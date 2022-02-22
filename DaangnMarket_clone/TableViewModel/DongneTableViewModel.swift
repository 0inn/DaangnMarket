//
//  DongneTableViewModel.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/21.
//

import Foundation

class DongneTableViewModel {
    
    private var dongneStorage: [Dongne] = []
    
    init() {
        dongneStorage = [
            Dongne(keyword: "동네질문", content: "부천쪽 머리 잘하는 곳 있으면 추천 좀 해주세요 !", name: "부천킬러", location: "성곡동", time: "15분 전"),
            Dongne(keyword: "건강", content: "고강동에 걷기 운동 동호회 같은 것이 있을까요? 열심히 운동하고 싶어서요 ~", name: "헬스왕", location: "고강동", time: "48분 전"),
            Dongne(keyword: "동네맛집", content: "양천구 간장게장 맛집이 있을까요? 얼마 전에 이사왔는데 맛있는 간장게장 먹고 싶습니다.", name: "간게밥", location: "신정2동", time: "1시간 전"),
            Dongne(keyword: "분실/실종센터", content: "까치산역 주변에서 에어팟프로 주우신 분 있으실까요? 그쯤에서 잃어버린 것 같은데 찾으신 분 꼭 연락주세요 ㅠㅠ", name: "너굴이", location: "신정6동", time: "2시간 전"),
            Dongne(keyword: "동네질문", content: "춘의 스타벅스 얼마 전 코로나 이슈로 문 닫았던데, 혹시 지금 다시 열었을까요? 거기가 공부가 제일 잘되는데 문닫아서 너무 슬펐어요 ㅠㅠ", name: "스벅단골", location: "춘의동", time: "2시간 전")
        ]
    }
    
    public var count: Int {
        return dongneStorage.count
    }
    
    public func itemAt(_ row: Int) -> Dongne {
        return self.dongneStorage[row]
    }
    
}
