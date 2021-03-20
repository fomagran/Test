//
//  ArtCodeViewController.swift
//  Test
//
//  Created by Fomagran on 2021/01/31.
//

import UIKit

class ArtCodeViewController: UIViewController {

    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var colors = [UIColor]()
    
    
    @IBAction func tapShowButton(_ sender: Any) {
        
        performSegue(withIdentifier: "showCollectionView", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGR)
        for y in stride(from: 1, to: 800, by: 10){
            for x in stride(from: 1, to: 400, by: 10) {
                let colorAtPixel : UIColor = (imageView.getPixelColor(atPosition: CGPoint(x: x, y: y)))
                print(x,y)
                colors.append(colorAtPixel)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCollectionView"{
            let vc = segue.destination as! ArtCodeCollectionViewController
            vc.colors = colors
        }
    }
    //뷰 터치했을때 CGPoint값 알아내기
    @objc func tapped(gr:UITapGestureRecognizer) {
        let loc:CGPoint = gr.location(in: gr.view)
        print(loc)
        //알아낸 CGPoint를 getPixelColor에 넣어줘서 터치한 부분의 색 알아내기
        let colorAtPixel : UIColor = (imageView.getPixelColor(atPosition: CGPoint(x: Int(loc.x), y: Int(loc.y))))
        //터치한 부분 색 테스트뷰에 띄워보기 성공!!
        testView.backgroundColor = colorAtPixel
    }
    
}
//이미지뷰의 특정 CGPoint 색 알아내기
extension UIImageView {
    
    func getPixelColor(atPosition:CGPoint) -> UIColor{

        var pixel:[CUnsignedChar] = [0, 0, 0, 0]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue:    CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: &pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)

        context!.translateBy(x: -atPosition.x, y: -atPosition.y)
        layer.render(in: context!)
        let color:UIColor = UIColor(red: CGFloat(pixel[0])/255.0,
                                    green: CGFloat(pixel[1])/255.0,
                                    blue: CGFloat(pixel[2])/255.0,
                                    alpha: CGFloat(pixel[3])/255.0);

        return color;

    }
    
}
