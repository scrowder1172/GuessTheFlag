//
//  ExampleGradients.swift
//  GuessTheFlag
//
//  Created by SCOTT CROWDER on 10/16/23.
//

import SwiftUI

struct ExampleGradients: View {
    var body: some View {
        VStack {
//            LinearGradientExample()
//            ExampleStopGradients()
//            RadialGradientExample()
//            AngularGradientExample()
            ColorGradientExample()
        }
    }
}

struct LinearGradientExample: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
            Text("LinearGradient")
                .background(.green)
        }
    }
}

struct ExampleStopGradients: View {
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                Gradient.Stop(color: .white, location: 0.45),
                .init(color: .black, location: 0.55)
            ], startPoint: .top, endPoint: .bottom)
            Text("LinearGradient with Stops")
                .background(.green)
        }
    }
}

struct RadialGradientExample: View {
    var body: some View {
        ZStack {
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            Text("RadialGradient of Blue and Black")
                .background(.green)
        }
    }
}

struct AngularGradientExample: View {
    var body: some View {
        ZStack {
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            Text("AngularGradient with multiple colors")
                .background(.green)
        }
    }
}

struct ColorGradientExample: View {
    var body: some View {
        ZStack {
            Text("The background color on this text has a slight gradient")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.red.gradient)
        }
    }
}

#Preview {
    ExampleGradients()
}
