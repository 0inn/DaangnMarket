//
//  KeywordTableViewCell.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/22.
//

import UIKit

class KeywordTableViewCell: UITableViewCell {
    
    static let identifier = "KeywordTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let keywords = ["동네질문", "동네맛집", "동네소식", "취미생활", "분실/실종센터", "동네사건사고", "해주세요", "일상", "고양이", "강아지", "건강", "살림", "인테리어", "교육/학원", "동네사진전", "출산/육아", "기타"]
    
    override func awakeFromNib() {  // 여기서 초기화 작업 진행
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func registerCells() {
        collectionView.register(UINib(nibName: "KeywordCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: KeywordCollectionViewCell.identifier)
    }
    
}

extension KeywordTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCollectionViewCell.identifier, for: indexPath) as! KeywordCollectionViewCell
        cell.keywordBtn.setTitle(keywords[indexPath.row], for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cnt =  keywords[indexPath.row].count
        var width: Int
        if(cnt == 2) {
            width = 60
        }
        else {
            width = cnt * 20
        }
        return CGSize(width: width, height: 45)
   }
    
}
