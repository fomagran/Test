//
//  ViewControllerLifeCycle.swift
//  Test
//
//  Created by Fomagran on 2021/03/24.
//

import UIKit
import DatePicker

class ImageViewController: UIViewController {
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = DatePicker()
        datePicker.setup { (selected, date) in
            if selected {

            }
        }
        
        datePicker.show(in: self)
        

    }
    
}
