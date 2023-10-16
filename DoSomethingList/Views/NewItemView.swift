//
//  NewItemView.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var newItemViewAgent = NewItemViewAgent()
    @Binding var newItemIsPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Form {
                TextField("Title", text: $newItemViewAgent.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $newItemViewAgent.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button Save
            ButtonSave()
                    .alert(isPresented: $newItemViewAgent.showAlert, content: {
                        Alert(title: Text("Error"), message: Text("Fill all fields and select correct date ."))
                    })
                
            }
        }
    }
    
    @ViewBuilder func ButtonSave() -> some View {
        Button(action: {
            
            if newItemViewAgent.canSave {
               newItemViewAgent.save()
                newItemIsPresented = false
            } else {
                newItemViewAgent.showAlert = true
            }
        })
        {
            Text("Save")
                .font(.title3)
                .foregroundColor(.white).bold()
                .padding()
                .horAlign(.center)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.cyan]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(10)
                .padding()
            
        }
       
    }
}

#Preview {
    NewItemView(newItemIsPresented: .constant(true))
}
