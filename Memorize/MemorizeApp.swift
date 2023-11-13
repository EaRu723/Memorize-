//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Andrea Russo on 11/3/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(ViewModel: game)
        }
    }
}
