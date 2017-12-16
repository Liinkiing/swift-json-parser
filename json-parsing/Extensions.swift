//
// Created by Jbara Omar on 16/12/2017.
// Copyright (c) 2017 Brogrammers. All rights reserved.
//

extension Array where Element == Event {
    func findBy(place: Place) -> [Event]? {
        return self.filter({ (event) -> Bool in
            return (event.places?.contains(place))!
        })
    }

    func findBy(category: Category) -> [Event]? {
        return self.filter({ (event) -> Bool in
            return event.category == category
        })
    }
}

extension Array where Element: NameProtocol {
    func findBy(name: String, useStrict strict: Bool = false) -> [NameProtocol]? {
        return self.filter({ element in
            if strict { return element.name == name }
            else { return element.name!.lowercased().contains(name.lowercased()) }
        })
    }
}

extension Array where Element: IdProtocol {
    func findBy(id: Int) -> IdProtocol? {
        return self.filter({ element in
            element.id == id
        }).first!
    }
}
