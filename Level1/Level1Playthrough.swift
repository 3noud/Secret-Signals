//
//  Level1Playthrough.swift
//  SecretSignals
//
//  Created by AlAnoud on 21/11/2024.
//

import SwiftUI

struct Level1Playthrough: View {
    @State private var shuffledMessages: [(String, Bool)] = [] // Stores shuffled messages and their type (true for good, false for bad)
    @State private var currentMessageIndex: Int = 0 // Tracks the current message
    @State private var score: Int = 0 // Tracks the player's score
    @State private var remainingChances: Int = 3 // Tracks remaining chances
    @State private var feedbackMessage: String = "" // Feedback for the user
    @State private var currentEchoImage: String = "EchoNeutral" // Echo image state
    @State private var mistakeIcons: [String] = ["WaitMistake", "WaitMistake", "WaitMistake"] // Mistake icon tracking
    @State private var navigateToLevel1Complete: Bool = false // Tracks navigation to Level1Complete

    @Environment(\.presentationMode) var presentationMode // For navigating between screens

    init() {
        // Shuffle messages at initialization
        _shuffledMessages = State(initialValue: (GameData.Level1goodMessages.map { ($0, true) } + GameData.Level1badMessages.map { ($0, false) }).shuffled())
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Gameplay Background
                Image("LevelsBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                // Echo Image
                Image(currentEchoImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 441.56, height: 488)
                    .position(x: 1000, y: 400)

                // Feedback Message Box
                if !feedbackMessage.isEmpty {
                    Text(feedbackMessage)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 300, height: 80)
                        .background(Color.white)
                        .cornerRadius(10)
                        .position(x: 1000, y: 140)
                }

                // Current Gameplay Message
                Text(currentMessageIndex < shuffledMessages.count
                     ? shuffledMessages[currentMessageIndex].0
                     : "")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 562, height: 255)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(10)
                    .position(x: 400, y: 250)

                // Response Buttons
                HStack(spacing: 20) {
                    Button(action: {
                        handleResponse(isAck: true)
                    }) {
                        Text("ACK")
                            .font(.system(size: 32))
                            .foregroundColor(Color("TextColor"))
                            .padding()
                            .frame(width: 593, height: 129)
                            .background(Color("Brown"))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }

                    Button(action: {
                        handleResponse(isAck: false)
                    }) {
                        Text("NAK")
                            .font(.system(size: 32))
                            .foregroundColor(Color("TextColor"))
                            .padding()
                            .frame(width: 593, height: 129)
                            .background(Color("Brown"))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .position(x: 700, y: 850)

                // Mistake Icons
                HStack(spacing: 20) {
                    ForEach(mistakeIcons, id: \.self) { icon in
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 109, height: 101)
                    }
                }
                .position(x: 220, y: 700)
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $navigateToLevel1Complete) {
                Level1Complete() // Navigate to Level1Complete
            }
        }
    }

    func handleResponse(isAck: Bool) {
        guard currentMessageIndex < shuffledMessages.count else { return }

        let isGoodMessage = shuffledMessages[currentMessageIndex].1

        if (isAck && isGoodMessage) || (!isAck && !isGoodMessage) {
            // Correct response
            score += 1
            feedbackMessage = "Correct!"
            currentEchoImage = "EchoWin" // Change Echo to win state
        } else {
            // Incorrect response
            remainingChances -= 1
            feedbackMessage = "Wrong!"
            currentEchoImage = "EchoLose" // Change Echo to lose state

            // Update mistake icons
            if remainingChances < 3 {
                mistakeIcons[3 - remainingChances - 1] = "MistakeIcon"
            }

            // Check for game over
            if remainingChances == 0 {
                Level1FailedScreen()
            }
        }

        // Proceed to the next message or handle level completion
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            feedbackMessage = ""
            currentEchoImage = "EchoNeutral"
            if currentMessageIndex < shuffledMessages.count - 1 {
                currentMessageIndex += 1
            } else if remainingChances > 0 {
                // All messages completed successfully
                navigateToLevel1Complete = true // Trigger navigation to Level1Complete
            }
        }
    }
}

#Preview {
    Level1Playthrough()
}
