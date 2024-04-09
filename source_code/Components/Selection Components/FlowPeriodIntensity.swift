//
//  FlowPeriodIntensity.swift
//  core_app
//
//  Created by Pamella Alvarenga on 05/04/24.
//

import Assets
import SwiftUI

struct FlowPeriodIntensity: View {
    @State private var selectedFlow: FlowIntensity?

    enum FlowIntensity {
        case intense
        case medium
        case light
        case veryLight
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Qual a intensidade do seu fluxo hoje?")
                .frame(maxWidth: .infinity, alignment: .leading) // Ajusta o texto
                .foregroundColor(Colors.gray_900)

            HStack(spacing: 20) {
                VStack(spacing: 8) {
                    libidoButton(flow: .veryLight)
                    Text("Very Light")
                        .foregroundColor(Colors.gray_900)
                }
                VStack(spacing: 8) {
                    libidoButton(flow: .light)
                    Text("Light")
                        .foregroundColor(Colors.gray_900)
                }
                VStack(spacing: 8) {
                    libidoButton(flow: .medium)
                    Text("Moderate")
                        .foregroundColor(Colors.gray_900)
                }
                VStack(spacing: 8) {
                    libidoButton(flow: .intense)
                    Text("Intense")
                        .foregroundColor(Colors.gray_900)
                }
            }
        }
        .padding(.leading, 20)
        .frame(width: 340, height: 155)
        .background(Color.white) // Define o fundo do HStack como branco
        .cornerRadius(10.0)
    }

    func libidoButton(flow: FlowIntensity) -> some View {
        let isSelected = selectedFlow == flow

        let notSelectedImage: Image
        let selectedImage: Image

        switch flow {
        case .veryLight:
            notSelectedImage = Images.flowVeryLightNotSelected.swiftUIImage
            selectedImage = Images.flowVeryLightSelected.swiftUIImage

        case .light:
            notSelectedImage = Images.flowLightNotSelected.swiftUIImage
            selectedImage = Images.flowLightSelected.swiftUIImage

        case .medium:
            notSelectedImage = Images.flowModerateNotSelected.swiftUIImage
            selectedImage = Images.flowModerateSelected.swiftUIImage

        case .intense:
            notSelectedImage = Images.flowIntenseNotSelected.swiftUIImage
            selectedImage = Images.flowIntenseSelected.swiftUIImage
        }

        return Button(action: {
            self.selectedFlow = isSelected ? nil : flow
        }) {
            if isSelected {
                selectedImage

            } else {
                notSelectedImage
            }
        }
    }
}

#Preview {
    FlowPeriodIntensity()
}
