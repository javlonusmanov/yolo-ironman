//
//  Person.swift
//  BlackJackHomework
//
//  Created by Javlon Usmanov on 9/30/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
class Person {
    var stood: Bool = false
    var cards: [Card] = []
    init () {
        
    }
    //shows the sum of the cards each player has
    func handSum () -> (intScore: Int, strScore:String){
        var sum = 0
        for card in cards {
            if (card.hidden) {sum += 0}
            else {sum += card.rank.values.first}
        }
        return (sum, "\(sum)")
    }
    
    //displays the list of cards each player has
    func showHand() -> String{
        var sumLine = ""
        for card in cards {
            if (card.hidden) {
                sumLine += "Hidden Card \n"
            } else {
                sumLine += card.description
                sumLine += "\n"
            }
        }
        return sumLine
    }
    // hit function
    func hit (card: Card) {
        cards.append(card)
    }
    
    //stand function
    func stand () {
        handSum()}
}