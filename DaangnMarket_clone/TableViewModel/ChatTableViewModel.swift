//
//  ChattingTableViewModel.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/21.
//

import Foundation

class ChatTableViewModel {
    
    private var chatStorage: [Chat] = []
    
    init() {
        chatStorage = [
            Chat(name: "당근이", profile: "채팅1", location: "", time: "2주전", content: "innie님의 첫 댓글을 기다렸어요 ! 축하드려요 ~ 다음에도 기대할게요 !", imageStr: ""),
            Chat(name: "가지", profile: "", location: "가츠동", time: "1달전", content: "가지님이 이모티콘을 보냈어요.", imageStr: "홈1"),
            Chat(name: "상추", profile: "", location: "우동", time: "4달전", content: "아 ㅠㅠ 네 감사합니다", imageStr: ""),
            Chat(name: "파", profile: "", location: "동동", time: "5달전", content: "파님이 사진을 보냈어요.", imageStr: "홈4"),
            Chat(name: "버섯", profile: "채팅2", location: "여월동", time: "5달전", content: "네 ~ 잘 쓰시길 바랄게요 ~", imageStr: ""),
            Chat(name: "오이", profile: "", location: "여기동", time: "6달전", content: "오이님이 이모티콘을 보냈어요.", imageStr: ""),
            Chat(name: "양파", profile: "", location: "저기동", time: "11달전", content: "네 !", imageStr: "홈2"),
            Chat(name: "브로콜리", profile: "", location: "모두동", time: "1년전", content: "좋은 하루 되세요 ~ !", imageStr: ""),
            Chat(name: "양배추", profile: "", location: "여기동", time: "6달전", content: "오이님이 이모티콘을 보냈어요.", imageStr: ""),
            Chat(name: "청경채", profile: "", location: "저기동", time: "11달전", content: "청경채님이 사진을 보냈어요.", imageStr: "홈5"),
            Chat(name: "팽이버섯", profile: "", location: "모두동", time: "1년전", content: "감사합니다 ~ !", imageStr: "")
        ]
    }
    
    public var count: Int {
        return chatStorage.count
    }
    
    public func itemAt(_ row: Int) -> Chat {
        return self.chatStorage[row]
    }
    
}
