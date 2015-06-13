//
//  StationInfoForecast.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct StationInfoForecast {
    let type: String
    let arrivedAfter: String
    let id: String
    let name: String
}

extension StationInfoForecast: Decodable {
    static func create(type: String)(arrivedAfter: String)(id: String)(name: String) -> StationInfoForecast {
        return StationInfoForecast(type: type, arrivedAfter: arrivedAfter, id: id, name: name)
    }
    
    static func decode(json: JSON) -> Decoded<StationInfoForecast> {
        return StationInfoForecast.create
            <^> json <| "type"
            <*> json <| "arrived_after"
            <*> json <| "id"
            <*> json <| "name"
    }
}
