//
//  SelectedFrame.swift
//  core_app
//
//  Created by Clissia Bozzer Bovi on 25/03/24.
//

import Assets
import BackendLib
import SwiftUI

struct SelectedFrame: View {
    @State private var isPopoverPresented: Bool = false
    @State private var selectedElements: [SelectionElement] = []
    @State private var listElements: [SelectionElement] = []
    @State private var buttonText = "Adicionar sintoma"
    @State private var titleText = "Seus sintomas de hoje"

    var cycle: Cycle
    var cycleService: CycleService
    let selectionType: SelectionType
    let date: Date

    private func setData() {
        let data = Mocks.getData(type: selectionType)
        listElements = data.list
        buttonText = data.buttonTitle
        titleText = data.titleText
    }

    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        return dateFormatter.string(from: date)
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(titleText)
                    .foregroundStyle(Color(ColorName.Label))
            }
            .padding(.top, 8)
            .padding(.bottom, selectedElements.count == 0 ? -4 : 0)
            .padding(.leading, -160)

            VStack(spacing: 0) {
                ScrollView([.horizontal], showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(selectedElements, id: \.self) { _ in
                            Images.flowIntenseNotSelected.swiftUIImage
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .shadow(radius: 60)
                        }
                    }
                }
                .padding(.leading)
                .padding(.top, -16)
                .frame(height: selectedElements.count == 0 ? 0 : 60)

                Divider()
                    .foregroundColor(Color(ColorName.Elements))
                    .padding(.leading, 20)
                    .padding(.trailing, 20)

                Button(action: {
                    self.isPopoverPresented = true
                }, label: {
                    Text(buttonText)
                        .frame(width: 380, height: 20)
                })
                .popover(isPresented: $isPopoverPresented, arrowEdge: .trailing) {
                    SelectionPopUp(selection: $selectedElements,
                                   listElements: $listElements,
                                   dateString: getDate(),
                                   cycle: cycle,
                                   cycleService: cycleService,
                                   selectionType: selectionType,
                                   date: date)
                        .frame(width: 300, height: 400)
                        .interactiveDismissDisabled()
                }
                .buttonStyle(.plain)
                .foregroundColor(Color(ColorName.Button))
                .frame(width: 380, height: 0)
                .padding(.all, 16)
            }
        }
        .frame(width: 380, height: selectedElements.count == 0 ? 80 : 150)
        .contentShape(Rectangle())
        .background(Color.white.opacity(0.8))
        .cornerRadius(15)
        .onAppear(perform: {
            setData()
        })
    }
}
