//
//  Calendar+Extension.swift
//  CalendarHabbits
//
//  Created by Andrei Panasenko on 19.08.2022.
//

import Foundation

extension Calendar {
    
    func makeDays() -> [Date] {
        
        let calendar = Calendar(identifier: .iso8601)
        
        guard let lastDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date()),
              let nextDate = Calendar.current.date(byAdding: .weekOfMonth, value: +1, to: Date()) else { return [] }
        
        let firstWeek = calendar.dateInterval(of: .weekOfMonth, for: lastDate)
        let lastWeek = calendar.dateInterval(of: .weekOfMonth, for: nextDate)
        let dateInterval = DateInterval(start: firstWeek!.start, end: lastWeek!.end)
        
        return calendar.generateDays(for: dateInterval)
    }
    
    
    func generatedDates(for dateInterval: DateInterval, matching components: DateComponents) -> [Date] {
        var dates = [dateInterval.start]
        
        enumerateDates(startingAfter: dateInterval.start, matching: components, matchingPolicy: .nextTime) { date, _, stop in
            guard let date = date else { return }
            
            guard date < dateInterval.end else {
                stop = true
                return
            }
            
            dates.append(date)
        }
        return dates
    }
    
    func generateDays(for dateInterval: DateInterval) -> [Date] {
        generatedDates(for: dateInterval, matching: dateComponents([.hour, .minute, .second], from: dateInterval.start))
    }
}
