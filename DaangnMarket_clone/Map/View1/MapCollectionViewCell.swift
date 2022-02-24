//
//  MapCollectionViewCell.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/24.
//

import UIKit

class MapCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MapCollectionViewCell"

    @IBOutlet weak var mapBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBtn()
    }
    
    private func setupBtn(){
        mapBtn.backgroundColor = .white
        mapBtn.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        mapBtn.layer.borderWidth = 1
        mapBtn.layer.borderColor = UIColor.systemGray4.cgColor
        mapBtn.layer.cornerRadius = 12
        mapBtn.layer.masksToBounds = true
        mapBtn.contentEdgeInsets = .init(top: 5, left: 10, bottom: 5, right: 10)
    }

}
