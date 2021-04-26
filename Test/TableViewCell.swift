//
//  TableViewCell.swift
//  Test
//
//  Created by Fomagran on 2021/02/25.
//

import UIKit

protocol TableViewCellDelegate:class {
    func updateTextViewHeight(_ cell:TableViewCell,_ textView:UITextView)
}

class TableViewCell: UITableViewCell {
    
    weak var delegate: TableViewCellDelegate?

    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setTextView()
        setEmptyView()
    }
    
    func setTextView() {
        textView.delegate = self
        textView.isScrollEnabled = false
        textView.sizeToFit()
    }
    
    func setEmptyView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapEmptyView))
             emptyView.addGestureRecognizer(tap)
    }
    
    @objc func tapEmptyView() {
        textView.becomeFirstResponder()
    }

}

extension TableViewCell:UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        if let delegate = delegate {
            delegate.updateTextViewHeight(self, textView)
        }
    }
}
