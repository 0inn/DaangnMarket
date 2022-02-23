//
//  HomeViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/20.
//

import UIKit

// 3 Controller 구성
class HomeViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var plusBtn: UIButton!
    
    // 3-1 데이터를 컨트롤러로 가져온다
    var tableViewModel = HomeTableViewModel()
    
    // 3-2 UI를 컨트롤러로 가져온다
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPullDownBtn()
        setupRightItems()
        setupTableView()
        setupPlusBtn()
        setupRefresh()
    }
    
    @IBAction func addItem(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddItemViewController") as! AddItemViewController
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        self.present(nvc, animated: true, completion: nil)
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
        let menuBtn = makeBtn("line.3.horizontal")
        let bellBtn = makeBtn("bell")
        // 공백 만들기
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 15
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: bellBtn), spacer,  UIBarButtonItem(customView: menuBtn), spacer, UIBarButtonItem(customView: searchBtn)]
    }
    
    private func setupTableView() {
        // 3-3 delegate 지정
        tableView.delegate = self
        tableView.dataSource = self
        
        // 3-4 TableViewCell 생성
        
        // 3-5 TableViewCell 등록
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        tableView.rowHeight = 145
        
    }
    
    private func setupPlusBtn() {   // 그림자
        plusBtn.layer.shadowOpacity = 0.2   // 그림자 투명도
        plusBtn.layer.shadowRadius = 6  // 그림자 경계의 선명도
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
    
    // MARK: Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableViewModel.homeStorage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
}

// delegate 패턴 사용
extension HomeViewController: AddDelegate {
    func passText(_ data: [String]) {
        print("here")
        tableViewModel.homeStorage.insert(Home(imageStr: data[0], title: data[1], location: data[2], price: data[3], time: "1초 전"), at: 0)
        
        // MARK: Create
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
        tableView.endUpdates()
    }
}

