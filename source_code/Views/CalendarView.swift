//
//  CalendarView.swift
//  core_app
//
//  Created by Larissa Fazolin on 04/04/24.
//

import SwiftUI

struct CalendarView: View {
    @Binding var date: Date

    var monthToPass = Calendar.current.component(.month, from: Date())
    var yearToPass = Calendar.current.component(.year, from: Date())

    var body: some View {
        ScrollView {
            HStack {
                LazyVStack(alignment: .leading) {
                    // Greetings
                    Text("Hello, Julia!")
                        .font(.system(.title2))

                    LazyHStack {
                        // Calendar
//                        RoundedRectangle(cornerRadius: 10)
//                            .frame(width: 460, height: 370)
                        CalendarComponent(month: monthToPass,
                                          year: yearToPass,
                                          date: $date)

                        LazyVStack(alignment: .leading) {
                            // Begin cycle
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 142, height: 78)

                            // Current cycle phase
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 317, height: 281)
                        }
                    }
                    .padding(.bottom, 32)

                    // Selected date
                    Text("Thursday, 14 March 2024")
                        .bold()
                        .font(.system(.title))

                    Text("Personal Records")
                        .font(.system(.title2))

                    LazyHStack {
                        // Calendar
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 460, height: 370)

                        LazyVStack(alignment: .leading) {
                            // Begin cycle
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 142, height: 78)

                            // Current cycle phase
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 317, height: 281)
                        }
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}
