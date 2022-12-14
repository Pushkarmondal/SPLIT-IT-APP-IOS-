//
//  ContentView.swift
//  Wesplit
//
//  Created by pushkar mondal on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var CheckAmount = 0.0
    @State private var NumberOfPeople = 2
    @State private var Tip = 20
    @FocusState private var amountisfocused:Bool
    
    let Tips = [10,20,30,40,50]
    
    var totalperperson: Double{
        let peoplecount = Double(NumberOfPeople + 2)
        let tipselect = Double(Tip)
        
        let tipvalue = CheckAmount / 100 * tipselect
        let total = CheckAmount + tipvalue
        let amountperhead = total / peoplecount
        
        return amountperhead
    }
    
    
   var body: some View {
       NavigationView{
           Form{
               Section{
                   TextField("Amount",value: $CheckAmount,format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                       .focused($amountisfocused)
                   Picker("NUMBER OF PEOPLE",selection: $NumberOfPeople){
                       ForEach(2..<100){
                           
                           Text("\($0) PEOPLE")
                       }
                   }
                   
               }
               Section{
                   Picker("TIP PERCENTAGE",selection: $Tip){
                       ForEach(Tips,id: \.self){
                           Text($0,format:.percent)
                       }
                   }.pickerStyle(.segmented)
               }header: {
                   Text("HOW MUCH TIP DO YOU WANT?")
               }
               Section{
                   Text(totalperperson,format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
               }
               
           }
           .navigationTitle("SPLIT IT")
           .toolbar{
               ToolbarItemGroup(placement: .keyboard){
                   Button("DONE"){
                       amountisfocused = false
                   }
               }
           }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
