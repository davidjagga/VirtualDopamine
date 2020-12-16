//
//  AddTask.swift
//  Virtual Dopamine
//
//  Created by David Jagga on 12/14/20.
//
import SwiftUI

struct AddTask: View {
    @State var enteredTodo: String = ""
    @State var temp: String = ""
    var body: some View {
    VStack {
        Spacer()
        Text("Virtual Dopamine")
            .foregroundColor(Color.blue)
            .font(Font.system(size: 50, weight: .bold))
        Spacer()
        Text("What is the name of your Task?")
            .frame(maxWidth: .infinity, alignment: .leading)
        
        TextField("E.g. Finish Homework", text: $enteredTodo)
            .font(Font.system(size: 18))
            .frame(height: 50)
            .padding(.horizontal, 8)
            .border(Color.black.opacity(0.5), width: 2)
        Text("Will it be Temporary?")
            .frame(maxWidth: .infinity, alignment: .leading)
        TextField("Yes or No", text: $temp)
            .font(Font.system(size: 18))
            .frame(height: 50)
            .padding(.horizontal, 8)
            .border(Color.black.opacity(0.5), width: 2)
        Button(action: {
            
        }) {
            Text("Add a Task")
                .font(Font.system(size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(16)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(8)
                .shadow(radius: 16)
                .padding(16)
        }
        
        Spacer()
    }
    .padding(.horizontal, 16)
    .navigationBarTitle("Add A Task", displayMode: .large)
}
    
}

struct AddTaskPreviews: PreviewProvider {
    static var previews: some View {
            AddTask()
        
    }
}

