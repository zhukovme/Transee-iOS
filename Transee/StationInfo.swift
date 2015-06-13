//
//  StationsInfo.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct StationInfo {
    let name: String
    let transports: [StationInfoTransport]?
    let forecasts: [StationInfoForecast]?
}

extension StationInfo: Decodable {
    static func create(name: String)(transports: [StationInfoTransport]?)(forecasts: [StationInfoForecast]?) -> StationInfo {
        return StationInfo(name: name, transports: transports, forecasts: forecasts)
    }
    
    static func decode(json: JSON) -> Decoded<StationInfo> {
        return StationInfo.create
            <^> json <| "name"
            <*> json <||? "transports"
            <*> json <||? "forecasts"
    }
}
