//
//  ListView.swift
//  Virtual Dopamine
//
//  Created by David Jagga on 12/14/20.
//

import Foundation
import SwiftUI

public struct ListView: View {
    public var body: some View {
        NavigationView{
            
            VStack{
                Text("Virtual Dopamine")
                    .foregroundColor(Color.blue)
                    .font(Font.system(size: 50, weight: .bold))
                List{
                    HStack{
                        Text("Exercise")
                            .foregroundColor(Color.blue)
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(Color.blue)
                        }
                        
                    }
                    HStack{
                        Text("Finish my Homework")
                            .foregroundColor(Color.blue)
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(Color.blue)
                        }
                        
                    }
                    HStack{
                        Text("Wash the Dishes")
                            .foregroundColor(Color.blue)
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color.gray)
                        }
                        
                    }
                    HStack{
                        Text("Study for Chem")
                            .foregroundColor(Color.purple)
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(Color.purple)
                        }
                        
                    }
                }
                Text("Number of unfinished tasks: \(ListView.numberOfTasks)")
                    .font(Font.system(size: 20, weight: .bold))
                    .foregroundColor(Color.blue)
                Button(action: {}) {
                    Image(systemName: "plus")
                        .font(Font.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white)
                        .frame(width: 60, height: 60)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(30)
                        .shadow(radius: 16)
                        .padding(16)
                }
            }
            
        }
        
    }
    
    static var numberOfTasks = 1
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
            ListView()
        
    }
}
