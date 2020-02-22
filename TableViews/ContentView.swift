//
//  ContentView.swift
//  TableViews
//
//  Created by Vasileios Gkreen on 22/02/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let countryList: [Country] = [
        Country(id: 1, name: "Italia", population: 60000000),
        Country(id: 2, name: "Grecia", population: 10000000),
        Country(id: 3, name: "Germania", population: 80000000),
        Country(id: 4, name: "Spagna", population: 50000000),
        Country(id: 5, name: "Hollanda", population: 20000000)
    ]
    
    var names = ["Giulia", "Laura", "Bertoni", "Vasilis", "Billy", "Green"]
    
    var body: some View {
        
        NavigationView {
            List(self.countryList, id: \.id){ country in
                NavigationLink(destination: Destination(country: country)) {
                    CellRow(country: country)
                }.navigationBarTitle("Countries")
            }
        }
    }
}


struct Destination: View {
    let country: Country
    
    var body: some View {
        Text("Il popolazione di \(country.name) è \(String(country.population))")
    }
}


struct CellRow: View {
    let country: Country
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(country.name)
                .font(.title)
                .foregroundColor(.gray)
            
            HStack{
                Text("Popolazione: ")
                Text(String(country.population))
                    .italic()
                
            }.foregroundColor(.pink)
                .font(.subheadline)
            
        }
    }
}





//MODEL
struct Country: Identifiable {
    let id: Int
    let name: String
    let population: Int
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
