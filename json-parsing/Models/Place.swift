//
//  Place.swift
//  json-parsing
//
//  Created by Jbara Omar on 14/12/2017.
//  Copyright © 2017 Brogrammers. All rights reserved.
//

struct Place: Decodable, IdProtocol, NameProtocol, Equatable {
    var id: Int?
    var name: String?
    var seats: Int?

    static func ==(lhs: Place, rhs: Place) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id && lhs.seats == rhs.seats
    }
}
