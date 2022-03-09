//
//  ContentView.swift
//  TwitterScreen
//
//  Created by admin1 on 8.03.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SplashScreen: View{
    
    @State var splashAnimation: Bool = false
    
    var body: some View{
        ZStack{
            
            
            Image("homeDark")
                .resizable()
                .aspectRatio(contentMode: .fill)
                
            
            Color("BG")
                .mask(
                   Rectangle()
                    .overlay(
                        Image("logo_svg")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 80, height: 80)
                            .scaleEffect(splashAnimation ? 40:1 )
                         .blendMode(.destinationOut)
                     
                    )
                )
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.4)){
                        splashAnimation.toggle()
                    }
                }
        }
        .ignoresSafeArea()
    }
}

