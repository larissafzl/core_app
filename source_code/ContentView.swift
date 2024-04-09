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
    @State private var context: ModelContext
    @State private var cycleService: CycleService

    init(context: ModelContext) {
        self.context = context
        let cycleService = CycleService(context: context)
        _cycleService = State(initialValue: cycleService)
    }

    var body: some View {
        let cycle = cycleService.createCycle(startDate: Date(), endDate: Date())
        SelectedFrame(cycle: cycle, context: context, selectionType: .symptons, date: Date())
    }
}