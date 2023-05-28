//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Allison on 2023-05-28.
//

/* Each turn of the game the app will randomly pick either rock, paper, or scissors.
 Each turn the app will alternate between prompting the player to win or lose.
 The player must then tap the correct move to win or lose the game.
 If they are correct they score a point; otherwise they lose a point.
 The game ends after 10 questions, at which point their score is shown.*/


import SwiftUI

struct ContentView: View {
    
    let arr2 = ["🪨", "📄", "✂️"]
    @State var play = 0
    @State var win = true
    @State var currentScore = 0
    @State var turn = 1
    @State var gameOver = false
    
    var body: some View {
        
        VStack {
            Spacer()
            Spacer()
            
            Text(arr2[play])
                .font(.system(size: 150))
            Text(win ? "You want to win" : "You want to lose")
                .font(.title)
            
            Spacer()
            
            HStack {
                ForEach(0..<3) { number in
                    Button {
                        if playMade(number) {
                            currentScore += 1
                        }
                        newQ()
                        
                    } label: {
                        Text(arr2[number])
                            .font(.system(size: 80))
                    }
                }
            }
            
            Text("Current score: \(currentScore)")
                .font(.title3)
                .padding(3)
            
            Text("Question \(turn)/10")
            
            Spacer()
            Spacer()
        }
        .alert("Game over", isPresented: $gameOver) {
            Button("New game", action: reset)
        } message: {
            Text("Your final score is \(currentScore)")
        }
    }
    
    func playMade(_ n: Int) -> Bool {
        if n == play {
            return false
        } else if play == 0 && n == 1 {
            return win
        } else if play == 0 && n == 2 {
            return !win
        } else if play == 1 && n == 0 {
            return !win
        } else if play == 1 && n == 2 {
            return win
        } else if play == 2 && n == 0 {
            return win
        } else if play == 2 && n == 1 {
            return !win
        }
    
        return false
    }
    
    func newQ() {
        if turn == 10 {
            gameOver.toggle()
            return
        }
        
        turn += 1
        play = Int.random(in: 0..<3)
        win = Bool.random()
    }
    
    func reset() {
        currentScore = 0
        turn = 0
        newQ()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
