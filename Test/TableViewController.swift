//
//  TableViewController.swift
//  Test
//
//  Created by Fomagran on 2021/06/03.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var dataSource:TableViewDataSource<NameTableViewCell,String>!
    
    var names:[String] = ["Foma","Gran","Young"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableViewDataSource()
    }
    
    func setTableViewDataSource() {
        self.dataSource = TableViewDataSource(identifier: "NameTableViewCell", items: names, configure: { cell, name in
            cell.name.text = name
        })
        self.tableView.dataSource = dataSource
    }
}
