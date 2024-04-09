//
//  MoodCorrelation.swift
//  core_app
//
//  Created by Clissia Bozzer Bovi on 04/04/24.
//

import BackendLib
import Foundation

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
}
