//
//  KeywordCollectionViewCell.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/22.
//

import UIKit

class KeywordCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "KeywordCollectionViewCell"
    
    @IBOutlet weak var keywordBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBtn()
    }
    
    private func setupBtn() {
        keywordBtn.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        keywordBtn.backgroundColor = .white
        keywordBtn.layer.cornerRadius = 3
        keywordBtn.layer.borderWidth = 1.5
        keywordBtn.layer.borderColor = UIColor.systemGray5.cgColor
    }

}
