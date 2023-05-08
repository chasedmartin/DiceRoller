//
//  Dice.swift
//  DiceRoller
//
//  Created by Chase Martin on 5/4/23.
//

import Foundation

struct Die: Identifiable {
	let id: UUID = UUID()
	let sides: Int
	//var result: Int?
	
	var result: Int {
		Int.random(in: 1...sides)
	}
	
	/*mutating func roll() -> Int {
		let roll = Int.random(in: 1...sides)
		result = roll
		return roll
	}*/
}
