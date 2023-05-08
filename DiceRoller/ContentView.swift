//
//  ContentView.swift
//  DiceRoller
//
//  Created by Chase Martin on 5/4/23.
//

import SwiftUI

struct ContentView: View {
	private let diceOptions = [4, 6, 8, 10, 12, 20]
	@State private var total: Int = 0
	@State private var showingResultSheet = false
	
	@StateObject private var dice = DiceSet()
	
	let columns = [ GridItem(.adaptive(minimum: 80)) ]
	
    var body: some View {
		NavigationView {
			VStack {
				ScrollView {
					LazyVGrid(columns: columns, spacing: 20) {
						ForEach(dice.dice_list, id: \.id) { die in
							DieView(die: die)
								.font(.largeTitle)
						}
					}
				}
				.padding(.top)
				
				Spacer()
				
				if (total > 0) {
					Text("Total: \(total)")
						.frame(alignment: .bottom)
				}
				
				Divider()
				
				HStack(alignment: .bottom) {
					ForEach(diceOptions, id: \.self) { num in
						Button {
							addDice(sides: num)
						} label: {
							Image(systemName: "\(num).square.fill")
								.font(.largeTitle)
						}
						.onLongPressGesture(minimumDuration: 0.5) {
							removeDice(sides: num)
						}
					}
				}
				.padding([.bottom, .top])
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						showingResultSheet = true
					} label: {
						Image(systemName: "list.bullet.rectangle.portrait")
					}
				}
				
				ToolbarItem(placement: .bottomBar) {
					Button("Roll") {
						rollDice()
					}
				}
			}
			.navigationTitle("Dice Roller")
			.sheet(isPresented: $showingResultSheet){
				ResultsView()
			}
		}
    }
	
	func addDice(sides: Int) {
		let newDie = Die(sides: sides)
		dice.dice_list.append(newDie)
	}
	
	func removeDice(sides: Int) {
		let id = dice.dice_list.filter({ $0.sides == sides }).first?.id
		dice.dice_list.removeAll(where: {$0.id == id})
	}
	
	func rollDice() {
		var calculatedTotal = 0
		
		dice.dice_list.forEach { die in
			let roll = die.result
			calculatedTotal += roll
		}
		total = calculatedTotal
	}
	
	func saveResult() {
		
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
