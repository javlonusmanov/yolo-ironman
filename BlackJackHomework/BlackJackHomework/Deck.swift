//
//  Deck.swift
//  BlackJackHomework
//
//  Created by Javlon Usmanov on 9/22/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
class Deck {
    var cardDeck: [Card] = [];
    var current:Bool = false;
    func createDeck() {
        let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
        let suits = [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs]
        for suit in suits {
            for rank in ranks {
                cardDeck.append(Card(rank: rank, suit: suit))
            }
        }

    func shuffle() {
        var deckSize = cardDeck.count
        for i in 0..<deckSize {
            var randomNumber = Int(arc4random_uniform(UInt32(deckSize-i)))
            var temp = cardDeck[i]
            cardDeck[i] = cardDeck[randomNumber]
            cardDeck[randomNumber] = temp
        }
    }
    
}
}

