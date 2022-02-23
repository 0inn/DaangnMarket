//
//  MyPageViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/21.
//

import UIKit
import SnapKit

// tableView Header
// Section
class MyPageViewController: UIViewController {
    
    let tableViewModel = MyPageTableViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupRightItems()
        setupTableViewHeader()
        setupTable()
        setupTableViewFooter()
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
    
    // UIView(ImageView + UILabel + UIButton) + UIButton + [UIButton]
    private func setupTableViewHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 250))
        header.backgroundColor = .white
        
        // MARK: Profile
        let profile = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        header.addSubview(profile)
        let profileImg = UIImageView()
        profile.addSubview(profileImg)
        profileImg.image = UIImage(named: "profile.png")
        profileImg.snp.makeConstraints() {
            $0.leading.equalTo(profile).inset(15)
            $0.centerY.equalTo(profile)
            $0.width.equalTo(78)
            $0.height.equalTo(78)
        }
        let name = UILabel()
        name.text = "innie"
        name.font = .systemFont(ofSize: 17, weight: .bold)
        profile.addSubview(name)
        name.snp.makeConstraints()  {
            $0.leading.equalTo(profileImg.snp.trailing).offset(15)
            $0.centerY.equalTo(profile).multipliedBy(0.8)
        }
        let id = UILabel()
        id.text = "여월동 #20632697"
        id.font = .systemFont(ofSize: 14, weight: .light)
        id.textColor = .lightGray
        profile.addSubview(id)
        id.snp.makeConstraints()  {
            $0.leading.equalTo(profileImg.snp.trailing).offset(15)
            $0.top.equalTo(name.snp.bottom).offset(5)
        }
        let img = UIImageView()
        profile.addSubview(img)
        img.image = UIImage(systemName: "chevron.right")
        img.tintColor = .black
        img.snp.makeConstraints() {
            $0.trailing.equalTo(profile).inset(20)
            $0.centerY.equalTo(profile)
            $0.width.equalTo(12)
            $0.height.equalTo(17)
        }
        
        // MARK: Pay
        let pay = UIView()
//        let border = CAShapeLayer()
//        border.strokeColor = UIColor.systemOrange.cgColor
//        border.lineDashPattern = [4,4]
//        border.lineWidth = 10
//        border.path = UIBezierPath(rect: pay.bounds).cgPath
//        border.frame = pay.bounds
//        pay.layer.addSublayer(border)
        header.addSubview(pay)
        pay.snp.makeConstraints() {
            $0.top.equalTo(profile.snp.bottom).offset(0)
            $0.leading.equalTo(header).inset(20)
            $0.trailing.equalTo(header).inset(20)
            $0.height.equalTo(48)
        }
        
        pay.layer.cornerRadius = 5
        pay.layer.borderColor = UIColor.systemOrange.cgColor
        pay.layer.borderWidth = 1
        
        let payLabel = UILabel()
        payLabel.text = "중고거래는 이제 당근페이로 해보세요!"
        payLabel.textColor = .darkGray
        payLabel.font = .systemFont(ofSize: 13)
        pay.addSubview(payLabel)
        payLabel.snp.makeConstraints() {
            $0.trailing.equalTo(pay).inset(15)
            $0.centerY.equalTo(pay)
        }
        
        let payImg = UIImageView()
        payImg.image = UIImage(named: "pay.png")
        pay.addSubview(payImg)
        payImg.snp.makeConstraints() {
            $0.leading.equalTo(pay).inset(15)
            $0.centerY.equalTo(pay)
            $0.width.equalTo(60)
            $0.height.equalTo(34)
        }
        
        //MARK: Buttons
        let sellBtn = makeStackBtns("판매내역")
        let buyBtn = makeStackBtns("구매내역")
        let heartBtn = makeStackBtns("관심목록")
        
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 15
        
        stackView.addArrangedSubview(sellBtn)
        stackView.addArrangedSubview(buyBtn)
        stackView.addArrangedSubview(heartBtn)
        
        header.addSubview(stackView)
        stackView.snp.makeConstraints() {
            $0.top.equalTo(pay.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(header).inset(64)
        }
        
        tableView.tableHeaderView = header
    }
    
    private func makeStackBtns( _ name: String) -> UIButton {
        let btn = UIButton()
        let image = UIImageView()
        image.image = UIImage(named: name + ".png")
        btn.addSubview(image)
        image.snp.makeConstraints() {
            $0.center.equalTo(btn)
            $0.width.equalTo(60)
            $0.height.equalTo(60)
        }
        let label = UILabel()
        label.text = name
        label.font = .systemFont(ofSize: 13)
        btn.addSubview(label)
        label.snp.makeConstraints() {
            $0.centerX.equalTo(image)
            $0.top.equalTo(image.snp.bottom).offset(5)
        }
        return btn
    }
    
    private func setupTableViewFooter() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 10))
        footer.backgroundColor = .systemGray6
        tableView.tableFooterView = footer
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MypageTableViewCell", bundle: nil), forCellReuseIdentifier: MypageTableViewCell.identifier)
        tableView.rowHeight = 60
        tableView.backgroundColor = .systemGray6
    }
}

extension MyPageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableViewModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.countSection(section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0) { return 15 }
        else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MypageTableViewCell.identifier) as! MypageTableViewCell
        
        let cellData = tableViewModel.itemAt(indexPath.row, indexPath.section)
        cell.setData(cellData)
        return cell
    }
    
    
}
