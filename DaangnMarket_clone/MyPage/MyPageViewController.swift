//
//  MyPageViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/21.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupRightItems()
    }

    private func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "나의 당근"
        titleLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    
    private func makeBtn( _ name: String) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: name), for: .normal)
        btn.tintColor = .black
        return btn
    }

    private func setupRightItems() {
        let settingBtn = makeBtn("gearshape")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingBtn)
    }
}
