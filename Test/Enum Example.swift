//
//  Enum Example.swift
//  Test
//
//  Created by Fomagran on 2021/04/28.
//

import Foundation

enum Earth {
    case Asia(Asia)
    case America(Asia)
    case Africa(Asia)
    case Europe(Asia)
    case Oceania(Asia)
}

enum Asia:String {
    case korea = "대한민국"
    case china = "중국"
    case japan = "일본"
}

enum America {
    case usa
    case canada
    case mexico
}

enum Africa {
    case libya
    case egypt
    case ethiopia
}

enum Europe {
    case france
    case italy
    case germay
}

enum Oceania {
    case australia
    case newzealand
    case solomon
}


let korea = Earth.Asia(.korea)
print(korea)
