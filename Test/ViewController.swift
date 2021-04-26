//
//  ViewController.swift
//  Test
//
//  Created by Fomagran on 2021/01/22.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController ,MKMapViewDelegate{
    
    var annotations = [MKAnnotation]()
    
     var currentLocation:CLLocationCoordinate2D!
    var longitude:Double?
    var latitude:Double?
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        requestAuthorization()
     
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        
    
        let mark1 = Marker(
          title: "홍대입구역",
          subtitle: "사람이 너무 많아요..ㅜ",
          coordinate: CLLocationCoordinate2D(latitude: 37.55769, longitude: 126.92450))
        mapView.addAnnotation(mark1)

        
        let mark2 = Marker(
          title: "홍대입구역스타벅스",
          subtitle: "커피 맛있다",
          coordinate: CLLocationCoordinate2D(latitude: 37.557123, longitude: 126.923588))
        mapView.addAnnotation(mark2)
        
        
        
        detectMarkerLocation()


    }

    
    func detectMarkerLocation() {
        
        //모니터링이 가능한지 확인
//        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
     
            //            locationManager.startMonitoring(for: region)
            
            let 홍대입구역중앙 = CLLocationCoordinate2DMake(37.55769, 126.92450)
            let 범위 = 200.0 //100meter를 뜻함
            
            let 홍대입구역범위 = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 홍대입구역중앙.latitude,
                                                                         longitude: 홍대입구역중앙.longitude), radius: 범위, identifier: "홍대입구역")
            let 원모양 = MKCircle(center: 홍대입구역중앙, radius: 범위)
            mapView.addOverlay(원모양)
            
            for marker in mapView.annotations{
                if 홍대입구역범위.contains(marker.coordinate) {
                    print("\(marker.title!!)은 홍대입구역 범위에 포함되었습니다.")
                }else{
                    print("\(marker.title!!)은 홍대입구역 범위에 포함되지않습니다.")
                }
            }
//        }
//        else {
//            print("System can't track regions")
//        }
    }
     
    // 6. draw circle
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.strokeColor = .red
        circleRenderer.fillColor = UIColor.yellow.withAlphaComponent(0.3)
        circleRenderer.lineWidth = 1.0
        return circleRenderer
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !(annotation is MKUserLocation) else {
            return nil
        }

        // Better to make this class property
        let annotationIdentifier = "AnnotationIdentifier"

        var annotationView: MKAnnotationView?
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let image = #imageLiteral(resourceName: "아파트")
        imageView.image = image
        
        let annotationLabel = UILabel(frame: CGRect(x: 0, y: -35, width: 45, height: 15))
        annotationLabel.backgroundColor = .systemOrange
        annotationLabel.textColor = .white
        annotationLabel.adjustsFontSizeToFitWidth = true
        annotationLabel.textAlignment = .center
        annotationLabel.font = UIFont.boldSystemFont(ofSize: 10)
        annotationLabel.text = annotation.title!
       
        
        
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }


        annotationView?.addSubview(imageView)
        annotationView?.addSubview(annotationLabel)
        
        return annotationView
    }
    
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        showAlert("enter \(region.identifier)")
    }
     
    // 2. user exit region
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        showAlert("exit \(region.identifier)")
    }
    
    
    func showAlert(_ str:String){
        print(str)
    }
    
    private func requestAuthorization() {
               //정확도를 검사한다.
               locationManager.desiredAccuracy = kCLLocationAccuracyBest
               //앱을 사용할때 권한요청
               locationManager.requestWhenInUseAuthorization()
               locationManager.delegate = self
               locationManagerDidChangeAuthorization(locationManager)
       }
    
    func coordinateToAddress(lat:Double,lon:Double) {
        let location: CLLocation = CLLocation(latitude: lat, longitude: lon)
        let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (placemarksArray, error) in
                print(placemarksArray!)
                if (error) == nil {
                    if placemarksArray!.count > 0 {
                        let placemark = placemarksArray?[0]
                        let address = "\(placemark?.subThoroughfare ?? ""), \(placemark?.thoroughfare ?? ""), \(placemark?.locality ?? ""), \(placemark?.subLocality ?? ""), \(placemark?.administrativeArea ?? ""), \(placemark?.postalCode ?? ""), \(placemark?.country ?? "")"
                        print("\(address)")
                    }
                }

            }
    }
    
    func addressToCoordinate(str:String,address:String){
        let geoCoder = CLGeocoder()
           geoCoder.geocodeAddressString(address) { (placemarks, error) in
               guard
                   let placemarks = placemarks,
                   let location = placemarks.first?.location
               else {
                    print("No Location")
                   return
               }

            print("\(str),\(location.coordinate.latitude),\(location.coordinate.longitude)")
           }
    }
}

extension ViewController:CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentLocation = locationManager.location?.coordinate
            longitude = currentLocation.longitude
            latitude = currentLocation.latitude
        }
    }
    
}


extension CLLocationCoordinate2D {

    func contained(by vertices: [CLLocationCoordinate2D]) -> Bool {
        let path = CGMutablePath()

        for vertex in vertices {
            if path.isEmpty {
                path.move(to: CGPoint(x: vertex.longitude, y: vertex.latitude))
            } else {
                path.addLine(to: CGPoint(x: vertex.longitude, y: vertex.latitude))
            }
        }

        let point = CGPoint(x: self.longitude, y: self.latitude)
        return path.contains(point)
    }
}
