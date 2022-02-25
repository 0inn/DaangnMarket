//
//  TabManStoreViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/24.
//

import UIKit
import Tabman
import Pageboy

class TabManStoreViewController: TabmanViewController {
    
    @IBOutlet weak var tabView: UIView!
    
    private var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabMan()
    }
    
    // MARK: 두번째 뷰 (이웃과 직접 만드는 동네 지도)
    private func setupTabMan() {
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "FirstStoreViewController") as! FirstStoreViewController
        
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondStoreViewController") as! SecondStoreViewController
        
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        
        self.dataSource = self

        let bar = TMBar.ButtonBar()
        // 배경 회색으로 나옴 -> 하얀색으로 바뀜
        bar.backgroundView.style = .blur(style: .light)
        // 간격 설정
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        // 버튼 글씨 커스텀
        bar.buttons.customize { (button) in
            button.tintColor = .systemGray4
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        }
        // 밑줄 쳐지는 부분
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .black
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
        
    }
}

extension TabManStoreViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "단골·추천")
        case 1:
            return TMBarItem(title: "먹거리")
//        case 2:
//            return TMBarItem(title: "생활")
//        case 3:
//            return TMBarItem(title: "건강")
//        case 4:
//            return TMBarItem(title: "미용")
//        case 5:
//            return TMBarItem(title: "교육")
//        case 6:
//            return TMBarItem(title: "전체")
        default:
            let title = "Page \(index)"
           return TMBarItem(title: title)
        }
    }

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
