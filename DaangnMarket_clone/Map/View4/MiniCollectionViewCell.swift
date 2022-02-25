//
//  MiniCollectionViewCell.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/25.
//

import UIKit

class MiniCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MiniCollectionViewCell"
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.05
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 3, height: 10)
    }
    
    public func setData( _ data: Mini) {
        img.image = UIImage(named: data.img)
        title.text = data.title
        content.text = data.content
    }

}
