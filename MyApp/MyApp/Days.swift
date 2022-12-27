//
//  Days.swift
//  MyApp
//
//  Created by Yiğit Özok on 18.12.2022.
//

import Foundation
import SwiftUI
struct DayButtons : View{
    var item : Day
    var body: some View{
        Text(item.dayTittle)
            .frame(width:102.0)
            .fontWeight(.medium)
            .background(item.bodyGroundColor)
            .foregroundColor(Color.black.opacity(0.7))
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.white.opacity(0.3)))
            .padding(4.0)
            
    }
}
struct Day :Hashable{
    var dayTittle : String
    var bodyGroundColor : Color = Color.white.opacity(0.5)
}

let days : [Day] = [
    Day(dayTittle:"Monday"),Day(dayTittle:"Thuesday")
    ,Day(dayTittle:"Wednesday"),Day(dayTittle:"Thuersday",bodyGroundColor: (Color("DarkGreen").opacity(0.5)))
    ,Day(dayTittle:"Friday"),Day(dayTittle:"Saturday")
    ,Day(dayTittle:"Sunday")
]
