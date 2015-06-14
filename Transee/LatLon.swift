//
//  Point.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct LatLon {
    let latitude: Double
    let longitude: Double
}

extension LatLon: Decodable {
    static func create(latitude: Double)(longitude: Double) -> LatLon {
        return LatLon(latitude: latitude, longitude: longitude)
    }
    
    static func decode(json: JSON) -> Decoded<LatLon> {
        switch json {
            case let .Array(a):
                return LatLon.create
                    <^> .fromOptional(Double.decode(a.first!).value)
                    <*> .fromOptional(Double.decode(a.last!).value)
            default:
                return .TypeMismatch("\(json) is not an Array")
        }
    }
}
