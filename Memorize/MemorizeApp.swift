//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Christoph on 21.05.21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
