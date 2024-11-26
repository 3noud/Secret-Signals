//
//  Level1Screen.swift
//  SecretSignals
//
//  Created by AlAnoud on 21/11/2024.
//

import SwiftUI

struct Level1Screen: View {
    @State private var dialogueIndex: Int = 0 // Tracks the current dialogue step
    @State private var navigateToPlaythrough: Bool = false // Navigation flag to Level1Playthrough

    var body: some View {
        NavigationView {
            ZStack {
                // Background for storytelling
                Image("ScenarioBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    // Pause Button
                    HStack {
                        Spacer()
                        Button(action: {
                            // Pause logic (if needed)
                        }) {
                            Image(systemName: "pause.fill")
                                .foregroundColor(Color("BabyBlue"))
                                .font(.system(size: 24))
                                .padding()
                                .background(Color("Blue"))
                                .cornerRadius(10)
                        }
                        .padding()
                    }

                    Spacer()

                    if !navigateToPlaythrough {
                        // Storytelling Section
                        ZStack {
                            // Echo Image
                            Image(dialogueIndex == 0 ? "EchoNeutral" : "EchoTalking")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 441.56, height: 488)
                                .position(x: 450, y: 260)

                            // Dialogue Box
                            Text(GameData.level1dialogues[dialogueIndex].0)
                                .font(.system(size: 24))
                                .padding()
                                .frame(width: 562, height: 255)
                                .background(Color("BabyBlue"))
                                .cornerRadius(10)
                                .position(x: 950, y: 202)
                        }

                        Spacer()

                        // Response Buttons
                        HStack(spacing: 20) {
                            ForEach(0..<GameData.level1dialogues[dialogueIndex].1.count, id: \.self) { index in
                                Button(action: {
                                    // Handle dialogue progression
                                    if dialogueIndex < GameData.level1dialogues.count - 1 {
                                        dialogueIndex += 1
                                    } else {
                                        // Trigger navigation
                                        navigateToPlaythrough = true
                                    }
                                }) {
                                    Text(GameData.level1dialogues[dialogueIndex].1[index])
                                        .font(.system(size: 32))
                                        .foregroundColor(Color("TextColor"))
                                        .padding()
                                        .frame(width: 593, height: 129)
                                        .background(Color("Brown"))
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                }
                            }
                        }
                        .position(x: 700, y: 300)
                    }
                }

                // NavigationLink to Level1Playthrough
                NavigationLink(destination: Level1Playthrough(), isActive: $navigateToPlaythrough) {
                    EmptyView() // Hidden NavigationLink
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensure proper navigation stack
    }
}

#Preview {
    Level1Screen()
}
