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
            .overlay(HUDView(image: "airpodspro", color: .primary, title: "Connected"))
            
        }
        
    }
}


extension View{
    
    func showHUD(image: String, color: Color = .primary,title: String){
        
    }
}


struct HUDView: View{
    
    var image: String
    var color: Color
    var title: String
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View{
        HStack(spacing: 10){
         
            Image(systemName: image)
                .font(.title3)
                .foregroundColor(color)
            
            Text(title)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(
            scheme == .dark ? Color.black :  Color.white
        )
        .clipShape(Capsule())
        .shadow(color: Color.primary.opacity(0.1), radius: 5, x: 1, y: 5)
        .shadow(color: Color.primary.opacity(0.03), radius: 5, x: 0, y: -5)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
