//
//  ContentView.swift
//  Memorize
//
//  Created by Andrea Russo on 11/3/23.
//
import SwiftUI
#Preview {
    ContentView()
}
struct ContentView: View {
    let emojis:Array<String> = ["💀","👻","🎃","🧙‍♀️","😵","🦷","🥸","🫥","🫨","😈","👿","👹"]
    @State var cardCount:  Int = 8
    var body: some View {
        VStack{
            title
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    var title: some View{
        Text("Memorize!").font(.largeTitle)
    }
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.fill.badge.minus")
    }
    var cardAdder: some View {
        cardCountAdjuster(by:1, symbol: "rectangle.fill.badge.plus")
    }
}
 
struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1:0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
