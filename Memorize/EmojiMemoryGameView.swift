//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Andrea Russo on 11/3/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var ViewModel: EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Button("Shuffle"){
                ViewModel.shuffle()
            }
            .padding()
        }
        
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(ViewModel.cards.indices, id: \.self) {index in
                CardView(ViewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }

    struct CardView: View {
        let card: MemoryGame<String>.Card
        
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
        
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 3)
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                }
                .opacity(card.isFaceUp ? 1:0)
                base.fill()
                    .opacity(card.isFaceUp ? 0 : 1)
                
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    struct EmojiMemoryGameView_Previews: PreviewProvider {
        static var previews: some View{
            EmojiMemoryGameView()
        }
    }
    
}
