//
//  PositionsVehicle.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct PositionsVehicle {
    let gosId: String
    let angle: Int
    let position: LatLon
}

extension PositionsVehicle: Decodable {
    static func create(gosId: String)(angle: Int)(position: LatLon) -> PositionsVehicle {
        return PositionsVehicle(gosId: gosId, angle: angle, position: position)
    }
    
    static func decode(json: JSON) -> Decoded<PositionsVehicle> {
        return PositionsVehicle.create
            <^> json <| "gos_id"
            <*> json <| "angle"
            <*> json <| "position"
    }
}
