/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Json4Swift_Base : Codable {
	let venue : String?
	let location : String?
	let datetime : String?
	let status : String?
	let time : String?
	let fifa_id : Int?
	let home_team : Home_team?
	let away_team : Away_team?
	let winner : String?
	let winner_code : String?
	let home_team_events : [Home_team_events]?
	let away_team_events : [Away_team_events]?

	enum CodingKeys: String, CodingKey {

		case venue = "venue"
		case location = "location"
		case datetime = "datetime"
		case status = "status"
		case time = "time"
		case fifa_id = "fifa_id"
		case home_team
		case away_team
		case winner = "winner"
		case winner_code = "winner_code"
		case home_team_events = "home_team_events"
		case away_team_events = "away_team_events"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		venue = try values.decodeIfPresent(String.self, forKey: .venue)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		datetime = try values.decodeIfPresent(String.self, forKey: .datetime)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		fifa_id = try values.decodeIfPresent(Int.self, forKey: .fifa_id)
		home_team = try Home_team(from: decoder)
		away_team = try Away_team(from: decoder)
		winner = try values.decodeIfPresent(String.self, forKey: .winner)
		winner_code = try values.decodeIfPresent(String.self, forKey: .winner_code)
		home_team_events = try values.decodeIfPresent([Home_team_events].self, forKey: .home_team_events)
		away_team_events = try values.decodeIfPresent([Away_team_events].self, forKey: .away_team_events)
	}

}