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
     
        setupData()
        
        let artwork = Marker(
          title: "임오빌딩",
          locationName: "우리집 앞 임오빌딩",
          discipline: "Sculpture",
          coordinate: CLLocationCoordinate2D(latitude: 37.558529, longitude: 126.917449))
        mapView.addAnnotation(artwork)


    }
    
    func setupData() {
        // 1. check if system can monitor regions
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
     
            // 2. region data
            let title = "SK 주유소"
            let coordinate = CLLocationCoordinate2DMake(37.55950191286448, 126.91666066863014)
            let regionRadius = 100.0
            
            // 3. setup region
            let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
                                                                         longitude: coordinate.longitude), radius: regionRadius, identifier: title)
            
            let test2 = CLLocationCoordinate2D(latitude:latitude!,longitude:longitude!)
  
            addressToCoordinate(address: "서울특별시 마포구 성산동 631-5")
            print(latitude,longitude)

            let point1 = CLLocationCoordinate2D(latitude: 37.558529,longitude: 126.917449)
            let point2 = CLLocationCoordinate2D(latitude: 37.558630,longitude: 126.918196)
            let point3 = CLLocationCoordinate2D(latitude: 37.559228,longitude: 126.918080)
            let point4 = CLLocationCoordinate2D(latitude: 37.559340,longitude: 126.917441)
            
           
            locationManager.startMonitoring(for: region)
     
            // 4. setup annotation
            let restaurantAnnotation = MKPointAnnotation()
            restaurantAnnotation.coordinate = coordinate;
            restaurantAnnotation.title = "\(title)";
            mapView.addAnnotation(restaurantAnnotation)
     
            // 5. setup circle
            let circle = MKCircle(center: coordinate, radius: regionRadius)
            mapView.addOverlay(circle)
        }
        else {
            print("System can't track regions")
        }
    }
     
    // 6. draw circle
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.strokeColor = .red
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
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }

        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            let pinImage = #imageLiteral(resourceName: "아파트")
                  let size = CGSize(width: 25, height: 25)
                  UIGraphicsBeginImageContext(size)
            pinImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            annotationView.image = resizedImage
            
        }
        
        let annotationLabel = UILabel(frame: CGRect(x: 0, y: -35, width: 45, height: 15))
        annotationLabel.backgroundColor = .systemOrange
        annotationLabel.textColor = .white
        annotationLabel.numberOfLines = 3
        annotationLabel.textAlignment = .center
        annotationLabel.font = UIFont.boldSystemFont(ofSize: 10)
        annotationLabel.tag = 22
        annotationLabel.text = annotation.title!
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
    
    func addressToCoordinate(address:String) {
        let geoCoder = CLGeocoder()
           geoCoder.geocodeAddressString(address) { (placemarks, error) in
               guard
                   let placemarks = placemarks,
                   let location = placemarks.first?.location
               else {
                    print("No Location")
                   return
               }
            print(location.coordinate)
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
        print(point)
        return path.contains(point)
    }
}
