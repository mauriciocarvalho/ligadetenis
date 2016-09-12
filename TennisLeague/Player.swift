//
//  Player.swift
//  TennisLeague
//
//  Created by Maurício Carvalho on 11/09/16.
//  Copyright © 2016 Maurício Carvalho. All rights reserved.
//

import Foundation

///////////
// PLAYER
///////////

class Player {
    let division: Division
    let playerID: Int
    let firstName: String
    let lastName: String
    //let telephone: Int
    var eloRating: Float
    
    init(playerID: Int, firstName: String, lastName: String, division: Division, eloRating: Float) {
        self.playerID = playerID
        self.firstName = firstName
        self.lastName = lastName
        self.division = division
        self.eloRating = eloRating
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
}





// let player = Player(firstName: "Mauricio", lastName: "Carvalho", division: Division.A, eloRating: 1500.0)

// player.getFullName()
// player.division
// player.eloRating

