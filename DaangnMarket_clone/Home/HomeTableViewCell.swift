//
//  HomeTableViewCell.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/20.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier = "HomeTableViewCell"

    @IBOutlet weak var cellHomeImageView: UIImageView!
    @IBOutlet weak var cellHomeTitle: UILabel!
    @IBOutlet weak var cellHomeLocation: UILabel!
    @IBOutlet weak var cellHomePrice: UILabel!
    @IBOutlet weak var cellHomeTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupData(_ data: Home) {
        let imageStr = data.imageStr
        let name = data.title
        let location = data.location
        // 세자릿수마다 콤마 넣기
        let num = NumberFormatter()
        num.numberStyle = .decimal
        let money = Int(data.price)!
        let price = num.string(from: NSNumber(value: money))! + "원"
        let time = "· " + data.time
        
        cellHomeImageView.image = UIImage(named: imageStr + ".PNG")
        cellHomeImageView.layer.cornerRadius = 10
        cellHomeTitle.text = name
        cellHomeLocation.text = location
        cellHomePrice.text = price
        cellHomeTime.text = time
    }
    
}
