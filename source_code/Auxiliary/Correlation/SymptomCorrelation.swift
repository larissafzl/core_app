//
//  SymptomCorrelation.swift
//  core_app
//
//  Created by Clissia Bozzer Bovi on 04/04/24.
//

import Assets
import BackendLib
import Foundation
import SwiftUI

enum SymptomCorrelation {
    static func getText(_ symptom: SymptomType) -> String {
        switch symptom {
        case .sensitiveBreasts:
            return Symptons.sensitiveBreasts.rawValue
        case .cramp:
            return Symptons.cramp.rawValue
        case .headache:
            return Symptons.headache.rawValue
        case .fever:
            return Symptons.fever.rawValue
        case .backache:
            return Symptons.backache.rawValue
        case .acne:
            return Symptons.acne.rawValue
        case .tiredness:
            return Symptons.tiredness.rawValue
        case .veryHungry:
            return Symptons.veryHungry.rawValue
        case .notHungry:
            return Symptons.notHungry.rawValue
        case .nausea:
            return Symptons.nausea.rawValue
        case .insomnia:
            return Symptons.insomnia.rawValue
        }
    }

    static func getSymptomType(_ text: String) -> SymptomType {
        let symptons = Symptons(rawValue: text)
        switch symptons {
        case .sensitiveBreasts:
            return SymptomType.sensitiveBreasts
        case .cramp:
            return SymptomType.cramp
        case .headache:
            return SymptomType.headache
        case .fever:
            return SymptomType.fever
        case .backache:
            return SymptomType.backache
        case .acne:
            return SymptomType.acne
        case .tiredness:
            return SymptomType.tiredness
        case .veryHungry:
            return SymptomType.veryHungry
        case .notHungry:
            return SymptomType.notHungry
        case .nausea:
            return SymptomType.nausea
        case .insomnia:
            return SymptomType.insomnia
        case nil:
            return SymptomType.sensitiveBreasts
        }
    }

    static func getImage(_ symptom: SymptomType) -> Image {
        switch symptom {
        case .sensitiveBreasts:
            return Images.symptomTenderbreasts.swiftUIImage
        case .cramp:
            return Images.symptomCramps.swiftUIImage
        case .headache:
            return Images.symptomHeadache.swiftUIImage
        case .fever:
            return Images.symptomFever.swiftUIImage
        case .backache:
            return Images.symptomBackpain.swiftUIImage
        case .acne:
            return Images.symptomAcne.swiftUIImage
        case .tiredness:
            return Images.symptomTiredness.swiftUIImage
        case .veryHungry:
            return Images.symptomLargeappetite.swiftUIImage
        case .notHungry:
            return Images.symptomLackofappetite.swiftUIImage
        case .nausea:
            return Images.symptomNausea.swiftUIImage
        case .insomnia:
            return Images.symptomInsomnia.swiftUIImage
        }
    }
}
