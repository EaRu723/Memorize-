//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrea Russo on 11/13/23.
//
// ViewModel for the Emoji Memory Game. It manages the game logic and state

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    // Array of emojis used in the game
    private static let emojis = ["💀","👻","🎃","🧙‍♀️","😵","🦷","🥸","🫥","🫨","😈","👽","👹"]
    
    // Factory method to create a new memory game
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) {pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "error"
            }
        }
    }
    // The memory game model, marked as published to update views on the change
    @Published  private var model =  createMemoryGame()
    
    // Computed property to access the cards in the model
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    // Method to shuffle the cards
    func shuffle(){
        model.shuffle()
    }
    
    // Method to choose a card
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
