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
                        showHUD(image: "airpodspro", color: .green, title: "Connected"){
                            status, msg in
                            if !status{
                                print(msg)
                            }
                        }
                    }
                }
            }
            
        }
        
    }
}


extension View{
    
    
    func getRootController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else{
            return .init()
        }
        
        guard let root = screen.windows.last?.rootViewController else{
            return .init()
        }
        return root
    }
    
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    func showHUD(image: String, color: Color = .primary,title: String, completion: @escaping (Bool,String)->()){
        
        if getRootController().view.subviews.contains(where: {view in
            return view.tag == 1009
        }){
            completion(false, "Already Presenting!")
            return
        }
        
        let hudViewController = UIHostingController(rootView: HUDView(image:image, color: color, title: title))
        
        let size = hudViewController.view.intrinsicContentSize
        
        hudViewController.view.frame.size = size
        
        hudViewController.view.frame.origin = CGPoint(x: (getRect().width/2) - (size.width/2), y:50)
        
        hudViewController.view.backgroundColor = .clear
        
        hudViewController.view.tag = 1009
        getRootController().view.addSubview(hudViewController.view)
    }
}


struct HUDView: View{
    
    var image: String
    var color: Color
    var title: String
    
    @Environment(\.colorScheme) var scheme
    
    @State var showHUD: Bool = false

    
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
        .offset(y: showHUD ? 0 : -200)
        .onAppear{
            withAnimation(.easeInOut(duration: 0.5)){
                showHUD = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation(.easeInOut(duration: 0.5)){
                    showHUD = false
                }
                
                DispatchQueue.main.asyncAfter(deadline:  .now()+0.6){
                    getRootController().view.subviews.forEach { view in
                        if view.tag == 1009{
                            view.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }
}
