import UIKit
import FomaViewableSound


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let foma = FomaViewableSound()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        foma.show(on: self.view, in: self)
        }
    
    }
}
