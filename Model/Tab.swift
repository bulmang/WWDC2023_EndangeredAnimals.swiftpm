//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/19.
//

import SwiftUI

// Tab Model With Tab Items....

struct Tab: Identifiable {
    
    var id = UUID().uuidString
    var tab : String
    var animals: [Animal]
}
var tabsItems = [

    Tab(tab: "Facts", animals: animals.shuffled()),
    Tab(tab: "Why They Matter", animals: animals.shuffled()),
    Tab(tab: "Threats", animals: animals.shuffled()),
    Tab(tab: "Picture Description", animals: animals.shuffled()),
]

struct Animal: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var image: String
}

var animals = [

    Animal(title: "Facts", description: """
 African forest elephants are the elusive cousin of the African savanna elephant. They inhabit the dense rainforests of west and central Africa. Their preference for dense forest habitat prohibits traditional counting methods such as visual identification. Their population is usually estimated through "dung counts"—an analysis on the ground of the density and distribution of the feces.

 African forest elephants are smaller than African savanna elephants, the other African elephant species. Their ears are more oval-shaped and their tusks are straighter and point downward (the tusks of savanna elephants curve outwards). There are also differences in the size and shape of the skull and skeleton. Forest elephants also have a much slower reproductive rate than savanna elephants, so they cannot bounce back from population declines as quickly at the same rate. Their last strongholds are located in Gabon and the Republic of Congo, with smaller populations remaining in other African countries (Cameroon, Central African Republic, Equatorial Guinea) and Côte d'Ivoire, Liberia, and Ghana in west Africa.

 African forest elephants live in family groups of up to 20 individuals and forage on leaves, grasses, seeds, fruit, and tree bark. Since the diet of forest elephants is dominated by fruit, they play a crucial role in dispersing many tree species, particularly the seeds of large trees which tend to have high carbon content. They are therefore referred to as the 'mega-gardener of the forest'. To supplement their diet with minerals, they gather at mineral-rich waterholes and mineral licks found throughout the forest.
 """, price: "$19",image: "choclates"),

]
