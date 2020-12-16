//
//  ContentView.swift
//  ToDoLists
//
//  Created by David Jagga on 12/12/20.
//

import SwiftUI
import AVFoundation





public struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "isComplete", ascending: true)])
    private var tasks: FetchedResults<Task>
    
    @State private var showingAddView = false
    
    
    
    static var numberOfTasks = 0
    
    
    
    
    
    
    public var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(tasks) { tasks in
                        
                            HStack{
                                Text(tasks.title ?? "Untitled")
                                    .foregroundColor(Color.blue)
                                Spacer()
                                
                                Spacer()
                                    if(tasks.isComplete){
                                        Button(action: {
                                            withAnimation{
                                                add()
                                                if(tasks.date != Date()){
                                                    
                                                }
                                                viewContext.performAndWait {
                                                        tasks.isComplete = false
                                                        
                                                try? viewContext.save()
                                                }
                                                    
                                            }
                                        }) {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(Color.blue)
                                        }
                                        
                                    } else {
                                        Button(action: {
                                            withAnimation{
                                                ContentView.numberOfTasks-=1
                                            
                                                playChimes()
                                                viewContext.performAndWait {
                                                    tasks.isComplete = true
                                                    if(ContentView.numberOfTasks==0){
                                                        playComplete()
                                                    }
                                                try? viewContext.save()
                                                }
                                                
                                            }
                                        }) {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(Color.gray)
                                        }
                                    }
                            }
                    }.onDelete(perform: deleteTask)
                }
                Text("Number of unfinished tasks: \(ContentView.numberOfTasks)")
                    .font(Font.system(size: 20, weight: .bold))
                    .foregroundColor(Color.blue)
                
                
                Button(action: {
                    add()
                    self.showingAddView = true
                    
                }) {
                    Image(systemName: "plus")
                        .font(Font.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white)
                        .frame(width: 60, height: 60)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(30)
                        .shadow(radius: 16)
                        .padding(16)
                }
    
                NavigationLink(destination: AddTodoView(isShown: $showingAddView), isActive: $showingAddView) {
                    EmptyView()
                }
                
            }
            .navigationBarTitle("Virtual Dopamine")
                .foregroundColor(Color.blue)
        }
    }
    
    private func saveContext() {
        
        do{
        
            try viewContext.save()
        
        } catch{
            let error = error as NSError
        
            fatalError("Save Error: \(error)")
        }
    }
    
    private func add() {
        
        ContentView.numberOfTasks+=1
    }

    private func addTask(_ task: FetchedResults<Task>) {
        withAnimation{
            let newTask = Task(context: viewContext)
            newTask.title = "New Task \(Date())"
            newTask.isComplete = false
            newTask.date = Date()
            
            saveContext()
            
        }
        
    }
    private func updateTask(_ task: FetchedResults<Task>.Element) {
        withAnimation{
            if (tasks.date<Date().addingTimeInterval(-84600)){
                task.isComplete = false
            } else {
                
            }
            
            
        }
        
    }
    
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            
            
            offsets.map{tasks[$0]}.forEach(viewContext.delete)
            playChimes()
            if(ContentView.numberOfTasks==0){
                playComplete()
            }
            saveContext()
        }
        
    }
    
    private func playChimes(){
        if let path = Bundle.main.path(forResource: "chime", ofType: "mp3"){
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch  {
                print("No music found")
            }
        }
    }
    private func playComplete(){
        if let path = Bundle.main.path(forResource: "complete", ofType: "mp3"){
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch  {
                print("No music found")
            }
        }
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
