//
//  DongneViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/21.
//

import UIKit

class DongneViewController: UIViewController {

    @IBOutlet weak var writeBtn: UIButton!
    
    var tableViewModel = DongneTableViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupWriteBtn()
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "DongneTableViewCell", bundle: nil), forCellReuseIdentifier: DongneTableViewCell.identifier)

        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupWriteBtn() {
        writeBtn.layer.shadowOpacity = 0.2
        writeBtn.layer.shadowRadius = 6
    }

}

extension DongneViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DongneTableViewCell.identifier, for: indexPath) as! DongneTableViewCell
        
        let cellData = tableViewModel.itemAt(indexPath.row)
        cell.setupData(cellData)
        return cell
    }
    
    
}
