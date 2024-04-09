//
//  Mocks.swift
//  core_app
//
//  Created by Clissia Bozzer Bovi on 01/04/24.
//

import Foundation

enum SelectionType {
    case symptons
    case mood
}

protocol SelectionData {
    var titleText: String { get set }
    var buttonTitle: String { get set }
    var list: [SelectionElement] { get set }
}

enum Mocks {
    struct Symptons: SelectionData {
        var titleText: String = "Seus sintomas de hoje"

        var buttonTitle: String = "Adicionar sintoma"

        var list: [SelectionElement] = [SelectionElement(selectionName: SymptomCorrelation.getText(.sensitiveBreasts)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.cramp)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.headache)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.fever)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.backache)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.acne)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.nausea)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.tiredness)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.veryHungry)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.notHungry)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.insomnia))]
    }

    struct Mood: SelectionData {
        var titleText: String = "Seu humor de hoje"

        var buttonTitle: String = "Adicionar humor"

        var list: [SelectionElement] = [SelectionElement(selectionName: "Humor"),
                                        SelectionElement(selectionName: "Calmo"),
                                        SelectionElement(selectionName: "Feliz"),
                                        SelectionElement(selectionName: "Enérgico"),
                                        SelectionElement(selectionName: "Alegre"),
                                        SelectionElement(selectionName: "Sonolento"),
                                        SelectionElement(selectionName: "Irritado"),
                                        SelectionElement(selectionName: "Ansioso"),
                                        SelectionElement(selectionName: "Triste"),
                                        SelectionElement(selectionName: "Desanimado"),
                                        SelectionElement(selectionName: "Pensamentos obsessivos"),
                                        SelectionElement(selectionName: "Pouca energia"),
                                        SelectionElement(selectionName: "Apático"),
                                        SelectionElement(selectionName: "Confuso"),
                                        SelectionElement(selectionName: "Muito autocrítica"),
                                        SelectionElement(selectionName: "Emocionada")]
    }

    static func getData(type: SelectionType) -> SelectionData {
        switch type {
        case .symptons:
            return Symptons()
        case .mood:
            return Mood()
        }
    }
}
