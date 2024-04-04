//
//  CalendarView.swift
//  core_app
//
//  Created by Larissa Fazolin on 04/04/24.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello, Julia")
                    .font(.system(size: 20))
                Spacer()
            }

            Rectangle()
                .frame(width: 140, height: 140)
                .cornerRadius(65)
                .overlay(
                    VStack {
                        Text("14")
                            .font(.system(size: 40))
                        Text("TODAY")
                            .font(.system(size: 14))
                    }
                )

            Spacer()
        }
        .padding()
    }
}
