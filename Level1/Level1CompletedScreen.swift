//
//  Level1CompletedScreen.swift
//  SecretSignals
//
//  Created by AlAnoud on 22/11/2024.
//

import SwiftUI

struct Level1CompletedScreen: View {
    @State private var navigateToLevel2: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToHome: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Image("Background1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 40) {
                    // Title
                    Text("Level 1 Completed!")
                        .font(.system(size: 100, weight: .bold))
                        .foregroundColor(Color("BabyBlue"))
                        .shadow(radius: 5)
                    
                    // Echo Image
                    Image("EchoWin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)

                    // Buttons
                    HStack(spacing: 20) {
                        // Exit Button
                        NavigationLink(destination: HomeScreen(), isActive: $navigateToHome) {
                            Button(action: {
                                navigateToHome = true
                            }) {
                                Text("Exit")
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 250, height: 100)
                                    .background(Color("Blue"))
                                    .cornerRadius(10)
                            }
                        }

                        // Next Level Button
                        NavigationLink(
                            destination: Level2Screen(),
                            isActive: $navigateToLevel2
                        ) {
                            Button(action: {
                                unlockLevel2() // Unlock Level 2 in LevelsScreen
                                navigateToLevel2 = true
                            }) {
                                Text("Next Level")
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 400, height: 100)
                                    .background(Color("Blue"))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func unlockLevel2() {
        UserDefaults.standard.set(2, forKey: "UnlockedLevels") // Unlock Level 2
    }
}

#Preview {
    Level1CompletedScreen()
}
