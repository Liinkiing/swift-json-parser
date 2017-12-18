//
// Created by Jbara Omar on 14/12/2017.
// Copyright (c) 2017 Brogrammers. All rights reserved.
//

import Foundation

struct Date: Decodable {
    var year: Int!
    var month: Int!
    var day: Int!
    var hour: Int!
    var minute: Int!

    func getDate() -> Foundation.Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-M-d H:m"
        formatter.timeZone = .current
        let string = "\(year!)-\(month!)-\(day!) \(hour!):\(minute!)"
        return formatter.date(from: string)!
    }

    func getDate(withFormat format: String, withLocale locale: Locale? = .current) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.setLocalizedDateFormatFromTemplate(format)
        return formatter.string(from: getDate())
    }
}
