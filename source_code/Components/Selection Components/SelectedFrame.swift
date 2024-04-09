//
//  SelectedFrame.swift
//  core_app
//
//  Created by Clissia Bozzer Bovi on 25/03/24.
//

import Assets
import BackendLib
import SwiftData
import SwiftUI

struct SelectedFrame: View {
    @State private var isPopoverPresented: Bool = false
    @State private var selectedElements: [SelectionElement] = []
    @State private var listElements: [SelectionElement] = []
    @State private var buttonText = ""
    @State private var titleText = ""
    @State var popOverTitle: String = ""

    var cycle: Cycle
    var context: ModelContext
    let selectionType: SelectionType
    let date: Date

    private func setData() {
        let data = Mocks.getData(type: selectionType)
        listElements = data.list
        buttonText = data.buttonTitle
        titleText = data.titleText
        popOverTitle = data.popOverTitle
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
                    .padding(.leading, 16)
                    .foregroundStyle(Color(Colors.purple_700))
                Spacer()
            }
            .padding(.top, 8)
            .frame(width: 488)
            .padding(.bottom, selectedElements.count == 0 ? -4 : 0)

            VStack(spacing: 0) {
                ScrollView([.horizontal], showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(selectedElements) { element in
                            element.image
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
                    .foregroundColor(Color(Colors.gray_400))
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
                                   context: context,
                                   selectionType: selectionType,
                                   date: date,
                                   title: popOverTitle)
                        .frame(width: 300, height: 400)
                }
                .buttonStyle(.plain)
                .foregroundColor(Color(Colors.blue_500))
                .frame(width: 380, height: 0)
                .padding(.all, 16)
            }
        }
        .frame(width: 506, height: selectedElements.count == 0 ? 80 : 150)
        .contentShape(Rectangle())
        .background(Color.white.opacity(0.8))
        .cornerRadius(15)
        .padding(.all, 16)
        .onAppear(perform: {
            setData()
        })
    }
}
