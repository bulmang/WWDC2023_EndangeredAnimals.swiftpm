//
//  Intro.swift
//  Taico
//
//  Created by 하명관 on 2022/11/16.
//

import SwiftUI

struct Intro: Identifiable{
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    var subtitle: String
}

var intros: [Intro] = [
    .init(imageName: "Africa", title: "Terrible things are happening in Africa.",subtitle:""),
    .init(imageName: "AfricaElephant", title: "What happened to this animal?", subtitle: ""),
    .init(imageName: "BlackRhino", title: "Take a picture and see the truth", subtitle: "Caution! If you don't draw similarly, you will have to redraw")
]


let dummyText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is dummy text."
