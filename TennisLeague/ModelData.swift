//
//  ModelData.swift
//  TennisLeague
//
//  Created by Maurício Carvalho on 11/09/16.
//  Copyright © 2016 Maurício Carvalho. All rights reserved.
//

import Foundation



/////////////////////////////////////////////
///////////  MODELS /////////////////////////
///////////////////////////////////////////

enum WeekDay: String {
    case Monday = "Segunda"
    case Tuesday = "Terça"
    case Wednesday = "Quarta"
    case Thursday = "Quinta"
    case Friday = "Sexta"
    case Saturday = "Sábado"
    case Sunday = "Domingo"
}



enum Period: String {
    case Morning = "Manhã"
    case Afternoon = "Tarde"
    case Evening = "Noite"
}



/////////////
// DIVISION
/////////////

enum Division: String {
    case A = "Série A"
    case B = "Série B"
    case C = "Série C"
    case D = "Série D"
}


///////////////
/// PLAYERS
///////////////

enum ListOfPlayers: String {
    case A1 = "Bruno Cyreno"
    case A2 = "Maurício Carvalho"
    case A3 = "Mário Lima"
    case A4 = "Fernando Faria"
}


////////////////
/// Match Record
////////////////


/* 
 
 Player: MatchId, Date, Division, Played, WasHome, WasAway, OpponentId, Win, GamesDifference, GamesFor


