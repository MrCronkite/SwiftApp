//
//  ContentView.swift
//  Timer
//
//  Created by admin1 on 23.01.22.
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

struct Home : View{
    
    var body: some View{
        ZStack{
            
            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
            
            
            ZStack{
                Circle()
                    .trim(from:0, to: 1)
                    .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                    .frame(width: 280, height: 280)
            }
        }
    }
}
