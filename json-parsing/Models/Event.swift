//
//  Event.swift
//  json-parsing
//
//  Created by Jbara Omar on 14/12/2017.
//  Copyright © 2017 Brogrammers. All rights reserved.
//

import UIKit

struct Event: Decodable, IdProtocol, NameProtocol, Equatable {
    var id: Int?
    var name: String?
    var excerpt: String?
    var image: String?
    var places: [Place]?
    var category: Category
    var startingDate: Date
    var endingDate: Date

    static func ==(lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }

    func getUIImage() -> UIImage {
        guard let img = image else { return UIImage(named: "default")! }
        return UIImage(named: img) ?? UIImage(named: "default")!
    }
}
