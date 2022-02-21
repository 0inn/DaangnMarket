//
//  DongneTableViewCell.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/21.
//

import UIKit

class DongneTableViewCell: UITableViewCell {
    static let identifier = "DongneTableViewCell"
    
    @IBOutlet weak var keywordBtn: UIButton!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func setupData(_ data: Dongne) {
        keywordBtn.titleLabel?.text = data.keyword
        switch data.keyword {
        case "동네질문":
            startLabel.text = "Q."
        case "분실/실종센터":
            startLabel.text = "찾아요"
        default:
            startLabel.text = ""
        }
        content.text = data.content
        name.text = data.name
        location.text = data.location
    }
}
