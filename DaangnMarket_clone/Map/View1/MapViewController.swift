//
//  MapViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/22.
//

import UIKit
import Tabman
import Pageboy

class MapViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let maps = ["심부름", "일자리", "친구", "모닝", "부업", "월세방", "캠핑카", "과외", "월세", "용달차"]


    // tab bar library - TabMan 사용

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLeftItem()
        setupRightItems()
        setupCollectionView()
    }

    // MARK: 네비게이션 바 설정
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

    // MARK: 첫번째 뷰 - 2 : CollectionView
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HeaderCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: "MapCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MapCollectionViewCell.identifier)
    }

}

// MARK: 첫번째 뷰 - 2 : CollectionView
extension MapViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return maps.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionViewCell.identifier, for: indexPath) as! HeaderCollectionViewCell

            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.identifier, for: indexPath) as! MapCollectionViewCell
            cell.mapBtn.setTitle(maps[indexPath.row], for: .normal)
            return cell
        }
    }

    // 이 함수로 cell의 width와 height를 줘야 오류가 안남
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 10, height: 10)
    }
}
