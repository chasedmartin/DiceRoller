//
//  DieView.swift
//  DiceRoller
//
//  Created by Chase Martin on 5/4/23.
//

import SwiftUI

struct DieView: View {
	let die: Die
	
    var body: some View {
		switch die.sides {
			case 4:
				Image(systemName: "triangle")
			case 6:
				Image(systemName: "square")
			case 8:
				Image(systemName: "diamond")
			case 10:
				Image(systemName: "hexagon")
			case 12:
				Image(systemName: "octagon")
			case 20:
				Image(systemName: "seal")
			default:
				Image(systemName: "x.square")
		}
    }
}
