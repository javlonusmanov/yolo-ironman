//
//  Person.swift
//  BlackJackRevision
//
//  Created by Javlon Usmanov on 10/7/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//
import UIKit
import Foundation
class Person {
    var playerName:String
    var score: Double = 0.0
    var cards:[Card] = []
    
    
    //constructor
    init (name: String) {
        self.playerName = name
    }
    
    //receives a card and gets added to cards arrays
    func addCard(card: Card) {
        cards.append(card);
    }
    
    //stand functions for each player
    func stand() {
        
    }
    
    //checking the score of each player
    func checkScore() -> (intScore: Int, strScore: String) {
        var intScore:Int = 0
        for ndx in cards {intScore += ndx.rank.values.first}
        var strScore:String = "\(intScore)"
        return (intScore, strScore)
    }
}
