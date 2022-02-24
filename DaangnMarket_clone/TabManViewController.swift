//
//  MapViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/22.
//

import UIKit
import Tabman
import Pageboy

class TabManViewController: TabmanViewController {
    
    @IBOutlet weak var tabView: UIView!
    
    // tab bar library - TabMan 사용
    private var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabMan()
    }
    
    // MARK: 두번째 뷰 (이웃과 직접 만드는 동네 지도)
    private func setupTabMan() {
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "SecondFoodViewController") as! SecondFoodViewController
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondFoodViewController") as! SecondFoodViewController
        
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        
        self.dataSource = self
        

        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        bar.buttons.customize { (button) in
            button.tintColor = .systemGray4
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
        }
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .black
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
        
    }
}


// MARK: 두번째 뷰 (이웃과 직접 만드는 동네 지도)
extension testViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "동네 맛집")
        case 1:
            return TMBarItem(title: "겨울간식")
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
