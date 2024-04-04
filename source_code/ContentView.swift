//
//  ContentView.swift
//  teste
//
//  Created by Caio Melloni dos Santos on 25/03/24.
//

import BackendLib
import SwiftData
import SwiftUI
import Assets

struct ContentView: View {
    @State private var cycleService: CycleService

    init(context: ModelContext) {
        let cycleService = CycleService(context: context)
        _cycleService = State(initialValue: cycleService)
    }

    var body: some View {
        VStack {
            Button("create cycle") {
                //let cycle = cycleService.createCycle()
                //cycle.sympthoms?.append(CycleSymptom(day: Date(), symptom: .acne))
            }
            Button("fetch sympthom") {}
            Button("add sympthom") {}
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            List {
                ForEach(cycleService.cycles) { cycle in
                    ForEach(cycle.sympthoms ?? []) { sym in
                        Text(sym.symptom == .acne ? "acne" : "another one")
                    }
                }
            }
        }
        .padding()
    }
}
