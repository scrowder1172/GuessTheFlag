//
//  ExampleColor.swift
//  GuessTheFlag
//
//  Created by SCOTT CROWDER on 10/16/23.
//

import SwiftUI

struct ExampleColor: View {
    var body: some View {
        VStack {
            Color.red
                .frame(width: 200, height: 200)
            Color.black
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            Color.primary
            Color.secondary
            VStack {
                Text("red: 0.9, green: 0.3, blue: 0.25")
            }
            .background(Color(red: 0.9, green: 0.3, blue: 0.25))
        }
    }
}

struct IgnoreSafeArea: View {
    var body: some View {
        ZStack {
            Color.blue
            Text("This ignores the safe area")
        }
        .ignoresSafeArea()
    }
}

struct MaterialsColor: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }

            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    // ExampleColor()
    IgnoreSafeArea()
    // MaterialsColor()
}
