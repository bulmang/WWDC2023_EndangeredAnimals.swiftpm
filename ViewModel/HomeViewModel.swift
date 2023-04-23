//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/19.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    @Published var offset: CGFloat = 0
    
    // Selected Tab....
    @Published var selectedtab = tabsItems.first!.tab
}
