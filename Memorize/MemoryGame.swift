//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Andrea Russo on 11/13/23.
//
// This is the model for the Memory Game, handling the game logic

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    // Initialized a new memory game with a specific number of pairs of cards
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        
        // Populating the deck with a pair of cards
        for pairIndex in 0 ..< max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    // Function to choose a card
    func choose(_ card: Card){
        
    }
    
    // Method to shuffle the cards
    mutating func shuffle() {
        cards.shuffle()
    }
    // Definition of a single card in the memory game
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
