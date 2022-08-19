//
//  MainView.swift
//  CalendarHabbits
//
//  Created by Andrei Panasenko on 18.08.2022.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedDate = Self.now
    @State var dragOffset = CGSize.zero
    @State var finalOffset: CGFloat = 0
    
    private static var now = Date()
    
    private let calendar: Calendar
    private let days: [Date]
    private let width = UIScreen.main.bounds.size.width
    
    let dateFormatter: DateFormatter
    
    init(calendar: Calendar) {
        self.calendar = calendar
        self.days = calendar.makeDays()
        
        dateFormatter = DateFormatter(dateFormat: "EEE, dd MMM", calendar: calendar)
        dateFormatter.locale = .autoupdatingCurrent
    }
    
    var body: some View {
        VStack {
            VStack {
                Text(calendar.isDate(Date(), inSameDayAs: selectedDate) ? LocalizedStringKey("today") : "\(selectedDate, formatter: dateFormatter)")

                HStack {
                    ForEach(self.days, id: \.self) { date in
                            DateCellView(date: date, calendar: calendar)
                        
                            .foregroundColor(calendar.isDateInToday(date) ? Color.CustomColors.currentSelectedColor.color :
                                                date < Date() ? Color.CustomColors.passedColor.color : Color.CustomColors.futureColor.color)
                        
                            .overlay(RoundedRectangle(cornerRadius: 4)
                                        .stroke()
                                        .foregroundColor(Color.CustomColors.currentSelectedColor.color)
                                        .opacity(calendar.isDate(date, inSameDayAs: selectedDate) ? 1 : 0)
                            )

                            .onTapGesture {
                                selectedDate = date
                            }
                    }
                }
                .padding(.top, 8)
                .offset(x: dragOffset.width)
                .offset(x: finalOffset)
                .gesture(DragGesture()
                            .onChanged({ value in
                    withAnimation(.spring()) {
                        self.dragOffset = value.translation
                    }
                })
                            .onEnded({ _ in
                    if dragOffset.width > 150 && finalOffset != (width + 10) {
                        withAnimation(.spring()) {
                            finalOffset += (width + 10)
                            dragOffset = .zero
                        }
                        
                    } else if dragOffset.width < -150 && finalOffset != -(width + 10) {
                        withAnimation(.spring()) {
                            finalOffset -= (width + 10)
                            dragOffset = .zero
                        }
                        
                    } else {
                        withAnimation(.spring()) {
                            dragOffset = .zero
                        }
                    }
                })
                )
            }
            .ignoresSafeArea()
            .frame(height: UIScreen.main.bounds.size.height / 4)
            .background(Color.CustomColors.backgroundColor.color)
            
            Spacer()
        }
    }
}






