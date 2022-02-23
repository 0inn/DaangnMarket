//
//  MypageTableViewCell.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/22.
//

import UIKit

class MypageTableViewCell: UITableViewCell {
    static let identifier = "MypageTableViewCell"

    @IBOutlet weak var mypageImg: UIImageView!
    @IBOutlet weak var mypageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
    }
    
    public func setData( _ data: MyPage) {
        mypageImg.image = UIImage(systemName: data.imageStr)
        mypageImg.tintColor = .black
        mypageLabel.text = data.title
        mypageLabel.font = .systemFont(ofSize: 15)
    }
}
