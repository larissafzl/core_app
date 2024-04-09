//
//  SelectionElement.swift
//  core_app
//
//  Created by Clissia Bozzer Bovi on 01/04/24.
//

import Foundation

struct SelectionElement: Equatable, Hashable {
    var selectionName: String
    var didTap = false

    mutating func tap() {
        didTap.toggle()
    }
}
