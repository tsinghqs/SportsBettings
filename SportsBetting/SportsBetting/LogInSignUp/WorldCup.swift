//
//  WorldCup.swift
//  SportsBetting
//
//  Created by Deval Parikh on 6/14/18.
//  Copyright © 2018 Tarun Singh. All rights reserved.
//
//Struct for worldcup.sfg.io/matches api

// To parse the JSON:
//
//let worldCup = try? JSONDecoder().decode(WorldCup.self, from: jsonData)

// To parse the JSON, add this file to your project and do:
//
//   let worldCup = try? JSONDecoder().decode(WorldCup.self, from: jsonData)

import Foundation

typealias WorldCup = [WorldCupElement]

class WorldCupElement: Codable {
    let venue: String
    let location: String
    let datetime: String
    let status: Status
    let time: String?
    let fifaID: String
    let homeTeam: Team
    let awayTeam: Team
    let winner: String?
    let winnerCode: String?
    let homeTeamEvents: AwayTeamEventsUnion
    let awayTeamEvents: AwayTeamEventsUnion
    
    enum CodingKeys: String, CodingKey {
        case venue = "venue"
        case location = "location"
        case datetime = "datetime"
        case status = "status"
        case time = "time"
        case fifaID = "fifa_id"
        case homeTeam = "home_team"
        case awayTeam = "away_team"
        case winner = "winner"
        case winnerCode = "winner_code"
        case homeTeamEvents = "home_team_events"
        case awayTeamEvents = "away_team_events"
    }
    
    init(venue: String, location: String, datetime: String, status: Status, time: String?, fifaID: String, homeTeam: Team, awayTeam: Team, winner: String?, winnerCode: String?, homeTeamEvents: AwayTeamEventsUnion, awayTeamEvents: AwayTeamEventsUnion) {
        self.venue = venue
        self.location = location
        self.datetime = datetime
        self.status = status
        self.time = time
        self.fifaID = fifaID
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.winner = winner
        self.winnerCode = winnerCode
        self.homeTeamEvents = homeTeamEvents
        self.awayTeamEvents = awayTeamEvents
    }
}

class Team: Codable {
    let country: String
    let code: String
    let goals: Int?
    let teamTbd: String?
    
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case code = "code"
        case goals = "goals"
        case teamTbd = "team_tbd"
    }
    
    init(country: String, code: String, goals: Int?, teamTbd: String?) {
        self.country = country
        self.code = code
        self.goals = goals
        self.teamTbd = teamTbd
    }
}

enum AwayTeamEventsUnion: Codable {
    case enumeration(AwayTeamEventsEnum)
    case teamEventArray([TeamEvent])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([TeamEvent].self) {
            self = .teamEventArray(x)
            return
        }
        if let x = try? container.decode(AwayTeamEventsEnum.self) {
            self = .enumeration(x)
            return
        }
        throw DecodingError.typeMismatch(AwayTeamEventsUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AwayTeamEventsUnion"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumeration(let x):
            try container.encode(x)
        case .teamEventArray(let x):
            try container.encode(x)
        }
    }
}

class TeamEvent: Codable {
    let id: Int
    let typeOfEvent: TypeOfEvent
    let player: String
    let time: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case typeOfEvent = "type_of_event"
        case player = "player"
        case time = "time"
    }
    
    init(id: Int, typeOfEvent: TypeOfEvent, player: String, time: String) {
        self.id = id
        self.typeOfEvent = typeOfEvent
        self.player = player
        self.time = time
    }
}

enum TypeOfEvent: String, Codable {
    case goal = "goal"
    case substitutionIn = "substitution-in"
    case yellowCard = "yellow-card"
}

enum AwayTeamEventsEnum: String, Codable {
    case noEventsAvailableForThisMatch = "no events available for this match"
}

enum Status: String, Codable {
    case completed = "completed"
    case future = "future"
    case inProgress = "in progress"
}
