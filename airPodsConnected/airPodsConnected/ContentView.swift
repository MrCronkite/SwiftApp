//
//  ContentView.swift
//  airPodsConnected
//
//  Created by admin1 on 12.03.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View{
    var body: some View{
          
        NavigationView{
            
            List{
                ForEach(1...30,id: \.self){index in
                
                                           NavigationLink{
                    Text("Detail Page \(index)")
                        .navigationBarTitle("Detail")
                } label: {
                    Text("Navigation to Page \(index)")
                }
                
            }
                .navigationTitle("Home")
                .toolbar {
                    Button("Show HUD"){
                        
                    }
                }
            }
            
        }
        
    }
}
