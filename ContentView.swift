//
//  ContentView.swift
//  Virtual Dopamine
//
//  Created by David Jagga on 12/14/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color.blue
                .ignoresSafeArea()
            
            
            .overlay(Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Virtual Dopamine")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 50, weight: .bold))
                    
            }))
        
        
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
