//
//  FunctionView.swift
//  SwiftUICalculator
//
//  Created by lxd on 2020/11/13.
//

import SwiftUI

struct FunctionView: View {
    enum MathFunction {
        case sinus, cosinus, tangens
        
        func string() -> String {
            switch self {
                case .cosinus: return "cos"
                case .sinus: return "sin"
                case .tangens: return "tan"
            }
        }
        
        func operation(_ input: Double) -> Double {
            switch self {
                case .cosinus: return cos(input)
                case .sinus: return sin(input)
                case .tangens: return tan(input)
            }
        }
    }
    
    @Binding var state:CalculationState
    var function: MathFunction
    
    
    var body:some View {
        return Text(function.string())
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.black)
            .frame(width: 64, height: 64)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.9), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10 )
            .onTapGesture{
                self.state.currentNumber = self.function.operation(self.state.currentNumber)
            }
    }
}

struct FunctionView_Previews: PreviewProvider {
    
    @State static var state = CalculationState()
    
    static var previews: some View {
        FunctionView(state: $state, function: .cosinus)
    }
}
