//
//  Date+Extension.swift
//  CalendarHabbits
//
//  Created by Andrei Panasenko on 19.08.2022.
//

import Foundation

extension Date {
    func startOfMonth(using calendar: Calendar) -> Date {
        calendar.date(from: calendar.dateComponents([.year, .month], from: self)) ?? self
    }
}
