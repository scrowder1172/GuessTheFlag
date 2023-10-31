//
//  ExampleAlerts.swift
//  GuessTheFlag
//
//  Created by SCOTT CROWDER on 10/16/23.
//

import SwiftUI

struct ExampleAlerts: View {
    @State private var showingAlert = false
    var body: some View {
        Button("Delete content") {
            showingAlert = true
        }
        .alert("WARNING: DESTRUCTIVE ACTION", isPresented: $showingAlert) {
            Button("Cancel", role: .cancel) {
                print("Safely canceled!")
            }
            Button("Proceed", role: .destructive) {
                print("Data has been deleted!")
            }
        } message: {
            Text("This is additional context around the actions you are performing")
        }
    }
}

#Preview {
    ExampleAlerts()
}
