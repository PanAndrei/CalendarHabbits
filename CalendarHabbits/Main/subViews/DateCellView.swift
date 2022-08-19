//
//  DateCellView.swift
//  CalendarHabbits
//
//  Created by Andrei Panasenko on 19.08.2022.
//

import SwiftUI

struct DateCellView: View {
    
    @State var progress = Float.random(in: 0 ... 1)
    
    private let width = UIScreen.main.bounds.size.width
    
    let date: Date
    let calendar: Calendar
    let dateFormatter: DateFormatter
    let weekDayFormatter: DateFormatter
    
    init(date: Date, calendar: Calendar) {
        self.date = date
        self.calendar = calendar
        
        dateFormatter = DateFormatter(dateFormat: "d", calendar: calendar)
        weekDayFormatter = DateFormatter(dateFormat: "EEE", calendar: calendar)
        weekDayFormatter.locale = .autoupdatingCurrent
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text(date, formatter: weekDayFormatter)
                    .scaledToFill()
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                
                Spacer()
                
                ProgressView("", value: progress) // random
            }
            
            Text(date, formatter: dateFormatter)
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .lineLimit(1)
        }
        .padding(10)
        .frame(width: width / 8, height: width / 4)
    }
}

