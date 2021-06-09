import UIKit
import Photos

class ViewController: UIViewController {
    
    @IBOutlet weak var photo:UIImageView!
    
    var allPhotos:PHFetchResult<PHAsset>? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
    }
    
    func request() {
        PHPhotoLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.retrieveAsset()
            }
        }
    }
    
    func assetToImage(asset: PHAsset) -> UIImage {
        var image = UIImage()
        let manager = PHImageManager.default()
        
        //이 부분을 제가 빠뜨렸네요 ㅜ
        let options = PHImageRequestOptions()
        options.deliveryMode = .opportunistic
        
        //위 options를 아래 options 파라미터에 넣어주셔야 해요! (현재 nil로 되어있을거에요!)
        manager.requestImage(for: asset, targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFill, options: options, resultHandler: {(result, info)->Void in
            image = result!
        })
        return image
    }
    
    func retrieveAsset() {
        let fetchOptions = PHFetchOptions()
        allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        let image = assetToImage(asset: (allPhotos?.object(at: 0))!)
        DispatchQueue.main.async {
            self.photo.image = image
        }
    }
}
