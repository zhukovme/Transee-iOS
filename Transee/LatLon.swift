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
        return LatLon.create
            <^> json <| ""
            <*> json <| ""
    }
}
