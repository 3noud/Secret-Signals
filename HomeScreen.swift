//
//  HomeScreen.swift
//  SecretSignals
//
//  Created by AlAnoud on 21/11/2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("Background1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    // Title Image
                    Image("Title1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 932)
                    
                    // Buttons
                    VStack(spacing: 20) {
                        // Start Button Image
                        NavigationLink(destination: LevelsScreen()) { // Navigate to Levels Page
                            Image("StartButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 593)
                        }
                        
                        // Quit Button Image
                        Button(action: {
                            exit(0) // Exit the app
                        }) {
                            Image("QuitButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 593)
                        }
                    }
                }
            }
            .onAppear {
                SoundManager.shared.playSound(named: "HomePageMusic") // Play music when HomeScreen appears
            }
            .onDisappear {
                // Do nothing here to allow music to continue playing in LevelsScreen
            }
            .navigationBarHidden(true) // Hide navigation bar including the back button
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensure consistent navigation behavior
    }
}

#Preview {
    HomeScreen()
}
