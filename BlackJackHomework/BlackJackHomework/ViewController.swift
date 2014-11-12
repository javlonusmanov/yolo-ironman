//
//  ViewController.swift
//  BlackJackHomework
//
//  Created by Javlon Usmanov on 9/21/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var dealerScore: UILabel!
    @IBOutlet var playerScore: UILabel!
    @IBOutlet var betAmount: UITextField!
    
    @IBOutlet var playerCards: UILabel!
    @IBOutlet var dealerCards: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var maxAmount: UITextView!
    @IBOutlet var gameOutcome: UILabel!
    
    @IBOutlet var standButton: UIButton!
    @IBOutlet var hitButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet weak var playerLabel: UILabel!
    var game = BlackJackGame()
    
    var index: Int = 0
    var counter:Int = 0
    var moneyStart:Int = 100
    var currentPlayer:Person = Person ()
    func refresh () {
        if (index < game.players.count ){
            currentPlayer = game.selectPlayers(index)
        }
        else {
            game.dealerHit()
            index = 0
            currentPlayer = game.players.first!
        }
        if (currentPlayer.stood) {
            buttonHidden(true, standBtn: true, nextBtn: false)
        }
        playerLabel.text = String("Player \(index + 1) Score")
        dealerScore.text = String(game.dealer.handSum().strScore)
        playerScore.text = String(currentPlayer.handSum().strScore)
        dealerCards.text = String(game.dealer.showHand())
        playerCards.text = String(currentPlayer.showHand())
        gameOutcome.text = String(game.checkScore(currentPlayer))
    }
    
    func buttonHidden (hitBtn: Bool, standBtn:Bool, nextBtn: Bool ) {
        hitButton.hidden = hitBtn
        standButton.hidden = standBtn
        nextButton.hidden = nextBtn
    }
    
    @IBAction func nextButton(sender: UIButton) {
        buttonHidden(false, standBtn: false, nextBtn: true)
        refresh()
    }
    @IBAction func play(sender: UIButton) {
        
        game.restart()
        for deck in game.decks {
            for card in deck.cardDeck {
                NSLog(card.description)
            }
        }
        index = 0
        buttonHidden(false, standBtn: false, nextBtn: true)
        currentPlayer = game.players.first!
        refresh()
        var temp:Int = moneyStart - betAmount.text.toInt()!
        moneyStart = temp
        maxAmount.text = String("$\(temp)")
        if(moneyStart - betAmount.text.toInt()! < 0) {
            maxAmount.text = String("00")
            gameOutcome.text = String("You have no money left, sorry!")
            game.restart()
            playButton.enabled = false
            playButton.hidden = true
        }
    }
    
    
    @IBAction func hitButton(sender: UIButton) {
        game.hit(currentPlayer)
        gameOutcome.text = String(game.checkScore(currentPlayer))
        if (gameOutcome.text != "") {
            buttonHidden(true, standBtn: true, nextBtn: false) }
        refresh()
    }
    
    
    @IBAction func standButton(sender: UIButton) {
        currentPlayer.stood = true
        game.stand(currentPlayer)
        index+=1
        refresh()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

