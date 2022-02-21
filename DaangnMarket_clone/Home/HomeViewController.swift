//
//  HomeViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/20.
//

import UIKit

// 3 Controller 구성
class HomeViewController: UIViewController {
    
    @IBOutlet weak var plusBtn: UIButton!
    
    // 3-1 데이터를 컨트롤러로 가져온다
    var tableViewModel = HomeTableViewModel()
    
    // 3-2 UI를 컨트롤러로 가져온다
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupPlusBtn()
    }
    
    private func setupTableView() {
        // 3-3 delegate 지정
        tableView.delegate = self
        tableView.dataSource = self
        
        // 3-4 TableViewCell 생성
        
        // 3-5 TableViewCell 등록
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        tableView.rowHeight = 145
        // warning 뜨고 이상한 크기로 설정 -> 해결 필요
        //tableView.estimatedRowHeight = 145
        //tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    private func setupPlusBtn() {   // 그림자
        plusBtn.layer.shadowOpacity = 0.2   // 그림자 투명도
        plusBtn.layer.shadowRadius = 6  // 그림자 경계의 선명도
    }

}

// 3-6 프로토콜 채택
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 3-7 cell의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.count
    }

    // 3-8 어떻게 UI 구성할지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 3-9 Cell 생성
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        
        // 3-10 Cell에 데이터 전달
        let cellData = tableViewModel.itemAt(indexPath.row)
        cell.setupData(cellData)
        return cell
    }
    
}

