//
//  TableViewDataSource.swift
//  Test
//
//  Created by Fomagran on 2021/06/03.
//

import UIKit

class TableViewDataSource<CellType,Item>:NSObject,UITableViewDataSource where CellType:UITableViewCell {
        
    let identifier:String
    var items:[Item]
    let configure:(CellType,Item) -> ()
    
    init(identifier:String,items:[Item],configure:@escaping (CellType,Item) -> ()) {
        self.identifier = identifier
        self.items = items
        self.configure = configure
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as? CellType else { fatalError("\(self.identifier)를 확인해주세요!") }
        
        let item = self.items[indexPath.row]
        self.configure(cell,item)
        
        return cell
    }
    
    func updateDataSource(_ items:[Item]) {
        self.items = items
    }
}
