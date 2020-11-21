//
//  NumberView.swift
//  SwiftUICalculator
//
//  Created by lxd on 2020/11/8.
//

import SwiftUI

struct NumberView: View{
    let number: Double
    @Binding var state:CalculationState
    
    var numberString: String {
        if number == .pi{
            return "π"
        }
        
        return String(Int(number))
    }
    
    var body: some View {
        Text(numberString)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(color: .blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10 )
            .onTapGesture{
                self.state.appendNumber(number)
            }
    }
}



struct NumberView_Previews: PreviewProvider {
    
    @State static var state = CalculationState()
    
    static var previews: some View {
        NumberView(number:1, state: $state)
    }
}
