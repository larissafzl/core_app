//
//  LibidoIntensityFrame.swift
//  core_app
//
//  Created by Pamella Alvarenga on 05/04/24.
//

import Assets
import SwiftUI

struct LibidoIntensityFrame: View {
    @State private var selectedLibido: LibidoIntensity?

    enum LibidoIntensity {
        case high
        case medium
        case low
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Qual seu nível de libido hoje?")
                .foregroundColor(Colors.purple_900)
                .frame(maxWidth: .infinity, alignment: .leading) // Ajusta o texto para ocupar toda largura

            HStack(spacing: 20) {
                VStack(spacing: 8) {
                    libidoButton(intensity: .low)
                    Text("Low")
                        .foregroundColor(Colors.gray_900)
                }
                VStack(spacing: 8) {
                    libidoButton(intensity: .medium)
                    Text("Moderate")
                        .foregroundColor(Colors.gray_900)
                }
                VStack(spacing: 8) {
                    libidoButton(intensity: .high)
                    Text("High")
                        .foregroundColor(Colors.gray_900)
                }
            }
        }
        .padding(.leading, 20)
        .frame(width: 356, height: 155)
        .background(Color.white) // Define o fundo do HStack como branco
        .cornerRadius(10.0)
    }

    func libidoButton(intensity: LibidoIntensity) -> some View {
        let isSelected = selectedLibido == intensity

        let notSelectedImage: Image
        let selectedImage: Image

        switch intensity {
        case .high:
            notSelectedImage = Images.libidoLowNotSelected.swiftUIImage
            selectedImage = Images.libidoLowSelected.swiftUIImage
        case .medium:
            notSelectedImage = Images.libidoModerateNotSelected.swiftUIImage
            selectedImage = Images.libidoModerateSelected.swiftUIImage
        case .low:
            notSelectedImage = Images.libidoHighNotSelected.swiftUIImage
            selectedImage = Images.libidoHighSelected.swiftUIImage
        }
        return Button(action: {
            self.selectedLibido = isSelected ? nil : intensity
        }) {
            if isSelected {
                selectedImage

            } else {
                notSelectedImage
            }
        }
    }
}
