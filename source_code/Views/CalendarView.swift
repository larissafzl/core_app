//
//  CalendarView.swift
//  core_app
//
//  Created by Larissa Fazolin on 04/04/24.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    // Greetings
                    Text("Hello, Julia!")
                        .font(.system(.title2))

                    HStack {
                        // Calendar
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 460, height: 370)

                        VStack(alignment: .leading) {
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

                    HStack {
                        // Calendar
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 460, height: 370)

                        VStack(alignment: .leading) {
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

                Spacer()
            }
        }
    }
}
