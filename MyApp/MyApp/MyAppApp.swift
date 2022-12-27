//
//  MyAppApp.swift
//  MyApp
//
//  Created by Yiğit Özok on 17.12.2022.
//

import SwiftUI

@main
struct MyAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
/*
HStack{
    let colums = [GridItem(.fixed(140)),GridItem(.fixed(140))]
    LazyVGrid(columns:colums,spacing:10){
        ForEach(BodyInformations,id: \.self) { item in
            BodyInformationCustomer(item: item)
                
        }
    }.padding(.trailing)
}
*/

/*struct CircleCaloriView : View{
    var body: some View{
        VStack(spacing: 15){
            Text("Progress")
                .fontWeight(.semibold)
                .frame(maxWidth: 370,alignment: .leading)
            HStack(spacing: 20){
                ZStack{
                    ForEach(rings.indices,id:\.self) { indeks in
                        ZStack{// iki tane çember oluşturuyoruz ve o çemberlerin birbirinin üzerine gelmesini isitiyoruz
                            Circle()
                                .stroke(.gray.opacity(0.55),lineWidth: 10)
                            Circle()//renkli olan çemberleri
                                .trim(from: 0, to: rings[indeks].progress/100)
                                .stroke(rings[indeks].keyColor,style: StrokeStyle(lineWidth: 10,lineCap: .round,lineJoin: .round))
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(CGFloat(indeks)*16)// circler arasınad ki boşluk
                    }
                }.frame(width: 130)
                VStack(alignment: .leading,spacing:15){
                    ForEach(rings){ring in
                        Label{
                            HStack(alignment:.center, spacing: 6){
                                Text("\(Int(ring.progress))%")
                                    .font(.title3.bold())
                                Text(ring.value)
                                    .font(.caption)
                                
                            }
                        }icon: {
                            Group{
                                if ring.isText{
                                    Text(ring.keyIcon)
                                        .font(.title2)
                                }
                                else{
                                    Image(systemName: ring.keyIcon)
                                        .font(.title2)
                                }
                            }.frame(width:30)
                        }
                    }
                }
            }
        }
        .padding(.horizontal,15)
        .padding(.vertical,10)
        .background{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.ultraThinMaterial)
        }.frame(width: 350, height: 220)
    }
}

*/
