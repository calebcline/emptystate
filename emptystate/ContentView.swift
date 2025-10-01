//
//  ContentView.swift
//  emptystate
//
//  Created by Caleb Cline on 8/23/25.
//

import SwiftUI

struct EmptyState: Identifiable {
    let id = UUID()
    let systemImage: String
    let description: String
    let buttonTitle: String
}

struct ContentView: View {
   let phases: [EmptyState] = [
        .init(systemImage: "moonphase.new.moon", description: "Empty.", buttonTitle: "Next"),
        .init(systemImage: "moonphase.waxing.crescent", description: "Still empty..", buttonTitle: "Next"),
        .init(systemImage: "moonphase.first.quarter", description: "Still empty...", buttonTitle: "Next"),
        .init(systemImage: "moonphase.waxing.gibbous", description: "Empty still....", buttonTitle: "Next"),
        .init(systemImage: "moonphase.full.moon", description: "Very empty.....", buttonTitle: "Return to the beginning")
    ]
    
    @State private var currentPhase = 0
    
    var body: some View {
        VStack {
            let step = phases[currentPhase]
            
            ContentUnavailableView(
                "Empty State",
                systemImage: step.systemImage,
                description: Text(step.description)
            )
            Button(step.buttonTitle) {
                withAnimation {
                    currentPhase = currentPhase < phases.count - 1 ? currentPhase + 1 : 0
                }
            }
         }
        .toolbar(.hidden, for: .navigationBar)
        .animation(.default, value: currentPhase)
    }
}

#Preview {
    ContentView()
}
