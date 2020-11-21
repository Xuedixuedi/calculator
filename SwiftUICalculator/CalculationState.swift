//
//  CalculationState.swift
//  SwiftUICalculator
//
//  Created by lxd on 2020/11/13.
//

import SwiftUI

struct CalculationState {
    var currentNumber: Double = 0
    
    var storedNumber: Double?
    var storedAction: ActionView.Action?
    
    mutating func appendNumber(_ number: Double){
        if number.truncatingRemainder(dividingBy: 1) == 0 && currentNumber.truncatingRemainder(dividingBy: 1) == 0 {
            currentNumber = 10 * currentNumber + number
        } //
        else {
            currentNumber = number
        }
    }
}

