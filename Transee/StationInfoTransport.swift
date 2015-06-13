//
//  StationInfoTransport.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct StationInfoTransport {
    let type: String
    let id: String
    let name: String
    let from: String
    let to: String
}

extension StationInfoTransport: Decodable {
    static func create(type: String)(id: String)(name: String)(from: String)(to: String) -> StationInfoTransport {
        return StationInfoTransport(type: type, id: id, name: name, from: from, to: to)
    }
    
    static func decode(json: JSON) -> Decoded<StationInfoTransport> {
        return StationInfoTransport.create
            <^> json <| "type"
            <*> json <| "id"
            <*> json <| "name"
            <*> json <| "from"
            <*> json <| "to"
    }
}
