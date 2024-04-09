//
//  SelectionPopUp.swift
//  core_app
//
//  Created by Clissia Bozzer Bovi on 25/03/24.
//

import BackendLib
import SwiftUI

struct SelectionPopUp: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selection: [SelectionElement]
    @Binding var listElements: [SelectionElement]
    @State private var selectedElements: [SelectionElement] = []
    @State private var removedElements: [SelectionElement] = []
    @State var dateString: String

    var cycle: Cycle
    var cycleService: CycleService
    let columns = [GridItem(.flexible())]
    let selectionType: SelectionType
    let date: Date

    private func passToFrame() {
        for element in selectedElements {
            selection.append(element)
        }

        for element in removedElements {
            let name = element.selectionName
            if let index = selection.firstIndex(where: { $0.selectionName == name }) {
                selection.remove(at: index)
            }
        }
    }

    private func getSympthomType(_ index: Int) -> SymptomType {
        let text = removedElements[index].selectionName
        return SymptomCorrelation.getSymptomType(text)
    }

    private func getMoodType(_ index: Int) -> MoodType {
        let text = selectedElements[index].selectionName
        return MoodCorrelation.getMoodType(text)
    }

    private func save() {
        switch selectionType {
        case .symptons:
            saveSymptom()
            deleteSymptom()
        case .mood:
            saveMood()
            deleteMood()
        }
    }

    private func deleteSymptom() {
        for index in 0 ..< removedElements.count {
            let sympthomType = getSympthomType(index)
            cycleService.removeSympthom(cycle: cycle, symptom: sympthomType, date: date)
        }
    }

    private func deleteMood() {
        for index in 0 ..< removedElements.count {
            let text = removedElements[index].selectionName
            let moodType = MoodCorrelation.getMoodType(text)
            cycleService.removeMood(cycle: cycle, moodType: moodType, date: date)
        }
    }

    private func saveSymptom() {
        for index in 0 ..< selectedElements.count {
            let text = selectedElements[index].selectionName
            let sympthomType = SymptomCorrelation.getSymptomType(text)
            cycleService.addSymptom(cycle: cycle, symptom: sympthomType, date: date)
        }
    }

    private func saveMood() {
        for index in 0 ..< selectedElements.count {
            let moodType = getMoodType(index)
            cycleService.addMood(cycle: cycle, moodType: moodType, date: date)
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(dateString)
                .font(.title3)
                .padding(.horizontal)
                .foregroundColor(Color(ColorName.Label))

            Divider()

            ScrollView {
                LazyVGrid(columns: columns, spacing: 36) {
                    ForEach(listElements, id: \.self) { element in
                        let index = listElements.firstIndex(of: element) ?? 0
                        let didTapElement = element.didTap
                        HStack(spacing: 10) {
                            Circle()
                                .size(CGSize(width: 20, height: 20))
                                .foregroundColor(didTapElement ?
                                    Color(ColorName.ButtonBackground) : Color(ColorName.Elements))

                            Text(element.selectionName)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .alignmentGuide(.leading) { dimension in
                                    dimension[VerticalAlignment.center]
                                }
                                .foregroundColor(didTapElement ?
                                    Color(ColorName.ButtonBackground) : Color(ColorName.Elements))

                            Spacer()
                        }
                        .onTapGesture {
                            listElements[index].tap()
                            if didTapElement {
                                removedElements.append(listElements[index])
                            } else {
                                selectedElements.append(listElements[index])
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            Divider()
            Button {
                save()
                passToFrame()
                dismiss()
            } label: {
                Text("Concluído")
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(ColorName.ButtonBackground))
            .frame(width: 100, height: 28)
            .padding([.leading, .trailing], 16)
            .padding(.bottom, -8)
        }
        .padding(.vertical)
        .background(Color.white)
    }
}
