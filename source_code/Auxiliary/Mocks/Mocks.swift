//
//  Mocks.swift
//  core_app
//
//  Created by Clissia Bozzer Bovi on 01/04/24.
//

import Foundation
import SwiftUI

enum SelectionType {
    case symptons
    case mood
}

protocol SelectionData {
    var titleText: String { get set }
    var popOverTitle: String { get set }
    var buttonTitle: String { get set }
    var list: [SelectionElement] { get set }
    // var getImage
}

enum Mocks {
    struct Symptons: SelectionData {
        var titleText: String = "Today's Symptom"

        var popOverTitle: String = "Symptoms"

        var buttonTitle: String = "Add Symptom"

        var list: [SelectionElement] = [SelectionElement(selectionName: SymptomCorrelation.getText(.sensitiveBreasts),
                                                         image: SymptomCorrelation.getImage(.sensitiveBreasts)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.cramp),
                                                         image: SymptomCorrelation.getImage(.cramp)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.headache),
                                                         image: SymptomCorrelation.getImage(.headache)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.fever),
                                                         image: SymptomCorrelation.getImage(.fever)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.backache),
                                                         image: SymptomCorrelation.getImage(.backache)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.acne),
                                                         image: SymptomCorrelation.getImage(.acne)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.nausea),
                                                         image: SymptomCorrelation.getImage(.nausea)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.tiredness),
                                                         image: SymptomCorrelation.getImage(.tiredness)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.veryHungry),
                                                         image: SymptomCorrelation.getImage(.veryHungry)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.notHungry),
                                                         image: SymptomCorrelation.getImage(.notHungry)),
                                        SelectionElement(selectionName: SymptomCorrelation.getText(.insomnia),
                                                         image: SymptomCorrelation.getImage(.insomnia))]
    }

    struct Mood: SelectionData {
        var titleText: String = "Today's mood"

        var popOverTitle: String = "Moods"

        var buttonTitle: String = "Add Mood"

        var list: [SelectionElement] = [SelectionElement(selectionName: MoodCorrelation.getText(.calm),
                                                         image: MoodCorrelation.getImage(.calm)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.happy),
                                                         image: MoodCorrelation.getImage(.happy)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.energetic),
                                                         image: MoodCorrelation.getImage(.energetic)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.sleepy),
                                                         image: MoodCorrelation.getImage(.sleepy)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.irritated),
                                                         image: MoodCorrelation.getImage(.irritated)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.anxious),
                                                         image: MoodCorrelation.getImage(.anxious)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.sad),
                                                         image: MoodCorrelation.getImage(.sad)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.lowEnergy),
                                                         image: MoodCorrelation.getImage(.lowEnergy)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.apathetic),
                                                         image: MoodCorrelation.getImage(.apathetic)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.confused),
                                                         image: MoodCorrelation.getImage(.confused)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.verySelfCritical),
                                                         image: MoodCorrelation.getImage(.verySelfCritical)),
                                        SelectionElement(selectionName: MoodCorrelation.getText(.emotional),
                                                         image: MoodCorrelation.getImage(.emotional))]
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
