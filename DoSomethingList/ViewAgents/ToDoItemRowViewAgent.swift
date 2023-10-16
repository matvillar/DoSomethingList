//
//  ToDoItemRowViewAgent.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoItemRowViewAgent: ObservableObject {
    @Published var isDoneCheck: Bool = false
    
    func isDoneCheck(item: ToDoItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("Todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
