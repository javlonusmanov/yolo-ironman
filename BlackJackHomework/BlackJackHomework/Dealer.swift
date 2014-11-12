//
//  Dealer.swift
//  BlackJackHomework
//
//  Created by Javlon Usmanov on 9/30/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
class Dealer : Person {
    override init () {
        super.init()
    }
    func showCards (){
        for x in 0..<cards.count {
            cards[x].hidden = false
    }
}
}