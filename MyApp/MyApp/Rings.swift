//
//  Rings.swift
//  MyApp
//
//  Created by Yiğit Özok on 20.12.2022.
//

import SwiftUI

struct Ring:Identifiable{ // aynı isimli stringlerin anlaşılmasını sağlıyor.
    var id = UUID().uuidString // unique kimlikler oluşmasını sağlıyor
    var progress : CGFloat // Double ve ya Float oluyorsa bu şekilde tanımlayabiliriz.
    var value : String
    var keyIcon : String
    var keyColor : Color
    var isText : Bool = false
}
var rings : [Ring] = [
    Ring(progress: 72, value: "Steps", keyIcon: "figure.walk", keyColor: Color("FosforluGreen")),
    Ring(progress: 36, value: "Calories", keyIcon: "flame.fill", keyColor: Color(.red)),
    Ring(progress: 91, value: "Sleep Time", keyIcon: "😴", keyColor: Color(.purple),isText: true)

    ]

