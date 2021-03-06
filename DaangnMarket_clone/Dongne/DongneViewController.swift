//
//  DongneViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/21.
//

import UIKit

class DongneViewController: UIViewController {

    @IBOutlet weak var writeBtn: UIButton!
    
    var collectionView: UICollectionView!
    
    var tableViewModel = DongneTableViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPullDownBtn()
        setupRightItems()
        setupTable()
        setupWriteBtn()
        setupRefresh()
    }
    
    private func setupPullDownBtn() {
        let pulldownBtn = UIButton()
        let mydongne = MyDongne(first: "여월동", second: "가츠동")
        pulldownBtn.setTitle(mydongne.first, for: .normal)
        pulldownBtn.setTitleColor(.black, for: .normal) // 색 지정 필수
        pulldownBtn.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        pulldownBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        pulldownBtn.semanticContentAttribute = .forceRightToLeft    // 화살표 오른쪽으로 옮기기
        pulldownBtn.tintColor = .black
        pulldownBtn.setPreferredSymbolConfiguration(.init(pointSize: 13, weight: .regular, scale: .default), forImageIn: .normal)
        pulldownBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        let first = UIAction(title: mydongne.first, handler: { _ in  pulldownBtn.setTitle(mydongne.first, for: .normal)})
        let second = UIAction(title: mydongne.second!, handler: { _ in pulldownBtn.setTitle(mydongne.second, for: .normal)})
        let another = UIAction(title: "내 동네 설정하기", handler: { _ in print("내 동네 설정하기")})
        pulldownBtn.menu = UIMenu(children: [first,second,another])
        pulldownBtn.showsMenuAsPrimaryAction = true // 이거 해줘야 클릭 시 바로 나타남
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: pulldownBtn)
    }

    private func makeBtn( _ name: String) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: name), for: .normal)
        btn.tintColor = .black
        return btn
    }

    private func setupRightItems() {
        let searchBtn = makeBtn("magnifyingglass")
        let menuBtn = makeBtn("list.star")
        let bellBtn = makeBtn("bell")
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 15
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: bellBtn), spacer,  UIBarButtonItem(customView: menuBtn), spacer, UIBarButtonItem(customView: searchBtn)]
    }
    
    private func setupTable() {
        tableView.backgroundColor = .systemGray6
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "DongneTableViewCell", bundle: nil), forCellReuseIdentifier: DongneTableViewCell.identifier)
        tableView.register(UINib(nibName: "KeywordTableViewCell", bundle: nil), forCellReuseIdentifier: KeywordTableViewCell.identifier)

        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupWriteBtn() {
        writeBtn.layer.shadowOpacity = 0.2
        writeBtn.layer.shadowRadius = 6
    }
    
    private func setupRefresh() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateUI(refresh:)), for: .valueChanged)
        refresh.tintColor = .systemOrange
        tableView.addSubview(refresh)
    }
    
    @objc func updateUI(refresh: UIRefreshControl) {
        refresh.endRefreshing() // 종료
        tableView.reloadData()  // 테이블 뷰 로드
    }

}

extension DongneViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {   // 첫번째 줄에 collectionView 넣기
            let cell = tableView.dequeueReusableCell(withIdentifier: KeywordTableViewCell.identifier, for: indexPath) as! KeywordTableViewCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DongneTableViewCell.identifier, for: indexPath) as! DongneTableViewCell
        
            let cellData = tableViewModel.itemAt(indexPath.row)
            cell.setupData(cellData)
            return cell
        }
    }
    
}
