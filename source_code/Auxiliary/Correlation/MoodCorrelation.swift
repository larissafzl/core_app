//
//  MoodCorrelation.swift
//  core_app
//
//  Created by Clissia Bozzer Bovi on 04/04/24.
//

import Assets
import BackendLib
import Foundation
import SwiftUI

enum MoodCorrelation {
    static func getText(_ mood: MoodType) -> String {
        switch mood {
        case .calm:
            return Mood.calm.rawValue
        case .happy:
            return Mood.happy.rawValue
        case .energetic:
            return Mood.energetic.rawValue
        case .sleepy:
            return Mood.sleepy.rawValue
        case .irritated:
            return Mood.irritated.rawValue
        case .anxious:
            return Mood.anxious.rawValue
        case .sad:
            return Mood.sad.rawValue
        case .lowEnergy:
            return Mood.lowEnergy.rawValue
        case .apathetic:
            return Mood.apathetic.rawValue
        case .confused:
            return Mood.confused.rawValue
        case .verySelfCritical:
            return Mood.verySelfCritical.rawValue
        case .emotional:
            return Mood.emotional.rawValue
        }
    }

    static func getMoodType(_ text: String) -> MoodType {
        let mood = Mood(rawValue: text)
        switch mood {
        case .calm:
            return MoodType.calm
        case .happy:
            return MoodType.happy
        case .energetic:
            return MoodType.energetic
        case .sleepy:
            return MoodType.sleepy
        case .irritated:
            return MoodType.irritated
        case .anxious:
            return MoodType.anxious
        case .sad:
            return MoodType.sad
        case .lowEnergy:
            return MoodType.lowEnergy
        case .apathetic:
            return MoodType.apathetic
        case .confused:
            return MoodType.confused
        case .verySelfCritical:
            return MoodType.verySelfCritical
        case .emotional:
            return MoodType.emotional
        case nil:
            return MoodType.calm
        }
    }

    static func getImage(_ mood: MoodType) -> Image {
        switch mood {
        case .calm:
            return Images.moodCalm.swiftUIImage
        case .happy:
            return Images.moodHappy.swiftUIImage
        case .energetic:
            return Images.moodEnergetic.swiftUIImage
        case .sleepy:
            return Images.moodTired.swiftUIImage
        case .irritated:
            return Images.moodIrritated.swiftUIImage
        case .anxious:
            return Images.moodAnxious.swiftUIImage
        case .sad:
            return Images.moodSad.swiftUIImage
        case .lowEnergy:
            // deletar
            return Images.symptomAcne.swiftUIImage
        case .apathetic:
            return Images.moodApathetic.swiftUIImage
        case .confused:
            return Images.moodConfused.swiftUIImage
        case .verySelfCritical:
            return Images.moodSelfcritical.swiftUIImage
        case .emotional:
            return Images.moodEmotional.swiftUIImage
        }
    }
}
