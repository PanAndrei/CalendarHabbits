//
//  ContentView.swift
//  CalendarHabbits
//
//  Created by Andrei Panasenko on 17.08.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MainView(calendar: Calendar(identifier: .iso8601))
        }
    }
}
