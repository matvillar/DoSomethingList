//
//  ToDoItem.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    let id : String
    let title : String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    
    // This func is set to be mutating because is modifien the struct property isDone, this changes the struct internal properties
    mutating func setDone (_ state: Bool){
        isDone = state
    }
}

