//
//  MapViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/22.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLeftItem()
        setupRightItems()
    }
    
    private func setupLeftItem() {
        let mapLabel = UILabel()
        mapLabel.text = "내 근처"
        mapLabel.font = .systemFont(ofSize: 22, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: mapLabel)
    }
    
    private func makeBtn( _ name: String) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: name), for: .normal)
        btn.tintColor = .black
        return btn
    }
    
    private func setupRightItems() {
        let writeBtn = makeBtn("highlighter")
        let qrBtn = makeBtn("viewfinder")
        let bellBtn = makeBtn("bell")
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 15
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: bellBtn), spacer,  UIBarButtonItem(customView: qrBtn), spacer, UIBarButtonItem(customView: writeBtn)]
    }
    
}
