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
        
        
        
        let apts = APT_INFO.components(separatedBy: "\n")
        
        for apt in apts {
            let split = apt.components(separatedBy: ",")
            if split.count > 5 {
            if split[5].contains("\"") {
                var bool = false
                var str = "\""
                for s in apt {
                    if bool == false {
                        if String(s) == "\"" {
                            bool = true
                        }
                    }else {
                        if String(s) == "\"" {
                            bool = false
                            break
                        }else {
                            str += String(s)
                        }
                    }
                }
                
                str.removeFirst()
                let replace = str.replacingOccurrences(of: ",", with: " ")
                let spReplace = apt.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "\(str)", with: replace)
                let replaceSplit = spReplace.components(separatedBy: ",")
                print("\(replaceSplit[4]),\(replaceSplit[5]),\(replaceSplit[7]),\(replaceSplit[8])")
            }else {
                print("\(split[4]),\(split[5]),\(split[7]),\(split[8])")
            }
            }
           
        }
        
        
    }
}
