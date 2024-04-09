//
//  SelectionElement.swift
//  core_app
//
//  Created by Clissia Bozzer Bovi on 01/04/24.
//

import Foundation
import SwiftUI

struct SelectionElement: Equatable, Identifiable {
    var id = UUID()
    var selectionName: String
    var image: Image
    var didTap = false

    mutating func tap() {
        didTap.toggle()
    }
}
