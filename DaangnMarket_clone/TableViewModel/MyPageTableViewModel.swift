//
//  MyPageTableViewModel.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/21.
//

import Foundation

class MyPageTableViewModel {
    
    private var mypageStorage: [[MyPage]] = [[]]
    
    init() {
        mypageStorage = [
            [
                MyPage(imageStr: "location.north.circle", title: "내 동네 설정"),
                MyPage(imageStr: "circle", title: "동네 인증하기"),
                MyPage(imageStr: "tag", title: "키워드 알림"),
                MyPage(imageStr: "slider.horizontal.3", title: "관심 카테고리 설정")
                ],
            [
                MyPage(imageStr: "rectangle.grid.2x2", title: "모아보기"),
                MyPage(imageStr: "book.closed", title: "당근 가계부"),
                MyPage(imageStr: "ticket", title: "받은 쿠폰함"),
                MyPage(imageStr: "cart", title: "내 단골 가게")
                ],
            [
                MyPage(imageStr: "newspaper", title: "동네생활 글/댓글"),
                MyPage(imageStr: "message", title: "동네 가게 후기")
                ],
            [
                MyPage(imageStr: "cart", title: "비즈프로필 만들기"),
                MyPage(imageStr: "book.closed", title: "동네홍보 글"),
                MyPage(imageStr: "speaker", title: "지역광고")
                ],
            [
                MyPage(imageStr: "envelope", title: "친구초대"),
                MyPage(imageStr: "point.3.connected.trianglepath.dotted", title: "당근마켓 공유"),
                MyPage(imageStr: "mic", title: "공지사항"),
                MyPage(imageStr: "headphones", title: "자주 묻는 질문"),
                MyPage(imageStr: "gearshape", title: "앱 설정")
                ]
            ]
                         
    }
    
    public func countSection( _ section: Int) -> Int {
        return mypageStorage[section].count
    }
    
    public var count: Int {
        return mypageStorage.count
    }
    
    public func itemAt( _ row: Int, _  section: Int) -> MyPage {
        return mypageStorage[section][row]
    }
    
}
