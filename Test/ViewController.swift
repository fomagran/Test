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
            
            
            let point1 = CLLocationCoordinate2D(latitude: 37.558529,
                                              longitude: 126.917449)

            let point2 = CLLocationCoordinate2D(latitude: 37.558630,
                                              longitude: 126.918196)
            let point3 = CLLocationCoordinate2D(latitude: 37.559228,
                                              longitude: 126.918080)
            let point4 = CLLocationCoordinate2D(latitude: 37.559340,
                                              longitude: 126.917441)
            
            print(region.contains(test2))
            print(region.contains(point1))
            print(region.contains(point2))
            print(region.contains(point3))
            print(region.contains(point4))
            
           
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
