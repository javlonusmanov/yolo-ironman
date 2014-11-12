//
//  Shoe.swift
//  BlackJackRevision
//
//  Created by Javlon Usmanov on 10/7/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation

class Shoe {
    var decks:[Deck] = []
    
    //constructor
    init (number:Int = 1) {
        for ndx in 0..<number {
            var tempDeck = Deck ()
            tempDeck.createDeck()
            decks.append(tempDeck)
        }
    }
    //adding a new deck to the Shoe
    func addDeck() {
        var newDeck:Deck = Deck()
        newDeck.createDeck()
        decks.append(newDeck)
    }
    
    //getting rid of all decks, used for new game
    func removeAllDeck() {
        decks.removeAll(keepCapacity: false);
    }
    
    func displayAll() {
        for x in 0..<decks.count {
            for i in 0..<decks[x].cards.count {
                NSLog("\(decks[x].cards[i].description)")
                
            }
        }
    }
    

}