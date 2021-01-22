//
//  ViewController.swift
//  Test
//
//  Created by Fomagran on 2021/01/22.
//


import UIKit

//이전 다음버튼 테스트
class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //이전버튼
        let 이전버튼 = UIButton.init(type: .custom)
        이전버튼.setTitle("이전", for: .normal)
        이전버튼.setTitleColor(.white, for: .normal)
        이전버튼.backgroundColor = .black
        이전버튼.layer.cornerRadius = 10
        이전버튼.addTarget(self, action:#selector(doneBtnfromKeyboardClicked), for:.touchUpInside)
        이전버튼.frame = CGRect.init(x: 0, y: 0, width:50, height: 30)
        
        //다음버튼
        let 다음버튼 = UIButton.init(type: .custom)
        다음버튼.setTitle("다음", for: .normal)
        다음버튼.setTitleColor(.black, for: .normal)
        다음버튼.backgroundColor = .white
        다음버튼.layer.cornerRadius = 10
        다음버튼.addTarget(self, action:#selector(doneBtnfromKeyboardClicked), for:.touchUpInside)
        다음버튼.frame = CGRect.init(x: 0, y: 0, width:50, height: 30)
        
        //UIBarButtonItem에 UIButton을 넣어줌
        let 바이전버튼 = UIBarButtonItem.init(customView: 이전버튼)
        let 바다음버튼 = UIBarButtonItem.init(customView: 다음버튼)
        
        //toolbar 아이템에 바이전버튼,바다음버튼을 넣어준다.
        toolBar.items = [바이전버튼,바다음버튼]
        
        textField.inputAccessoryView = toolBar
        
    }
    
    @objc func doneBtnfromKeyboardClicked (){
        self.view.endEditing(true)
    }
}
