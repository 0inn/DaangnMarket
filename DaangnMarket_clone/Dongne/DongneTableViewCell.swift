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
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupData(_ data: Dongne) {
        keywordBtn.setTitle(data.keyword, for: .normal)
        keywordBtn.titleLabel?.font = .systemFont(ofSize: 10)
        keywordBtn.layer.cornerRadius = 3
        keywordBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        switch data.keyword {
        case "동네질문":
            content.text = "Q. " + data.content
        case "분실/실종센터":
            content.text = "찾아요 " + data.content
        default:
            content.text = data.content
        }
        name.text = data.name
        location.text = data.location
        time.text = data.time
    }
}
