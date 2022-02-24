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
    
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time  = Timer.publish(every: 1,  on: .main, in: .common).autoconnect()
    
    
    var body: some View{
        ZStack{
            
            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
            
              
            VStack{
                
                ZStack{
                    
                    
                    Circle()
                        .trim(from:0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280, height: 280)
                    
                    Circle()
                        .trim(from:0, to: self.to)
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280, height: 280)
                        .rotationEffect(.init(degrees: -90))
                    
                    
                    VStack{
                        Text("\(self.count)")
                            .font(.system(size: 65))
                            .fontWeight(.bold)
                        Text("Of 15")
                            .font(.title)
                            .padding(.top)
                    }
                }
                
                HStack(spacing: 20){
                   
                    Button(action: {
                        
                    }){
                        HStack(spacing: 15){
                            Image(systemName: self.start ? "pause.fill": "play.fill")
                                .foregroundColor(.white)
                            Text(self.start ? "Pause" : "Play")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 55)
                        .background(Color.red)
                        .clipShape(Capsule())
                    }
                    
                    Button(action: {
                        
                    }){
                        HStack(spacing: 15){
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.white)
                            Text("Restart")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 55)
                        .background(Color.red)
                        .clipShape(Capsule())
                    }
                    
                }
                
            }
            
        }
        .onReceive(self.time){(_) in
            print("hello ")
        }
    }
}
