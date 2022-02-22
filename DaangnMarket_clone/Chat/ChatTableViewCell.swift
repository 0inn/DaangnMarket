//
//  ChatTableViewCell.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/21.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    static let identifier = "ChatTableViewCell"
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var img: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupData(_ data: Chat) {
        if (data.profile == "") {
            profileImg.image = UIImage(named: "채팅기본.png")
        } else {
        profileImg.image = UIImage(named: data.profile + ".png")
        }
        
        name.text = data.name
        location.text = data.location
        time.text = "· " + data.time
        content.text = data.content
        img.image = UIImage(named: data.imageStr + ".PNG")
        img.layer.cornerRadius = 5
    }
}
