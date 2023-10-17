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
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var questionsAsked: Int = 0
    @State private var questionsCorrect: Int = 0
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack (spacing: 30) {
                
                VStack {
                    Text("Find the flag for...")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) {flagButtonNumber in
                    Button {
                        flagTapped(flagButtonNumber)
                    } label: {
                        Image(countries[flagButtonNumber])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(questionsCorrect) / \(questionsAsked)")
        }
        
    }
    
    func flagTapped(_ number: Int) {
        print("Button #\(number) was pressed. Correct answer is: \(correctAnswer)")
        if number == correctAnswer {
            scoreTitle = "Correct"
            print("You guessed correctly!")
            questionsCorrect += 1
        } else {
            scoreTitle = "Wrong"
            print("You chose poorly!")
        }
        
        showingScore = true
        questionsAsked += 1
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}


