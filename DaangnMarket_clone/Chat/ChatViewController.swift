//
//  ChatViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/21.
//

import UIKit

class ChatViewController: UIViewController {
    
    var TableViewModel = ChatTableViewModel()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupTable()
        setupRightItems()
        setupRefresh()
    }
    
    private func makeBtn( _ name: String) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: name), for: .normal)
        btn.tintColor = .black
        return btn
    }

    private func setupRightItems() {
        let qrBtn = makeBtn("viewfinder")
        let bellBtn = makeBtn("bell")
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 15
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: bellBtn), spacer,  UIBarButtonItem(customView: qrBtn)]
    }
    
    private func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "채팅"
        titleLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }

    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: ChatTableViewCell.identifier)
        
        tableView.rowHeight = 75
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

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TableViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as! ChatTableViewCell
        
        let cellData = TableViewModel.itemAt(indexPath.row)
        cell.setupData(cellData)
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TableViewModel.chatStorage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
