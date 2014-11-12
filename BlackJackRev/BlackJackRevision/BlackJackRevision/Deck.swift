//
//  Deck.swift
//  BlackJackRevision
//
//  Created by Javlon Usmanov on 10/7/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
import UIKit
class Deck {
    var cards:[Card] = []
    
    //creating a deck with values and cards attached to them
    func createDeck() {
        let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
        let suits = [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs]
        for ndxS in 0..<suits.count {
            for ndxR in 0..<ranks.count {
                var imageFileName:UIImage = UIImage(named: "\(ranks[ndxR].simpleDescription())_of_\(suits[ndxS].simpleDescription()).jpg")
                //NSLog("\(ranks[ndxR].simpleDescription())_of_\(suits[ndxS].simpleDescription()).jpg")
                cards.append(Card(rank: ranks[ndxR], suit: suits[ndxS], imageFile: imageFileName))
            }
        }
    }
    
    //getting card and returning one
    func drawCard() -> Card?{
        var randomNumberOne = Int(arc4random_uniform(UInt32(cards.count)))
        var aCard = cards[randomNumberOne]
        cards.removeAtIndex(randomNumberOne)
        return aCard
    }
    //after 5 tries deck should be shuffled
    func shuffle() {
        var deckSize = cards.count
        for i in 0..<deckSize {
            var randomNumber = Int(arc4random_uniform(UInt32(deckSize-i)))
            var temp = cards[i]
            cards[i] = cards[randomNumber]
            cards[randomNumber] = temp
        }
    }
    
}