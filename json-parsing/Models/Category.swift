//
// Created by Jbara Omar on 14/12/2017.
// Copyright (c) 2017 Brogrammers. All rights reserved.
//

struct Category: Decodable, IdProtocol, NameProtocol, Equatable {
    var id: Int?
    var name: String?

    static func ==(lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}
