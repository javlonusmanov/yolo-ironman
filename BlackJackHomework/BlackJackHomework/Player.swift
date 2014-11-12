//
//  Player.swift
//  BlackJackHomework
//
//  Created by Javlon Usmanov on 9/22/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
class Player: Person {
    var money: Double = 100;
    var bet: Double = 1
    override init () {
        super.init()
    }
    
    // setter and getter for bets
    var betAmount: Double {
        get { return self.bet }
        set(newValue) { self.bet = newValue }
    }
    
    //setter and getter for entering more money
    var maxAmount: Double {
        get { return self.money }
        set(newValue) { self.money -= newValue }
    }
    
    
}
