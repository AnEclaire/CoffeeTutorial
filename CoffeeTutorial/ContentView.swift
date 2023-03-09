//
//  ContentView.swift
//  CoffeeTutorial
//
//  Created by Emma Gutierrez on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    @StateObject var history = History()
    @State private var showingAddScreen = false
    
    var totalCaffeine: Int {
        history.servings.map(\.caffeine).reduce(0, +) //add all values in array from 0 to n and add
    }
    
    var totalCalories: Int {
        history.servings.map(\.calories).reduce(0, +) //add all values in array from 0 to n and add
    }
    
    var body: some View {
        NavigationView {
            List {
                if history.servings.isEmpty {
                    Button("Add your first drink") {
                        showingAddScreen = true
                    }
                } else {
                    Section("Summary") {
                        Text("Caffeien: \(totalCaffeine)mg")
                        Text("Calories: \(totalCalories)")
                    }
                    ForEach(history.servings) { serving in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(serving.name)
                                    .font(.headline)
                                
                                Text(serving.descrtiption)
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            Text("\(serving.caffeine)mg")
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    history.delete(serving)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                            Button {
                                withAnimation {
                                    history.reorder(serving)
                                }
                            } label: {
                                Label("Repeat", systemImage: "repeat")
                            }
                            .tint(.blue)
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen, content: MenuView.init)
            .navigationTitle("Coffee Tutorial")
            .toolbar {
                Button {
                    showingAddScreen = true
                } label: {
                    Label("Add New Drink", systemImage: "plus")
                }
            }
        }
            .environmentObject(menu)
            .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
