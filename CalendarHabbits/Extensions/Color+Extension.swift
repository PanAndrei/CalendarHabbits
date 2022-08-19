//
//  Color+Extension.swift
//  CalendarHabbits
//
//  Created by Andrei Panasenko on 18.08.2022.
//

import SwiftUI

extension Color {
    enum CustomColors: String {
        case backgroundColor = "backgroundColor"
        case currentSelectedColor = "currentSelectedColor"
        case futureColor = "futureColor"
        case passedColor = "passedColor"
        
        internal var color: Color {
            return Color(self.rawValue)
        }
    }
}
