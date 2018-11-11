//
//  ViewController.swift
//  RPSLS
//
//  Created by bookr on 11/6/18.
//  Copyright © 2018 edu.cuny.bmcc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let winSound = SimpleSound(named: "morons")
    let loseSound = SimpleSound(named:  "disease")
    let drawSound = SimpleSound(named: "futile")
    
    var humanScore = 0
    var cpuScore = 0
    
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var lizardButton: UIButton!
    @IBOutlet weak var spockButton: UIButton!
    @IBOutlet weak var battleButton: UIButton!
    @IBOutlet weak var humanScoreLabel: UILabel!
    @IBOutlet weak var cpuScoreLabel: UILabel!
    
    var currentGame: GameState = GameState.start
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetGame()
    }
    func resetGame() {
        computerLabel.text  = "🤖"
        gameStatus.text = "Rock, Paper, Scissors, Lizard, Spock"
        battleButton.isHidden = true
        rockButton.isEnabled = true
        rockButton.isHidden = false
        paperButton.isEnabled = true
        paperButton.isHidden = false
        scissorsButton.isEnabled = true
        scissorsButton.isHidden = false
        lizardButton.isEnabled = true
        lizardButton.isHidden = false
        spockButton.isEnabled = true
        spockButton.isHidden = false
       
    }
    
    func play(_ userTurn: Sign) {
        rockButton.isEnabled = true
        paperButton.isEnabled = true
        scissorsButton.isEnabled = true
        lizardButton.isEnabled = true
        spockButton.isEnabled = true
        
        let computer = randomSign()
        computerLabel.text = computer.emoji
        
        currentGame = userTurn.battle(computer)
       
        switch currentGame {
        case .draw:
            gameStatus.text = "Resistance is Futile"
            drawSound.play()
        case .lose:
            gameStatus.text = "Human Beings are A Disease, A Cancer of This Planet."
            loseSound.play()
        case .win:
            gameStatus.text = "I got Morons in My Team."
            winSound.play()
        case .start:
            gameStatus.text = "Rock, Paper, Scissors, Lizard, Spock"
        }
        
        switch userTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            lizardButton.isHidden = true
            spockButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
            lizardButton.isHidden = true
            spockButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
            lizardButton.isHidden = true
            spockButton.isHidden = true
        case .lizard:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            lizardButton.isHidden = false
            spockButton.isHidden = true
        case .spock:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            lizardButton.isHidden = true
            spockButton.isHidden = false
            
            
            
        }
        battleButton.isHidden = false
        
        
    }
    
    @IBAction func rockPicked(_ sender: UIButton) {
        play(Sign.rock)
    }
    @IBAction func paperPicked(_ sender: Any) {
        play(Sign.paper)
    }
    @IBAction func scissorsPicked(_ sender: Any) {
       play(Sign.scissors)
    }
    @IBAction func lizardPicked(_ sender: Any) {
        play(Sign.lizard)
    }
    @IBAction func spockPicked(_ sender: Any) {
        play(Sign.spock)
    }
    @IBAction func startBattle(_ sender: UIButton) {
        resetGame()
        
    }
    
    
}

