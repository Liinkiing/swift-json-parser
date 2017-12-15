//
//  Event.swift
//  json-parsing
//
//  Created by Jbara Omar on 14/12/2017.
//  Copyright © 2017 Brogrammers. All rights reserved.
//

struct Event: Decodable, IdProtocol {
    var id: Int?
    var name: String?
    var excerpt: String?
    var places: [Place]?
    var category: Category
    var startingDate: Date
    var endingDate: Date
}
