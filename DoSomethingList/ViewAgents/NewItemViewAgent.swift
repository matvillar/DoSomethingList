//
//  NewItemViewAgent.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewAgent: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    
    
    func save(){
        guard canSave else {
            return
        }
        // Get current user id
        
        guard let uId =  Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create a model
        let newID = UUID().uuidString
        let newItem = ToDoItem(id: newID, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        // Save the model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("Todos")
            .document(newID)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    
}
