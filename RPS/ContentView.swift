import SwiftUI

struct ContentView: View {
        @State private var choices = ["🪨","📃","✂️"]
        @State private var playerChoice: String? = nil
        @State private var computerChoice: String? = nil
        @State private var score = 0

    func gameLogic() {
        if playerChoice == computerChoice {
            return
        } else if score == 10 || score == -10 {
         score = 0
        }

        switch (playerChoice, computerChoice) {
        case ("🪨", "✂️"), ("📃", "🪨"), ("✂️", "📃"):
            score += 1
        default:
            score -= 1
        }
    }

        var body: some View {
            VStack {
                Text("Score: \(score)")
                Text("Rock, Paper, Scissors")
                    .font(.title)
                    .bold()

                HStack {
                    ForEach(choices, id: \.self) { choice in
                        Button(action: {

                            playerChoice = choice
                            computerChoice = choices.randomElement()
                            gameLogic()
                        }) {
                            Text(choice)
                                .font(.system(size: 50))
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                Text("\"First to score 10 wins the game\"")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding()
                if let playerChoice = playerChoice {
                    Text("User: \(playerChoice)")
                        .font(.title)
                        .padding(.top)
                }
                    if let computerChoice = computerChoice {
                        Text("Computer: \(computerChoice)")
                            .font(.title)
                    }
            }

            .padding()
        }
    }
