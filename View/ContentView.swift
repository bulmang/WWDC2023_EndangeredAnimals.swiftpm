//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/08.
//

//
//  SwiftUIView.swift
//
//
//  Created by 하명관 on 2023/04/08.
//
import SwiftUI
import Vision

struct ContentView: View {
    
    var body: some View {
        
        MainView()

    }
    
}
// ContentView를 미리보기하기 위한 코드
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}







