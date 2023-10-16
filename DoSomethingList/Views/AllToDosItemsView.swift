//
//  AllToDosItemsView.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct AllToDosItemsView: View {
    @StateObject var allToDosItemsViewAgent: AllToDosItemsViewAgent
    @FirestoreQuery var items: [ToDoItem]
    
    
    private let userId: String
    
    
    // The init method is a special setup functioon that can pass data to my view
    init(userId: String){
        self.userId = userId
        
        // users/
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/Todos")
        self._allToDosItemsViewAgent = StateObject(wrappedValue: AllToDosItemsViewAgent(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack {
                List(items){ item in
                    ToDoItemRowView(item: item)
                        .swipeActions{
                            Button(action: {
                                //                                Delete
                                allToDosItemsViewAgent.deleteItem(id: item.id)
                            }, label: {
                                Text("Delete")
                                
                            })
                            .tint(.red)
                        }
                    
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("Work In Progress")
            .toolbar {
                Button{
                    allToDosItemsViewAgent.showingNewItemSheet.toggle()
                }label: {
                    Image(systemName: "plus").bold()
                }
                .sheet(isPresented: $allToDosItemsViewAgent.showingNewItemSheet, content: {
                    NewItemView(newItemIsPresented: $allToDosItemsViewAgent.showingNewItemSheet)
                })
            }
        }
        
    }
}
#Preview {
    AllToDosItemsView(userId: "1ot9bSrtVaOlG2J7BRropeUveQz1")
}
