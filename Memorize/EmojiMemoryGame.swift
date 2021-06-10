//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Christoph on 03.06.21.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    static let halloween = Theme(themeName: "Halloween", emojis:["🎃","👻","🕸","🕷","☠️","🧛‍♂️"] ,numberOfPairOfCards: 5 , Color: "orange")
    static let vehicles = Theme(themeName: "Vehicles", emojis:["🚗","🚕","🏎","✈️","🚜","🛶","🚡","🦼","🚛","🚁","🚤","🛸","🚲","🛵","🛴","🛰","🚂","🛺","🚀","🚑","🚐","🛻"] ,numberOfPairOfCards: 6 , Color: "blue")
    static let faces = Theme(themeName: "Faces", emojis:["😂","😀","😇","🥸","🤯","🤓","🤥","🥵","🧐","🤪"] ,numberOfPairOfCards: 8 , Color: "pink")
    
    static let flags = Theme(themeName: "Flags", emojis:["🇧🇪","🇦🇷","🇫🇷","🇩🇪","🇭🇷","🇬🇵","🇪🇸","🇻🇳","🏁","🇪🇬","🇲🇾","🇸🇬","🇺🇸","🇬🇧","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🏴󠁧󠁢󠁷󠁬󠁳󠁿"] ,numberOfPairOfCards: nil , Color: "green")
    
    static let sports = Theme(themeName: "Sports", emojis:["⚽️","🏀","🏈","⚾️","🥎","🎾","🏓","🏹","🪃","⛳️","🛼","🛹","🚴‍♀️","🚣‍♀️"] ,numberOfPairOfCards: 11 , Color: "purple")
   
    static let animals = Theme(themeName: "Animals", emojis:["🐶","🦊","🐷","🐵","🐦","🐣","🦆","🐝","🐞","🐛","🐌","🐴","🐢","🦂","🦧","🐊","🦈"] ,numberOfPairOfCards: 12 , Color: "blue")
    
    static let food = Theme(themeName: "Food", emojis:["🍎","🍓","🍉","🍆","🥑","🥐","🥩","🍟","🍔","🌭","🍕","🍗","🍳","🌯","🍦","🍰","🍩","🍪"] ,numberOfPairOfCards: 9 , Color: "gray")
    
    // TODO: add 4 more themes

    static let themes = [halloween, vehicles, faces, flags, sports, animals, food]

    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let shuffeldEmojis = theme.emojis.shuffled()
        var numberOfPairOfCards = theme.emojis.count
        
        if let safeNumberOfPairOfCards = theme.numberOfPairOfCards {
            numberOfPairOfCards = safeNumberOfPairOfCards > numberOfPairOfCards ? numberOfPairOfCards : safeNumberOfPairOfCards
        }
        else {
            numberOfPairOfCards = Int.random(in: 1 ..< theme.emojis.count)
        }
        
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairOfCards) { pairIndex in
            shuffeldEmojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    
    var theme: Theme
    
    // Access to the MemoryGame model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // Access to the Theme model
    
    var themeColor: Color {
        switch theme.Color {
            case "orange": return Color.orange
            case "red": return Color.red
            case "blue": return Color.blue
            case "yellow": return Color.yellow
            case "green": return Color.green
            case "pink": return Color.pink
            case "purple": return Color.purple
            case "gray": return Color.gray
        default:
            return Color.red
        }
    }
    
    var themeName: String {
        theme.themeName
    }
    
    init(){
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    
    // MARK: - intend(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
