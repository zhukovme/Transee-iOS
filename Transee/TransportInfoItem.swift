//
//  TransportInfo.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct TransportInfoItem {
    let station: String
    let time: String
}

extension TransportInfoItem: Decodable {
    static func create(station: String)(time: String) -> TransportInfoItem {
        return TransportInfoItem(station: station, time: time)
    }
    
    static func decode(json: JSON) -> Decoded<TransportInfoItem> {
        return TransportInfoItem.create
            <^> json <| "station"
            <*> json <| "time"
    }
}
