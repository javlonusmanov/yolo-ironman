//
//  Dealer.swift
//  BlackJackRevision
//
//  Created by Javlon Usmanov on 10/7/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//
import UIKit
import Foundation
class Dealer : Person {
    var hiddenCard:Card?
    
    //constructor
    override init (name:String = "Dealer") {
        super.init(name: name)
    }
    
    //this is a dealer specific function, unhiding cards dealer has
    func unhide() -> Card? {
        cards[0].image = hiddenCard?.image
        hiddenCard?.image = UIImage(named: "979a46ed6000168e916a6ef1230c9afb_large.jpg")
        return cards[0]
    }
    
    //this function behaves differently for dealer
    func checkScore(type:String) -> (intScore: Int, strScore: String) {
        if (type == "hidden") {
            var intScore:Int = 0
            for ndx in cards {intScore += ndx.rank.values.first}
            intScore = intScore - cards[0].rank.values.first
            var strScore:String = "\(intScore)"
            return (intScore, strScore) }
        else {
            var intScore:Int = 0
            for ndx in cards {intScore += ndx.rank.values.first}
            var strScore:String = "\(intScore)"
            return (intScore, strScore)
        }
    }
}

