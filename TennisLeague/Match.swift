//
//  Match.swift
//  TennisLeague
//
//  Created by Maurício Carvalho on 11/09/16.
//  Copyright © 2016 Maurício Carvalho. All rights reserved.
//

import Foundation




///////////
// MATCH
///////////




class Match {
 
    let playerHome: Player
    let set1ScorePlayerHome: Int
    let set2ScorePlayerHome: Int
    let superScorePlayerHome: Int?
    
    let playerAway: Player
    let set1ScorePlayerAway: Int
    let set2ScorePlayerAway: Int
    let superScorePlayerAway: Int?
    
    init(playerHome: Player, set1ScorePlayerHome: Int, set2ScorePlayerHome: Int, superScorePlayerHome: Int?, playerAway: Player, set1ScorePlayerAway: Int, set2ScorePlayerAway: Int, superScorePlayerAway: Int?, winner: Player?, loser: Player? ) {
        
        self.playerHome = playerHome
        self.set1ScorePlayerHome = set1ScorePlayerHome
        self.set2ScorePlayerHome = set2ScorePlayerHome
        self.superScorePlayerHome = superScorePlayerHome
        
        self.playerAway = playerAway
        self.set1ScorePlayerAway = set1ScorePlayerAway
        self.set2ScorePlayerAway = set2ScorePlayerAway
        self.superScorePlayerAway = superScorePlayerAway
        
    }
    
    
    
    //////////////////////////
    ////  DETERMINA VENCEDOR
    //////////////////////////
    
    func determineWinner() -> (Player, Player) {
        
        if superScorePlayerHome != nil && superScorePlayerAway != nil {
            if superScorePlayerHome > superScorePlayerAway {
                let winner = playerHome
                let loser = playerAway
                return (winner, loser)
            } else if superScorePlayerAway > superScorePlayerHome {
                let winner = playerAway
                let loser = playerHome
                return (winner, loser)
            } else {
                fatalError()
            }
        }
        
        if (set1ScorePlayerHome > set1ScorePlayerAway) && (set2ScorePlayerHome > set2ScorePlayerAway) {
            let winner = playerHome
            let loser = playerAway
            return (winner, loser)
        } else if (set1ScorePlayerHome < set1ScorePlayerAway) && (set2ScorePlayerHome < set2ScorePlayerAway) {
            let winner = playerAway
            let loser = playerHome
            return (winner, loser)
        }
        
        fatalError()
    }
    
    
    
    /////
    // Calculates Total Games
    ////
    
    func calculatePlayerHomeTotalGames() -> (Int) {
        let playerHomeTotalGames = set1ScorePlayerHome + set2ScorePlayerHome
        
        return (playerHomeTotalGames)
    }
    
    func calculatePlayerAwayTotalGames() -> (Int) {
        let playerAwayTotalGames = set1ScorePlayerAway + set2ScorePlayerAway
        
        return (playerAwayTotalGames)
    }
    
    
    
    //////
    /// Calculates Games Difference
    //////
    
    
    
    func calculatePlayerHomeGamesDifference() -> (Int) {
        
        let playerHomeGamesDifference = (set1ScorePlayerHome + set2ScorePlayerHome) - (set1ScorePlayerAway + set2ScorePlayerAway)
        
        return playerHomeGamesDifference
        
    }
    
    func calculatePlayerAwayGamesDifference() -> (Int) {
        
        let playerAwayGamesDifference = (set1ScorePlayerAway + set2ScorePlayerAway) - (set1ScorePlayerHome + set2ScorePlayerHome)
        
        return playerAwayGamesDifference
    }
    
    ////// CALCULATE ELO
    
