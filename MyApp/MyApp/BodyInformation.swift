//
//  BodyInformation.swift
//  MyApp
//
//  Created by Yiğit Özok on 18.12.2022.
//

import Foundation
struct BodyInformation : Hashable{
    var text : String
    var text2 : String
}
let BodyInformations : [BodyInformation] = [
    BodyInformation(text: "Fat",text2: "20.3 gr"),
    BodyInformation(text: "Protein",text2: "132.8 gr"),
    BodyInformation(text: "Carb",text2: "252.9"),
    BodyInformation(text: "Total", text2: "2900.32 kcal")
]
