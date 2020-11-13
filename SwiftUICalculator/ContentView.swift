//
//  ContentView.swift
//  SwiftUICalculator
//
//  Created by lxd on 2020/11/5.
//

import SwiftUI

struct ContentView: View {
    
    @State var state = CalculationState()
    
    var displayedString: String {
        String(format: "%.2f", arguments: [state.currentNumber])
    }
    
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 20){
            Spacer()
            
            Text(displayedString)
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(3)
                .padding(.bottom, 64)
            
            HStack{
                FunctionView(state: $state, function: .sinus)
                Spacer()
                FunctionView(state: $state, function: .cosinus)
                Spacer()
                FunctionView(state: $state, function: .tangens)
                Spacer()
                ActionView(action:.plus , state: $state)
            }
            
            HStack{
                NumberView(number:1, state: $state)
                Spacer()
                NumberView(number:2, state: $state)
                Spacer()
                NumberView(number:3, state: $state)
                Spacer()
                ActionView(action:.minus , state: $state)
            }
            HStack{
                NumberView(number:4, state: $state)
                Spacer()
                NumberView(number:5, state: $state)
                Spacer()
                NumberView(number:6, state: $state)
                Spacer()
                ActionView(action:.multiply , state: $state)
            }
            HStack{
                NumberView(number:7, state: $state)
                Spacer()
                NumberView(number:8, state: $state)
                Spacer()
                NumberView(number:9, state: $state)
                Spacer()
                ActionView(action:.divide , state: $state)
            }
            HStack{
                ActionView(action:.clear , state: $state)
                Spacer()
                NumberView(number:0, state: $state)
                Spacer()
                NumberView(number:.pi, state: $state)
                Spacer()
                ActionView(action:.equal , state: $state)
            }
        }.padding(32)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
