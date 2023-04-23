//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/11.
//

import SwiftUI

struct MainView: View {
    
    @State var isElephantActive: Bool = false
    @State var isBlackRhinoActive: Bool = false
    @State var isGorillaActive: Bool = false
    
    @State var animaton: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .center){
                
                
                GeometryReader { geo in
                    
                    Image("Earth")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .animation(.default)
                        
                        Image("ElephantMarker")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width/5,height: geo.size.height/3)
                            .overlay(
                                NavigationLink(destination: ElephantDrawingView(isElephantActive: $isElephantActive), isActive: $isElephantActive) {
                                    Button(action: {
                                        isElephantActive = true
                                    }, label: {
                                        Circle()
                                            .opacity(0)
        //                                    .foregroundColor(Color.white.opacity(0.1))
//                                            .stroke(Color.black, lineWidth: 10) // 터치 영역 확장을 위해 투명한 경계를 추가
                                            .frame(width: geo.size.width/5, height: geo.size.height/3.7) // 버튼의 터치 영역을 원하는 크기로 조정

//                                            .background(.red)
                                            
                                    })
                                    
                                    
                                }

                            )
                            .position(x: geo.size.width/3, y: geo.size.height/6)
                            .animation(.spring(response: 1, dampingFraction: 0.6, blendDuration: 0.6))
//                            .padding(.trailing,350)

                    Image("GorillaMarker")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width/5,height: geo.size.height/3)
                        .overlay(
                            NavigationLink(destination: GorillaDrawingView(isElephantActive: $isGorillaActive), isActive: $isGorillaActive) {
                                Button(action: {
                                    isGorillaActive = true
                                }, label: {
                                    Circle()
                                        .opacity(0)
    //                                    .foregroundColor(Color.white.opacity(0.1))
//                                            .stroke(Color.black, lineWidth: 10) // 터치 영역 확장을 위해 투명한 경계를 추가
                                        .frame(width: geo.size.width/5, height: geo.size.height/3.7) // 버튼의 터치 영역을 원하는 크기로 조정
//                                            .background(.red)
                                        
                                })
                                
                                
                            }

                        )
                        .position(x: geo.size.width/1.69, y: geo.size.height/3.5)
                        .animation(.spring(response: 2.0, dampingFraction: 0.55, blendDuration: 0.6))
                    
                    Image("BlackRhinoMarker")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width/5,height: geo.size.height/3)
                        .overlay(
                            NavigationLink(destination: BlackRhinoDrawingView(isElephantActive: $isBlackRhinoActive), isActive: $isBlackRhinoActive) {
                                Button(action: {
                                    isBlackRhinoActive = true
                                }, label: {
                                    Circle()
                                        .opacity(0)
    //                                    .foregroundColor(Color.white.opacity(0.1))
//                                            .stroke(Color.black, lineWidth: 10) // 터치 영역 확장을 위해 투명한 경계를 추가
                                        .frame(width: geo.size.width/5, height: geo.size.height/3.7) // 버튼의 터치 영역을 원하는 크기로 조정
//                                            .background(.red)
                                        
                                })
                                
                                
                            }

                        )
                        .position(x: geo.size.width/1.7, y: geo.size.height/1.5)
                        .animation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.6))
                    
                    
                        
                }
            }
            .background(Color("MainColor"))
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }

}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
