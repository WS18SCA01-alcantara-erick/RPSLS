//
//  Sign.swift
//  RPSLS
//
//  Created by bookr on 11/6/18.
//  Copyright © 2018 edu.cuny.bmcc. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 4)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
    return .rock
} else if sign == 1 {
    return .paper
} else if sign == 2 {
    return .scissors
} else if sign == 3 {
    return .lizard
} else {
    return .spock
}
}


enum Sign {
    case rock, paper, scissors, lizard, spock
    
    var emoji: String {
        switch self {
        case .rock: return "👊🏽"
        case .paper: return "✋🏽"
        case .scissors: return "✌🏽"
        case .lizard: return "🦎"
        case .spock: return "🖖🏽"
        }
    }
    func battle(_ computer: Sign) -> GameState {
        switch self {
        case .rock:
            switch computer {
            case .rock:
                return GameState.draw
            case .paper:
                return GameState.lose
            case .scissors:
                return GameState.win
            case .lizard:
                return GameState.win
            case .spock:
                return GameState.lose
            }
        case .paper:
            switch computer {
            case .rock:
                return GameState.win
            case .paper:
                return GameState.draw
            case .scissors:
                return GameState.lose
            case .lizard:
                return GameState.lose
            case .spock:
                return GameState.win
            }
        case .scissors:
            switch computer {
            case .rock:
                return GameState.lose
            case .paper:
                return GameState.win
            case .scissors:
                return GameState.draw
            case .lizard:
                return GameState.win
            case .spock:
                return GameState.lose
            }
        case .lizard:
            switch computer {
            case .rock:
                return GameState.lose
            case .paper:
                return GameState.win
            case .scissors:
                return GameState.lose
            case .lizard:
                return GameState.draw
            case .spock:
                return GameState.win
            }
        case .spock:
            switch computer {
            case .rock:
                return GameState.win
            case .paper:
                return GameState.lose
            case .scissors:
                return GameState.win
            case .lizard:
                return GameState.lose
            case .spock:
                return GameState.draw
            }
            
        }
    }
}
