//
//  ListViewModel.swift
//  TodoList
//
//  Created by Mohammed Hashim on 25/11/1444 AH.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "Items_List"
    
    
    init() {
        getItems()
    }
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is the first Item!", isCompleted: false),
//            ItemModel(title: "This is the Second!", isCompleted: true),
//            ItemModel(title: "Third", isCompleted: false)
//
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel) {
        //       if let index = items.firstIndex { (existingItem) -> Bool in
        //            return existingItem.id == item.id
        //       } {
        //
        //       }
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompleteion()
        }
        
    }
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
