//
//  ExampleButtonsAndImages.swift
//  GuessTheFlag
//
//  Created by SCOTT CROWDER on 10/16/23.
//

import SwiftUI

struct ExampleButtonsAndImages: View {
    var body: some View {
        VStack {
            ButtonExample()
        }
    }
}

struct ButtonExample: View {
    var body: some View {
        VStack {
            Button("Delete Selection") {
                print("Delete button clicked")
            }
            .padding(20)
            
            Button("Say Hello!", action: sayHello)
                .buttonStyle(.bordered)
                .tint(.mint)
                .padding(20)
            
            Button("Destructive Button", role: .destructive, action: sayHello)
                .buttonStyle(.borderedProminent)
            
            HStack {
                Button("Button 1") {}
                Button("Button 2", role: .cancel) {}
                    .buttonStyle(.bordered)
            }
            
            Button {
                print("Custom label button was tapped")
            } label: {
                Text("Customized Button Label")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            Button {
                print("Estonia")
            } label: {
                Image("Estonia")
            }
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundColor(.white)
                    .background(.brown)
            }
        }
    }
    
    func sayHello() {
        print("hello!")
    }
}



#Preview {
    ExampleButtonsAndImages()
}
