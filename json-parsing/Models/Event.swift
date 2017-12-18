//
//  Event.swift
//  json-parsing
//
//  Created by Jbara Omar on 14/12/2017.
//  Copyright © 2017 Brogrammers. All rights reserved.
//

import UIKit

class Event: NSObject, NSCoding, Decodable, IdProtocol, NameProtocol {
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

    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as! Int?
        self.name = aDecoder.decodeObject(forKey: "name") as! String?
        self.excerpt = aDecoder.decodeObject(forKey: "excerpt") as! String?
        self.image = aDecoder.decodeObject(forKey: "image") as! String?
        self.places = aDecoder.decodeObject(forKey: "places") as! [Place]?
        self.category = aDecoder.decodeObject(forKey: "category") as! Category
        self.startingDate = aDecoder.decodeObject(forKey: "startingDate") as! Date
        self.endingDate = aDecoder.decodeObject(forKey: "endingDate") as! Date
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(excerpt, forKey: "excerpt")
        aCoder.encode(image, forKey: "image")
        aCoder.encode(places, forKey: "places")
        aCoder.encode(category, forKey: "category")
        aCoder.encode(startingDate, forKey: "startingDate")
        aCoder.encode(endingDate, forKey: "endingDate")
    }

    func getUIImage() -> UIImage {
        guard let img = image else { return UIImage(named: "default")! }
        return UIImage(named: img) ?? UIImage(named: "default")!
    }
    
    override var description: String {
        return "[\(id!)] - \(name!)"
    }
}
