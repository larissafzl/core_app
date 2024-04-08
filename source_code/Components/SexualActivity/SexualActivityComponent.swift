//
//  SexualActivityComponent.swift
//  core_app
//
//  Created by Caio Melloni dos Santos on 08/04/24.
//

import Assets
import SwiftUI

struct SexualActivityComponent: View {
    @State private var isShowingPopover = false
    @State private var didHaveSex = false
    @State private var didUseCondom = false
    @ViewBuilder
    var body: some View {
        VStack {
            // Title
            HStack {
                Text("Sexual Activity")
                    .font(.title2)
                    .foregroundStyle(Colors.purple_700)
                Spacer()
            }

            // Icons
            HStack {
                if didHaveSex {
                    RoundedIcon(.sex)
                    Spacer().frame(width: 20)
                }
                if didUseCondom {
                    RoundedIcon(.protection)
                }
                Spacer()
            }

            // Button Section
            Divider().frame(height: 20)
            Button("Add Activity") {
                self.isShowingPopover = true
            }
            .buttonStyle(.plain)
            .popover(isPresented: $isShowingPopover) {
                SexualActivityPopOver(didHaveSex: $didHaveSex, didUseCondom: $didUseCondom)
                    .padding()
            }
        }
        .padding()
        .background(.white)
        .frame(maxWidth: 350)
        .clipShape(
            RoundedRectangle(
                cornerSize: CGSize(
                    width: 10,
                    height: 10
                ),
                style: .circular
            )
        )
    }
}

#Preview {
    VStack {
        Spacer()
        HStack {
            Spacer()
            SexualActivityComponent()
                .preferredColorScheme(.light)
            Spacer()
        }
        Spacer()
    }.background(.black)
}

enum ActivityType {
    case sex
    case protection
}

struct RoundedIcon: View {
    let type: ActivityType
    init(_ type: ActivityType) {
        self.type = type
    }
    var body: some View {
        VStack {
            Circle()
                .fill(
                    type == .sex ? Colors.red_200 : Colors.purple_300
                )
                .frame(width: 80, height: 80)
            Text("Sex")
        }
    }
}

struct SexualActivityPopOver: View {
    @Binding var didHaveSex: Bool
    @Binding var didUseCondom: Bool
    @State var didHaveSexToggle: Bool = false
    @State var didUseCondomToggle: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sexual activity")
            .foregroundStyle(Colors.purple_700)
            Text("Thursday, 14 March 2024")
                .font(.title3)
            Divider()
            Text("Did you have sex?").opacity(0.8)
            Toggle(isOn: $didHaveSexToggle) {}
                .toggleStyle(SwitchToggleStyle(tint: Colors.red_300))
            Divider()
            Text("Did you use a condom").opacity(0.8)
            Toggle(isOn: $didUseCondomToggle) {}
                .toggleStyle(SwitchToggleStyle(tint: Colors.purple_500))
            Divider()
            Button("Done") {
                didHaveSex = didHaveSexToggle
                didUseCondom = didUseCondomToggle
            }
            .buttonStyle(.borderedProminent)
            .tint(Colors.purple_300)
        }
    }
}
