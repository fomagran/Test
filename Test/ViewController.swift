import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    private var dataSource:TableViewDataSource<NameTableViewCell,String>!
    
    var names:[String] = ["Foma","Gran","Young"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = TableViewDataSource(identifier: "NameTableViewCell", items: names, configure: { cell, item in
            
            cell.name.text
        
        })

    }
}
