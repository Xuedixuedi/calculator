//
//  ActionView.swift
//  SwiftUICalculator
//
//  Created by lxd on 2020/11/13.
//

import SwiftUI

struct ActionView: View {
    
    enum Action{
        case equal, clear, plus, minus, multiply, divide
        
        func image() -> Image {
            switch self {
            case .equal:
                return Image(systemName: "equal")
            case .clear:
                return Image(systemName: "xmark.circle")
            case .plus:
                return Image(systemName: "plus")
            case .minus:
                return Image(systemName: "minus")
            case .multiply:
                return Image(systemName: "multiply")
            case .divide:
                return Image(systemName: "divide")
            }
        }
            
        func calculate(_ input1:Double, _ input2:Double) -> Double? {
            switch self{
            case .plus:
                return input2 + input1
            case .minus:
                return input1 - input2
            case .multiply:
                return input1 * input2
            case .divide:
                return input1 / input2
            default:
                return nil
            }
        }
    }

    let action: Action
    @Binding var state:CalculationState
    
    var body:some View {
        action.image()
            .font(Font/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.bold))
            .foregroundColor(Color.white)
            .frame(width: 64, height: 64)
            .background(Color.green)
            .cornerRadius(20)
            .shadow(color: Color.green, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10 )
            .onTapGesture{
                self.tapped()
            }
    }
    
    private func tapped(){
        switch action {
        case .equal:
            guard let storedAction = state.storedAction else {
                return
            }
            
            guard let storedNumber = state.storedNumber else {
                return
            }
            
            guard let result = state.storedAction?.calculate(storedNumber, state.currentNumber) else {
                return
            }
            
            state.currentNumber = result
            state.storedNumber = nil
            state.storedAction = nil
            
            break
        case .clear:
            state.currentNumber = 0
            state.storedNumber = nil
            state.storedAction = nil
           break
        default:
            state.storedNumber = state.currentNumber
            state.currentNumber = 0
            state.storedAction = action
            break
        }
        
    }
}

struct ActionView_Previews: PreviewProvider {
    
    @State static var state = CalculationState()
    static var previews: some View {

        ActionView(action:.clear , state: $state)
    }
}
