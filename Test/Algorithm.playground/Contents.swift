import CoreLocation


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


addressToCoordinate(str: "", address: "서울특별시 노원구 중계로 184")
