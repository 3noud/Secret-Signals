//
//  Level1Complete.swift
//  SecretSignals
//
//  Created by AlAnoud on 21/11/2024.
//

import SwiftUI

struct Level1Complete: View {
    @State private var dialogueIndex: Int = 0 // Tracks the current dialogue step
    @State private var showLevelComplete: Bool = false // Navigate to LevelCompleteScreen after this sequence

    var body: some View {
        ZStack {
            // Background
            Image("ScenarioBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                // Pause Button
                HStack {
                    Spacer()
                    Button(action: {
                        // Pause logic (if required)
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

                // Storytelling Section
                ZStack {
                    // Echo Image
                    Image(dialogueIndex == 0 ? "EchoNeutral" : "EchoLose")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 441.56, height: 488)
                        .position(x: 450, y: 260)

                    // Dialogue Box
                    if dialogueIndex == 0 {
                        // Glitched Message in Red Box
                        Text(GameData.level1CompleteDialogues[dialogueIndex].0)
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 562, height: 255)
                            .background(Color.red)
                            .cornerRadius(10)
                            .position(x: 950, y: 202)
                    } else {
                        // Normal Dialogue Box
                        Text(GameData.level1CompleteDialogues[dialogueIndex].0)
                            .font(.system(size: 24))
                            .padding()
                            .frame(width: 562, height: 255)
                            .background(Color("BabyBlue"))
                            .cornerRadius(10)
                            .position(x: 950, y: 202)
                    }
                }

                Spacer()

                // Response Buttons
                HStack(spacing: 20) {
                    ForEach(0..<GameData.level1CompleteDialogues[dialogueIndex].1.count, id: \.self) { index in
                        Button(action: {
                            // Handle dialogue progression
                            if dialogueIndex < GameData.level1CompleteDialogues.count - 1 {
                                dialogueIndex += 1
                            } else {
                                // Navigate to LevelCompleteScreen
                                showLevelComplete = true
                            }
                        }) {
                            Text(GameData.level1CompleteDialogues[dialogueIndex].1[index])
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
        .fullScreenCover(isPresented: $showLevelComplete) {
            Level1CompletedScreen()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    Level1Complete()
}
