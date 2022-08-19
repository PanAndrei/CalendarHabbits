//
//  DateFormatter+Extension.swift
//  CalendarHabbits
//
//  Created by Andrei Panasenko on 19.08.2022.
//

import Foundation

extension DateFormatter {
    convenience init(dateFormat: String, calendar: Calendar) {
        self.init()
        self.dateFormat = dateFormat
        self.calendar = calendar
        self.locale = Locale(identifier: "js_JP")
    }
}
