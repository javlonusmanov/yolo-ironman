//
//  ViewController.swift
//  BlackJackRevision
//
//  Created by Javlon Usmanov on 10/7/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    var numDecks:Int!
    var numPlayers:Int!
    var blackjack:Game!
    
    //Misc UI elements
    var plOneImages:[UIImageView] = []
    var plTwoImages:[UIImageView] = []
    var plThreeImages:[UIImageView] = []
    var plFourImages:[UIImageView] = []
    var dealerImages:[UIImageView] = []
    var plImages:[[UIImageView]] = []
    var plScores:[UILabel] = []
    var plTurns:[UIImageView] = []
    var plBets:[UITextField] = []
    var plSums: [UILabel] = []
    
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    
    @IBOutlet weak var plOneSum: UILabel!
    @IBOutlet weak var plOneBet: UITextField!
    @IBOutlet weak var plTwoSum: UILabel!
    @IBOutlet weak var plTwoBet: UITextField!
    @IBOutlet weak var plThreeSum: UILabel!
    @IBOutlet weak var plThreeBet: UITextField!
    @IBOutlet weak var plFourSum: UILabel!
    @IBOutlet weak var plFourBet: UITextField!
    
    
    @IBOutlet weak var plOneTurn: UIImageView!
    @IBOutlet weak var plTwoTurn: UIImageView!
    @IBOutlet weak var plThreeTurn: UIImageView!
    @IBOutlet weak var plFourTurn: UIImageView!
    
    
    //player1 cards UIImages
    @IBOutlet weak var plOneImageOne: UIImageView!
    @IBOutlet weak var plOneImageTwo: UIImageView!
    @IBOutlet weak var plOneImageThree: UIImageView!
    @IBOutlet weak var plOneImageFour: UIImageView!
    @IBOutlet weak var plOneImageFive: UIImageView!
    @IBOutlet weak var plOneImageSix: UIImageView!
    @IBOutlet weak var plOneScore: UILabel!
    
    
    //player2 cards UIImages
    @IBOutlet weak var plTwoImageOne: UIImageView!
    @IBOutlet weak var plTwoImageTwo: UIImageView!
    @IBOutlet weak var plTwoImageThree: UIImageView!
    @IBOutlet weak var plTwoImageFour: UIImageView!
    @IBOutlet weak var plTwoImageFive: UIImageView!
    @IBOutlet weak var plTwoScore: UILabel!
    @IBOutlet weak var plTwoImageSix: UIImageView!
    
    //player3 cards UIImages
    @IBOutlet weak var plThreeImageOne: UIImageView!
    @IBOutlet weak var plThreeImageTwo: UIImageView!
    @IBOutlet weak var plThreeImageThree: UIImageView!
    @IBOutlet weak var plThreeImageFour: UIImageView!
    @IBOutlet weak var plThreeImageFive: UIImageView!
    @IBOutlet weak var plThreeImageSix: UIImageView!
    @IBOutlet weak var plThreeScore: UILabel!
    
    
    //player4 cards UIImages
    @IBOutlet weak var plFourImageOne: UIImageView!
    @IBOutlet weak var plFourImageTwo: UIImageView!
    @IBOutlet weak var plFourImageThree: UIImageView!
    @IBOutlet weak var plFourImageFour: UIImageView!
    @IBOutlet weak var plFourImageFive: UIImageView!
    @IBOutlet weak var plFourImageSix: UIImageView!
    @IBOutlet weak var plFourScore: UILabel!
    
    
    //dealer cards UIImages
    @IBOutlet weak var dealerImageOne: UIImageView!
    @IBOutlet weak var dealerImageTwo: UIImageView!
    @IBOutlet weak var dealerImageThree: UIImageView!
    @IBOutlet weak var dealerImageFour: UIImageView!
    @IBOutlet weak var dealerImageFive: UIImageView!
    @IBOutlet weak var dealerScore: UILabel!
    
    //hit function that calls players hit functions
    @IBAction func hit(sender: UIButton) {
        blackjack.hit(blackjack.currentPlayer)
        var temp:Int = blackjack.players[blackjack.currentPlayer].checkScore().intScore
        if ( temp > 21) {
            for x in 0..<blackjack.players[blackjack.currentPlayer].cards.count {plImages[blackjack.currentPlayer][x].alpha = 0.1}
            plTurns[blackjack.currentPlayer].hidden = true
            blackjack.stand(blackjack.currentPlayer)
        };getPlayerStats()
    }
    
    //stand function that calls players stand function
    @IBAction func stand(sender: UIButton) {
        plTurns[blackjack.currentPlayer].hidden = true
        blackjack.stand(blackjack.currentPlayer)
        getPlayerStats()
    }
    
    func refresh() {
        for i in 0..<blackjack.players.count {for x in 0..<blackjack.players[i].cards.count {
            plImages[i][x].image = blackjack.players[i].cards[x].image
            plScores[i].text = blackjack.players[i].checkScore().strScore}}
        for i in 0..<blackjack.dealer.cards.count {dealerImages[i].image = blackjack.dealer.cards[i].image}
    }
    
    //function will be called to get cards of each player and display them in each players UIImageView
    func getPlayerStats() {
      
        
        var stand:Int = 0
        refresh()
        dealerScore.text = blackjack.dealer.checkScore("hidden").strScore
        plTurns[blackjack.currentPlayer].hidden = false
        //if number of stands matches number players, that means dealer can go
        for i in 0..<blackjack.players.count {if (blackjack.players[i].stand == true) {stand = stand + 1}}
        
        //if all plays stood, code below gets executed
        if (stand == blackjack.players.count) {
            dealerImages[0].image = blackjack.dealer.unhide()?.image
            plTurns[blackjack.currentPlayer].hidden = true
            hitButton.hidden = true;standButton.hidden = true
            while (blackjack.dealer.checkScore("s").intScore < 16) {blackjack.dealer.addCard(blackjack.getCard(blackjack.currentDeck)!)}
            dealerScore.text = blackjack.dealer.checkScore("a").strScore
            for i in 0..<plImages.count {for x in 0..<plImages[i].count {plImages[i][x].alpha = 0.1} }
            for i in 0..<dealerImages.count {dealerImages[i].alpha = 0.1}
            for i in 0..<blackjack.players.count {plScores[i].text = checkScore(blackjack.players[i].checkScore().intScore, dealerScore: blackjack.dealer.checkScore("a").intScore)}
            newGame.hidden = false
        }
        plSums[blackjack.currentPlayer].text = "\(blackjack.players[blackjack.currentPlayer].amount)"
        var temp:Int = blackjack.players[blackjack.currentPlayer].amount - plBets[blackjack.currentPlayer].text.toInt()!
        plSums[blackjack.currentPlayer].text = "\(temp)"
    }
    
    //to start a new game, all arrays gets emptied out and will be reinitialized
    @IBOutlet weak var newGame: UIButton!
    @IBAction func newGame(sender: UIButton) {
        
        for i in 0..<blackjack.players.count {for x in 0..<blackjack.players[i].cards.count {plImages[i][x].image = nil}}
        for i in 0..<blackjack.dealer.cards.count {dealerImages[i].image = nil}
        dealerImages.removeAll(keepCapacity: false)
        plScores.removeAll(keepCapacity: false)
        plTurns.removeAll(keepCapacity: false)
        for x in blackjack.players {x.cards.removeAll(keepCapacity: false)}
        blackjack.players.removeAll(keepCapacity: false)
        blackjack.dealer.cards.removeAll(keepCapacity: false)
        viewDidLoad()
        for i in 0..<blackjack.players.count {for x in 0..<blackjack.players[i].cards.count {plImages[i][x].alpha = 1}}
        for i in 0..<blackjack.dealer.cards.count {dealerImages[i].alpha = 1}
        newGame.hidden = true
        hitButton.hidden = false
        standButton.hidden = false
        
    }
    
    
    //by passing in dealers score and players score, comparison will be done and output will be returned. returned value will be used to displays plays status
    func checkScore(playerScore:Int, dealerScore:Int) -> String {
        if playerScore > 21 {
            return ("Over 21, you lost!")
        }
        if dealerScore > 21  {
            return ("Dealer sucks, you won!")
        }
        if dealerScore == 21 && playerScore != 21 {
            return ("Dealer has BlackJack, you lost!")
        }
        if (playerScore == 21 && dealerScore != 21) {
            return ("BlackJack, you won!")
        }
        if (playerScore > dealerScore) {
            return ("You Won")
        }
        if dealerScore > playerScore {
            return ("House Won")
        }
        return ("Tie")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        plOneImages += [plOneImageOne, plOneImageTwo, plOneImageThree, plOneImageFour, plOneImageFive, plOneImageSix]
        plTwoImages += [plTwoImageOne, plTwoImageTwo,plTwoImageThree, plTwoImageFour, plTwoImageFive, plTwoImageSix]
        plThreeImages += [plThreeImageOne, plThreeImageTwo, plThreeImageThree, plThreeImageFour, plThreeImageFive, plThreeImageSix]
        plFourImages += [plFourImageOne, plFourImageTwo, plFourImageThree, plFourImageFour, plFourImageFive, plFourImageSix ]
        plImages += [plOneImages, plTwoImages, plThreeImages, plFourImages]
        dealerImages += [dealerImageOne, dealerImageTwo, dealerImageThree, dealerImageFour, dealerImageFive]
        plScores += [plOneScore, plTwoScore, plThreeScore, plFourScore]
        plTurns += [plOneTurn, plTwoTurn, plThreeTurn, plFourTurn]
        plBets += [plOneBet, plTwoBet, plThreeBet, plFourBet]
        plSums += [plOneSum, plTwoSum, plThreeSum, plFourSum]
        blackjack = Game(deckSize: numDecks,playerNumber: numPlayers)
        getPlayerStats()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

