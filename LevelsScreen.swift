//
//  LevelsScreen.swift
//  SecretSignals
//
//  Created by AlAnoud on 21/11/2024.
//

import SwiftUI

struct LevelsScreen: View {
    @State private var unlockedLevels: Int = UserDefaults.standard.integer(forKey: "UnlockedLevels") // Tracks unlocked levels
    @State private var navigateToLevel1: Bool = false
    @State private var navigateToLevel2: Bool = false
    @State private var navigateToLevel3: Bool = false
    @Environment(\.presentationMode) var presentationMode // To allow navigation back to HomeScreen

    var body: some View {
        ZStack {
            Image("Background1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                // Back Button
                HStack {
                    Button(action: {
                        // Navigate back to HomeScreen
                        SoundManager.shared.stopSound() // Stop the HomePageMusic if needed
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left") // Back arrow icon
                            .font(.system(size: 24))
                            .foregroundColor(Color("White"))
                            .padding()
                            .background(Color("Blue"))
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 20) // Add some top padding for better spacing

                Spacer()

                // Level Cards
                HStack(spacing: 20) {
                    // Level 1 Card
                    NavigationLink(destination: Level1Screen(), isActive: $navigateToLevel1) {
                        EmptyView()
                    }.hidden()

                    Button(action: {
                        SoundManager.shared.stopSound() // Stop HomePageMusic
                        navigateToLevel1 = true
                    }) {
                        Image("Level1Card")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 424, height: 595)
                    }

                    // Level 2 Card
                    NavigationLink(destination: Level2Screen(), isActive: $navigateToLevel2) {
                        EmptyView()
                    }.hidden()

                    Button(action: {
                        if unlockedLevels >= 2 {
                            SoundManager.shared.stopSound() // Stop HomePageMusic
                            navigateToLevel2 = true
                        } else {
                            print("Level 2 is locked. Complete Level 1 first!")
                        }
                    }) {
                        Image(unlockedLevels >= 2 ? "Level2Card" : "Level2CardLocked")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 424, height: 595)
                    }
                    .disabled(unlockedLevels < 2)

                    // Level 3 Card
                    NavigationLink(destination: Level3Screen(), isActive: $navigateToLevel3) {
                        EmptyView()
                    }.hidden()

                    Button(action: {
                        if unlockedLevels >= 3 {
                            SoundManager.shared.stopSound() // Stop HomePageMusic
                            navigateToLevel3 = true
                        } else {
                            print("Level 3 is locked. Complete Level 2 first!")
                        }
                    }) {
                        Image(unlockedLevels >= 3 ? "Level3Card" : "Level3CardLocked")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 424, height: 595)
                    }
                    .disabled(unlockedLevels < 3)
                }
                .padding(.horizontal)
                .padding(.bottom)

                Spacer()
            }
        }
        .onAppear {
            unlockedLevels = UserDefaults.standard.integer(forKey: "UnlockedLevels") // Fetch unlocked levels

            // Ensure HomePageMusic continues if not stopped
            if !SoundManager.shared.isPlaying {
                SoundManager.shared.playSound(named: "HomePageMusic", loop: true)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    LevelsScreen()
}
