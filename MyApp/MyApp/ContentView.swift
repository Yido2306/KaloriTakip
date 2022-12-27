//
//  ContentView.swift
//  MyApp
//
//  Created by Yiğit Özok on 17.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        ZStack{
            LinearGradient(colors: [Color("DarkGreen"),.blue.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack{
                HeaderTopic()
                Spacer().frame(height:9)
                Divider()
                Spacer().frame(height: 1)
                UserInformation(item: BodyInformations)
                Spacer().frame(height:20)
                Days(item: days)
                Spacer().frame(height: 40)
                TotalCalori()
               
            }
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)

       
       
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct HeaderTopic : View{
    var body: some View{
        
        HStack(){
            Image("kosanAdam")
                .resizable()
                .frame(width: 50,height: 50)
                .clipShape(Capsule())
            Text("Bee Fit")
                .font(.system(size:40,weight:.semibold,design: .rounded))
        }
        
        
        
    }
}
struct Divider : View{
    var body : some View{
        Rectangle()
            .frame(width: .infinity,height: 0.5)
            .background(Color.black)
            .shadow(radius: 5)
    }
}
struct UserInformation : View{
    
    var item : [BodyInformation]
    var body: some View{
        
        HStack(alignment:.center,spacing:20){
            VStack(spacing:7){
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 80,height: 90)
    
                    .shadow(radius:10)
                Text("Yigit Özok")
                    .font(.system(size: 15,weight: .semibold,design:.default))
            }
            .padding()
            .offset(x:10,y:10)
    
            VStack(spacing: 5){
                Text("30/10/22   Thuersday")
                    .padding(.trailing,130)
                    .frame(width: 250)
                    .font(.system(size:11,weight: .semibold,design: .rounded))
                    .foregroundColor(Color.black.opacity(0.7))
                    CircleCaloriView()
            }.padding(.trailing)
        }.padding()
    }
}
struct BodyInformationCustomer : View{
    var item : BodyInformation
    var body: some View{
        
        VStack(alignment:.leading,spacing: 3){
            Text(item.text)
                .font(.system(size: 12,weight: .semibold,design:.monospaced))
                    .lineLimit(1)
            Text(item.text2)
            .font(.system(size: 10,weight: .regular))
        }
        .padding(.trailing, 60.0)
        .frame(width: 130, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
        .background(Color("Acik1Blue").opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius:16).stroke(Color.white.opacity(0.3)))
        .shadow(radius:5)
    }
}
struct Days: View{
    var item : [Day]
    var body: some View{
        HStack(alignment: .center){
            ScrollView(showsIndicators: false){
                VStack(spacing:40){
                    ForEach(days,id: \.self){ item in
                        Button(action:{}){
                            DayButtons(item: item)
                        }
                    }
                }
            }
            .rotation3DEffect(Angle(degrees: 10), axis:( (x:100.0,y:400.0,z:0.0)))
            ScrollView(showsIndicators: false){
                VStack(spacing: 11){
                    
                    MealsView(meals: Meals)
                }
                
            }
                
        }
        .frame(width: 400,height: 300)
    }
}
struct MealsView : View{
    var meals : [Meal]
    var body: some View{
        ForEach(meals,id: \.self) { meal in
                MealCustomer(item: meal)
            }
        
    }
}
struct MealCustomer :View{
    var item : Meal
    var body: some View{
        ZStack{
            Image(item.image)
                .resizable()
                .opacity(0.68)
            HStack(alignment: .center){
                VStack(alignment: .leading){
                    Text(item.text.uppercased())
                        .font(.system(size: 12,weight: .bold,design: .monospaced))
                        .foregroundColor(Color("DarkGreen"))
                    
                    HStack{
                        Text("Fat : -")
                        Text("Protein : -")
                        Text("Carb : -")
                        Text("Total : -")
                    }
                    .font(.system(size: 10,weight: .medium,design: .rounded))
                }
                .padding(.trailing,30)
                Button(action: {}){
                    Image(systemName: "plus")
                        .frame(width:22 ,height: 22)
                        .background((Color("DarkGreen").opacity(0.1)))
                        .foregroundColor(Color("DarkGreen"))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.2) ))
                    
                }
            }
            .frame(width: 250,height: 42)
            .background(Color.white.opacity(0.65))
            .clipShape(RoundedRectangle(cornerRadius: 7.5))
            
        }
        
        .frame(width:270,height: 150)
        .cornerRadius(15)
        
        
       
    }
}
struct Meal :Hashable {
    var text : String
    var image : String
    
}
let Meals : [Meal] = [
    Meal(text: "Breakfast",image :"Breakfast"),Meal(text: "Lunch",image:"Lunch"),
    Meal(text: "Dinner",image:"Dinner"),Meal(text: "Snacks",image:"Snacks")
]
struct CircleCaloriView : View{
    var body: some View{
        VStack(spacing: 15){
            Text("Progress")
                .fontWeight(.semibold)
                .frame(maxWidth: 370,alignment: .leading)
            HStack(spacing: 12){
                ZStack{
                    ForEach(rings.indices,id:\.self) { indeks in
                        AnimatedRingView(ring: rings[indeks], index: indeks)
                    }
                }.frame(width: 90)
                VStack(alignment: .leading,spacing:13){
                    ForEach(rings){ring in
                            Label{
                                HStack(alignment:.center, spacing: 6){
                                    Text("\(Int(ring.progress))%")
                                        .font(.system(size: 10,weight:.semibold,design: .monospaced))
                                    Text(ring.value)
                                        .font(.caption)
                                }
                                
                            }icon: {
                                Group{
                                    if ring.isText{
                                        Text(ring.keyIcon)
                                        
                                    }
                                    else{
                                        Image(systemName: ring.keyIcon)
                                        
                                    }
                                }.frame(width:20)
                            }
        
                    }
                }
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        .background(
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.ultraThinMaterial)
        )
    }
}
struct TotalCalori : View{
    var body: some View{
        HStack(){
            let colums = [GridItem(.fixed(180)),GridItem(.fixed(180))]
            LazyVGrid(columns:colums,spacing:30){
                ForEach(BodyInformations,id: \.self) { item in
                    BodyInformationCustomer(item: item)
                        
                }
            }
        }
        

    }
}
struct AnimatedRingView : View{
    var ring: Ring
    var index : Int
    @State var showRing : Bool = false
    var body: some View{
        ZStack{// iki tane çember oluşturuyoruz ve o çemberlerin birbirinin üzerine gelmesini isitiyoruz
            Circle()
                .stroke(.gray.opacity(0.45),lineWidth: 5)
            Circle()//renkli olan çemberleri
                .trim(from: 0, to: showRing ? rings[index].progress/100 : 0)
                .stroke(rings[index].keyColor,style: StrokeStyle(lineWidth: 5,lineCap: .round,lineJoin: .round))
                .rotationEffect(.init(degrees: -90))
        }
        .padding(CGFloat(index)*15)// circler arasınad ki boşluk
        .onAppear{
            //Show After Intial Animation Finished
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                withAnimation(.interactiveSpring(response: 1,dampingFraction: 1).delay(Double(index)*0.1)){
                    showRing = true
                }
            }
        }
    }
}


