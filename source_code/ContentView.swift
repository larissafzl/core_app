//
//  ContentView.swift
//  teste
//
//  Created by Caio Melloni dos Santos on 25/03/24.
//

import BackendLib
import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var cycleService: CycleService

    init(context: ModelContext) {
        let cycleService = CycleService(context: context)
        _cycleService = State(initialValue: cycleService)
    }

    @State var dayClick: Int = Calendar.current.component(.day, from: Date())
    @State var monthClick: Int = Calendar.current.component(.month, from: Date())
    @State var yearClick: Int = Calendar.current.component(.year, from: Date())

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CalendarView(dayClick: $dayClick, monthClick: $monthClick, yearClick: $yearClick)) {
                    Label("Calendar", systemImage: "calendar")
                }
            }.listStyle(.sidebar)
                .navigationTitle("Sidebar")
        }
    }
}

// #Preview {
//    ContentView()
// }
