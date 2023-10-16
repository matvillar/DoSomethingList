//
//  Extensions.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//

import Foundation
import SwiftUI

// Create some view extensions for our UI

extension View{
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
    
    func horAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    func verAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    


    func customFillView( _ color: Color) -> some View{
        self
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background{
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(color)
            }
    }
    // Some custom border Views and padding
    
    func borderView(_ width: CGFloat, _ color: Color) -> some View{
        self
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background{
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(color, lineWidth: width)
            }
    }
}

extension Color {
    public static var myGray: Color {
        return Color(UIColor(red: 207/255, green: 209/255, blue: 208/255, alpha: 1))
    }
}
extension Color {
    public static var darkPurple: Color {
        return Color(UIColor(red: 67/255, green: 35/255, blue: 113/255, alpha: 1))
    }
}
extension Color {
    public static var lightPurple: Color {
        return Color(UIColor(red: 232/255, green: 28/255, blue: 255/255, alpha: 1))
    }
}
extension Color {
    public static var lightPink: Color {
        return Color(UIColor(red: 255/255, green: 183/255, blue: 183/255, alpha: 1))
    }
}


// Encodable

extension Encodable {
    // WHen we push data to the data base it need to be in json aka a dictionary [String: Any]
    // the func will get any data that is encodable aka json.
    func asDictionary()-> [String: Any] {
        // we create a guard so we can use try? and we try top encode the json
        guard let data = try? JSONEncoder().encode(self) else{
            // if nothing happens we return an empty dictionary
            return [:]
        }
        
        do {
            // json is = dictionary
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
