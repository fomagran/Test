//
//  NewViewController.swift
//  Test
//
//  Created by Fomagran on 2021/03/24.
//

import UIKit

class NewViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("새로운 뷰 로드중~")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("새로운 뷰 로드 되었어요~")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("새로운 뷰 이제 곧 보일거에요~")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("새로운 뷰 나타났어요~")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("새로운 뷰 이제 곧 사라질거에요~")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("새로운 뷰 사라졌어요~")
    }

}
