//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Andrea Russo on 11/3/23.
//
// This is the main entry point of the Memorize app. It sets up the EmojiMemoryGame and provides it to the EmojiMemoryGameView.

import SwiftUI

@main
struct MemorizeApp: App {
    // The main game object, observed by the main view
    @StateObject var game = EmojiMemoryGame()
    
    // The body of the app, defining its main scene
    var body: some Scene {
        WindowGroup {
            // The main view of the app, with the game object as its viewModel
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
