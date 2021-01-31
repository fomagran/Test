//
//  ViewController.swift
//  Test
//
//  Created by Fomagran on 2021/01/22.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //다음버튼
        let 다음버튼 = UIButton.init(type: .custom)
        다음버튼.setTitle("Done", for: .normal)
        다음버튼.setTitleColor(.black, for: .normal)
        다음버튼.backgroundColor = .white
        다음버튼.layer.cornerRadius = 10
        다음버튼.addTarget(self, action:#selector(doneBtnfromKeyboardClicked), for:.touchUpInside)
        다음버튼.frame = CGRect.init(x: 0, y: 0, width:50, height: 30)
        
        
        let 빈공간 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let 바다음버튼 = UIBarButtonItem.init(customView: 다음버튼)
        
        //toolbar 아이템에 바이전버튼,바다음버튼을 넣어준다.
        toolBar.items = [빈공간,바다음버튼]
        
        textField.inputAccessoryView = toolBar
        
    }
    
    @objc func doneBtnfromKeyboardClicked (){
        self.view.endEditing(true)
    }
}
