//
//  ToDoItemRowView.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//

import SwiftUI

struct ToDoItemRowView: View {
    let item: ToDoItem
    @StateObject var toDoItemRowViewAgent = ToDoItemRowViewAgent()
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text(item.title)
                    .font(.system(size: 16)).bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated , time: .shortened))")
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            Button(action: {
//             toggle checkmark
                toDoItemRowViewAgent.isDoneCheck(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            })
            
        }
    }
}

//#Preview {
//    ToDoItemRowView(item: <#T##ToDoItem#>)
//}
