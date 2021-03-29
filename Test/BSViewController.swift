//
//  BSViewController.swift
//  Test
//
//  Created by Fomagran on 2021/03/29.
//

import UIKit
import BSImagePicker

class BSViewController: UIViewController {

    
    let imagePicker = ImagePickerController()
    
    @IBAction func button(_ sender: Any) {
        
        imagePicker.settings.selection.max = 10
        imagePicker.settings.selection.unselectOnReachingMax = true
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image, .video]
        imagePicker.albumButton.tintColor = UIColor.green
        imagePicker.cancelButton.tintColor = UIColor.red
        imagePicker.doneButton.tintColor = UIColor.purple
        imagePicker.navigationBar.barTintColor = .black
        imagePicker.settings.theme.backgroundColor = .black
        imagePicker.settings.theme.selectionFillColor = UIColor.systemOrange
        imagePicker.settings.theme.selectionStrokeColor = UIColor.yellow
        imagePicker.settings.theme.selectionShadowColor = UIColor.red
        
        presentImagePicker(imagePicker, select: { (asset) in
            // User selected an asset. Do something with it. Perhaps begin processing/upload?
        }, deselect: { (asset) in
            // User deselected an asset. Cancel whatever you did when asset was selected.
        }, cancel: { (assets) in
            // User canceled selection.
        }, finish: { (assets) in
            // User finished selection assets.
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    


}
