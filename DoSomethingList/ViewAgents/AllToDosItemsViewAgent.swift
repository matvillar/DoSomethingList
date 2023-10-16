//
//  AllToDosItemsViewAgent.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//
import FirebaseFirestore
import Foundation

class AllToDosItemsViewAgent: ObservableObject {
    @Published var showingNewItemSheet: Bool = false
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    
    // delete todolistitem by item ID
    func deleteItem(id: String){
        let db = Firestore.firestore()
       
        // .document is the id pf user
        db.collection("users")
            .document(userId)
            .collection("Todos")
            .document(id)
            .delete()
    }
    
    
}
