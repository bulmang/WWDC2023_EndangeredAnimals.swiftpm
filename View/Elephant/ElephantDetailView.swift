//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/18.
//

import SwiftUI

struct ElephantDetailView: View {
    @StateObject var homeData = HomeViewModel()
    // For Dark Mode Adoption....
    @Environment(\.colorScheme) var scheme
    
    @State var isMainActive: Bool = false
    var body: some View {
        
        NavigationView {
            ScrollView{
                
                // Since Were Pinning Header View....
                LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                    
                    // Parallax Header....
                    
                    GeometryReader{reader -> AnyView in
                        
                        let offset = reader.frame(in: .global).minY
                        
                        if -offset >= 0{
                            DispatchQueue.main.async {
                                self.homeData.offset = -offset
                            }
                        }
                        
                        return AnyView(
                        
                            Image("AfricaElephantPicture")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: 550 + (offset > 0 ? offset : 0))
                                .cornerRadius(2)
                                .offset(y: (offset > 0 ? -offset : 0))
                                .overlay(
                                
                                    HStack{
                                        
                                        NavigationLink(destination: MainView(), isActive: $isMainActive) {
                                            Button(action: {
                                                isMainActive = true
                                            }, label: {
                                                Text("Back to Africa")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(.white)
                                                    .background {
                                                        Rectangle()
                                                            .fill(Color(.black))
                                                            .cornerRadius(20)
                                                            .shadow(color: Color.black, radius: 1, y: 2)
                                                            .frame(width: 200,height: 30)
                                                    }
                                                    
                                            })
                                        }.navigationBarBackButtonHidden(true)
                                        
                                        Spacer()
                                        
                                        
                                    }
                                    .padding(),
                                    alignment: .top
                                )
                        )
                    }
                    .frame(height: 550)
                    
                    // Cards......
                    
                    Section(header: HeaderView()) {

                        
                        Text("Facts")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Text(
        """
     African forest elephants are the elusive cousin of the African savanna elephant. They inhabit the dense rainforests of west and central Africa. Their preference for dense forest habitat prohibits traditional counting methods such as visual identification. Their population is usually estimated through "dung counts"—an analysis on the ground of the density and distribution of the feces.

     African forest elephants are smaller than African savanna elephants, the other African elephant species. Their ears are more oval-shaped and their tusks are straighter and point downward (the tusks of savanna elephants curve outwards). There are also differences in the size and shape of the skull and skeleton. Forest elephants also have a much slower reproductive rate than savanna elephants, so they cannot bounce back from population declines as quickly at the same rate. Their last strongholds are located in Gabon and the Republic of Congo, with smaller populations remaining in other African countries (Cameroon, Central African Republic, Equatorial Guinea) and Côte d'Ivoire, Liberia, and Ghana in west Africa.

     African forest elephants live in family groups of up to 20 individuals and forage on leaves, grasses, seeds, fruit, and tree bark. Since the diet of forest elephants is dominated by fruit, they play a crucial role in dispersing many tree species, particularly the seeds of large trees which tend to have high carbon content. They are therefore referred to as the 'mega-gardener of the forest'. To supplement their diet with minerals, they gather at mineral-rich waterholes and mineral licks found throughout the forest.
     """)
                        
                        
                        Text("Why They Matter")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Text("Forest elephants are found in dense forests and are essential for the germination of many rain forest trees. The seeds of these trees only germinate after passing through the elephant’s digestive tract.")
                        
                        Text("Threats")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Text(
        """
     HABITAT LOSS AND FRAGMENTATION
     African elephants have less room to roam than ever before as expanding human populations convert land for agriculture, settlements and developments. The elephants’ range shrank from three million square miles in 1979 to just over one million square miles in 2007. Commercial logging, plantations for biofuels and extractive industries like logging and mining not only destroy habitat but also open access to remote elephant forests for poachers. Poverty, armed conflict and the displacement of people by civil conflict also add to habitat loss and fragmentation. All of these push elephants into smaller islands of protected areas and hinder elephants’ freedom to roam.

     HUMAN-ELEPHANT CONFLICT
     As habitats contract and human populations expand, people and elephants are increasingly coming into contact with each other. Where farms border elephant habitat or cross elephant migration corridors, damage to crops and villages can become commonplace. This often leads to conflicts that elephants invariably lose. But loss of life can occur on both sides, as people may be trampled while trying to protect their livelihoods, and game guards often shoot "problem" elephants.
     """)
                        
                        Text("Picture description")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Image("ElephantPictureDescription")
                            .resizable()
                            .scaledToFit()
                        
                        Text("This painting depicts a brutal killing of an elephant in order to obtain its horns.")
                        
                        
                        
                        
                    }
                    .padding(.horizontal,50)
                })
            }
            .overlay(
            
                // Only Safe Area....
                (scheme == .dark ? Color.black : Color.white)
                    .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .ignoresSafeArea(.all, edges: .top)
                    .opacity(homeData.offset > 250 ? 1 : 0)
                ,alignment: .top
            )
            // Used It Environment Object For Accessing All SUb Objects....
        .environmentObject(homeData)
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
