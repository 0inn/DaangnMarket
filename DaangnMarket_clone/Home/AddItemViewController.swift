//
//  AddItemViewController.swift
//  DaangnMarket_clone
//
//  Created by 김영인 on 2022/02/23.
//

import UIKit

protocol AddDelegate {
    func passText( _ data: [String])
}

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var imgTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var contentTF: UITextField!
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func done(_ sender: Any) {
        self.delegate?.passText([imgTF.text!, titleTF.text!, locationTF.text!,priceTF.text!, contentTF.text!])
        self.dismiss(animated: true, completion: nil)
    }
    
    var delegate: AddDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
