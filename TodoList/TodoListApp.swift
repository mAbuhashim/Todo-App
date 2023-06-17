//
//  TodoListApp.swift
//  TodoList
//
//  Created by Mohammed Hashim on 25/11/1444 AH.
//

import SwiftUI


/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages models for view
 
 */

@main
struct TodoListApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
            
        }
    }
}