    func calculateEloRating(ratingWinner: Float, ratingLoser: Float) -> (newRatingWinner: Float, newRatingLoser: Float ) {
        
        /* CONSTANT K
         
         K is a "K factor" which takes into account how many games a player has played. The fewer games a player has played, the greater the K factor will be. This allows players to reach a stable equilibrium much faster than if K were a non-changing value. In this rating, K for a particular player can be calculated by:
         
         K = 800/(Ne)
         
         where Ne is the total number of games played by a player in order to achieve this rating. The value of 800 is the recommended value for ELO. In order to assure that no player's K factor gets so low that their rating becomes stagnant, a minimum K factor should be set. The standard ELO value is 16 or 32 and should be raised if the number of games played will be few. It is also important to set a minimum number of games to be played for ratings to be considered qualified.
         */
        
        let constantK: Float = 80.0
        
        
        // INPUTS
        
        
        // RATINGS BEFORE MATCH
        
        let oldRatingWinner: Float = ratingWinner
        let oldRatingLoser: Float = ratingLoser
        
        
        // MATCH RESULT
        
        /* W = 1.0 if the player won, and W = 0.0 if the player lost. */
        
        let matchWinPlayerA: Float = 1.0
        let matchLostPlayerB: Float = 1.0 - matchWinPlayerA
        
        //  EXPECTED PROBABILITY OF VICTORY
        /*
         
         Ea and Eb are the expected probability that player A and player B will win the matchup, respectively.
         
         Ea and Eb can be calculated by:
         
         Ea = 1/(1 + 10 ^ ((Rb-Ra) / 400) )
         Eb = 1/(1 + 10 ^ ((Ra-Rb) / 400) )
         
         */
        
        let expectedProbabilityOfVictoryWinner: Float = 1.0 / (1.0 + pow(10.0, ((oldRatingLoser - oldRatingWinner) / 400.0)))
        
        let expectedProbabilityOfVictoryLoser: Float = 1.0 - expectedProbabilityOfVictoryWinner
        
        // CALCULATING THE NEW RATINGS
        
        /* Formulas
         Say we have player A and player B, who have ratings of Ra and Rb, respectively. The formulas are as follows:
         
         Ra(new) = Ra(old) + K * ( W – Ea )
         Rb(new) = Rb(old) + K * ( W – Eb )
         
         */
        
        let newRatingWinner: Float = oldRatingWinner + constantK * (matchWinPlayerA - expectedProbabilityOfVictoryWinner)
        
        let newRatingLoser: Float = oldRatingLoser + constantK * (matchLostPlayerB - expectedProbabilityOfVictoryLoser)
        
        // RETURN NEW RATINGS
        
        return (newRatingWinner, newRatingLoser)
    }
    
    
}





var playerHome = Player(playerID: 1, firstName: "Mauricio", lastName: "Carvalho", division: .A, eloRating: 1677)

let playerAway = Player(playerID: 2, firstName: "Mario", lastName: "Lima", division: .A, eloRating: 1520)

let Match1Rodada1 = Match(playerHome: playerHome, set1ScorePlayerHome: 6, set2ScorePlayerHome: 7, superScorePlayerHome: nil, playerAway: playerAway, set1ScorePlayerAway: 3, set2ScorePlayerAway: 5, superScorePlayerAway: nil, winner: nil, loser: nil)


/*

Match1Rodada1.determineWinner().0.eloRating
Match1Rodada1.determineWinner().1.eloRating



Match1Rodada1.calculatePlayerHomeGamesDifference()
Match1Rodada1.playerHome.firstName
Match1Rodada1.determineWinner().0.getFullName()


var newEloRatings: (Float, Float) = Match1Rodada1.calculateEloRating(Match1Rodada1.determineWinner().0.eloRating, ratingLoser: Match1Rodada1.determineWinner().1.eloRating)


var playerHomeAfterMatch = Player(playerID: Match1Rodada1.playerHome.playerID, firstName: Match1Rodada1.playerHome.firstName, lastName: Match1Rodada1.playerHome.lastName, division: Match1Rodada1.playerHome.division, eloRating: newEloRatings.0)

playerHomeAfterMatch.eloRating




//let eloRatingPlayerThatWon: Float = 1922.0
//let eloRatingPlayerThatLost: Float = 1666.0

//let matchup = Match.CalculateEloRating(eloRatingPlayerThatWon, ratingPlayerThatLost: eloRatingPlayerThatLost)

//print ("Pontuação do Vencedor: \(matchup.newRatingPlayerThatWon)\n" +
//    "Pontuação do Perdedor: \(matchup.newRatingPlayerThatLost)")


*/
