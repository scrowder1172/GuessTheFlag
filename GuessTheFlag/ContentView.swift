//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by SCOTT CROWDER on 10/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain",
                               "UK", "Ukraine", "US"]
        .shuffled()
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe white, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner."
    ]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var endGame: Bool = false
    
    @State private var questionsAsked: Int = 0
    @State private var questionsCorrect: Int = 0
    
    @State private var selectedFlag: Int = -1
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.white)
                
                Spacer()
                
                VStack (spacing: 15) {
                    
                    VStack {
                        Text("Find the flag for...")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .accessibilityElement()
                    .accessibilityLabel("Find the flag for: \(countries[correctAnswer])")
                    
                    ForEach(0..<3) { flagButtonNumber in
                        Button {
                            withAnimation {
                                flagTapped(flagButtonNumber)
                            }
                        } label: {
                            FlagImage(image: countries[flagButtonNumber])
                        }
                        .rotation3DEffect(.degrees(selectedFlag == flagButtonNumber ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(selectedFlag == -1 || selectedFlag == flagButtonNumber ? 1 : 0.25)
                        .scaleEffect(selectedFlag == -1 || selectedFlag == flagButtonNumber ? 1 : 0.25)
                        .accessibilityLabel(labels[countries[flagButtonNumber], default: "Unknown flag"])
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                
                Text("Score: \(questionsCorrect) / \(questionsAsked)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(questionsCorrect) / \(questionsAsked)")
        }
        .alert("End of Game", isPresented: $endGame) {
            Button("Restart") {
                questionsAsked = 0
                questionsCorrect = 0
                askQuestion()
            }
        } message: {
            Text("Good job playing! Your final score is: \(questionsCorrect) / \(questionsAsked)")
        }
        
        
    }
    
    func flagTapped(_ number: Int) {
        print("\n***\nButton #\(number) was pressed. Correct answer is: \(correctAnswer)")
        
        questionsAsked += 1
        selectedFlag = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            print("You guessed correctly!")
            questionsCorrect += 1
        } else {
            scoreTitle = "Wrong"
            print("You chose poorly!")
        }
        
        if questionsAsked < 8 {
            showingScore = true
        } else {
            endGame = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedFlag = -1
    }
}

struct FlagImage: View {
    var image: String
    var body: some View {
        Image(image)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}


