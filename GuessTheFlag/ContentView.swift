//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Remitbee on 04/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var alertScoreTitle = ""
    @State private var alertScoreMessage = ""
    @State private var questionCount = 0
    @State private var isGameOverAlert = false
//    @State private var isGame

    
    @State private var score = 0

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag: \(questionCount)/8")
                //Tip: Asking for bold fonts is so common there’s actually a small shortcut: .font(.largeTitle.bold()).
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
//                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(alertScoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(alertScoreMessage)
        }
        .alert("Game Over", isPresented: $isGameOverAlert){
            Button("Restart", action: reset)
        } message: {
            Text("You scored \(score) out of 8")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number  == correctAnswer {
            alertScoreTitle = "Correct"
            score += 1
            questionCount += 1
            alertScoreMessage = "Your score is \(score)"
        
        } else {
            alertScoreTitle = "Wrong"
            questionCount += 1
            alertScoreMessage = "Wrong! That’s the flag of \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        if questionCount == 8 {
            isGameOverAlert = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
    
    func reset() {
        questionCount = 0
        score = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        showingScore = false
        alertScoreTitle = ""
        alertScoreMessage = ""
        isGameOverAlert = false
    //    @State private var isGame

        
    }
}

#Preview {
    ContentView()
}
