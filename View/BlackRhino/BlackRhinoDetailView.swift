//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/19.
//

import SwiftUI

struct BlackRhinoDetailView: View {
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
                        
                            Image("BlackRhinoDetailPicture")
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
                    
                    Section(header: BlackRhinoHeaderView()) {

                        
                        Text("Facts")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Text(
        """
     Among black and white rhinos, black rhinos are the smaller of the two African rhino species. Black and white rhinos can be distinguished by the shape of their lips. Black rhinos have hooked upper lips, whereas white rhinos are characterized by a square lip. Black rhinos are browsers, rather than grazers, meaning they are herbivores who do not feed on low-growing vegetation, and their pointed lip helps them feed on leaves from bushes and trees. They have two horns, which grow continually from the skin at their base throughout the rhino’s life (like human fingernails). The front horn is longer than the rear horn, averaging around 19 inches long.

     The population of black rhinos declined dramatically in the 20th century at the hands of European hunters and settlers. Between 1960 and 1995, black rhino numbers dropped by a sobering 98%, to less than 2,500 individuals. Since then, the species has made a tremendous comeback from the brink of extinction. Thanks to persistent conservation efforts across Africa, black rhino numbers have doubled from their historic low 20 years ago to more than 6,000 today. However, the black rhino is still considered critically endangered, and a lot of work remains to bring their population up to even a fraction of what it once was—and to ensure that it stays there. Wildlife crime—in this case, poaching of rhinos for the illegal international market for their horns—continues to plague the species and threaten its recovery.
     """)
                        
                        
                        Text("Why They Matter")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Text(
                            "Rhinos are one of the oldest groups of mammals, virtually living fossils. They play an important role in their habitats, and in countries like Namibia, rhinos are an important source of income from ecotourism. This is especially true for local communities in the arid northwestern parts of the country, which are home to Africa’s largest free-roaming black rhino population. Since black rhinos need large territories to survive, their protection benefits many other species, including elephants.")
                        
                        Text("Threats")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Text(
        """
     ILLEGAL WILDLIFE TRADE
     Of all the threats facing black rhinos, poaching is the deadliest. Black rhinos have two horns, which make them lucrative targets for the illegal trade in rhino horn. Due to intense poaching, 96% of the population was wiped out between 1970 and 1990. Political instability and wars have also greatly hampered rhino conservation work over the last decades in places like Angola, the Democratic Republic of the Congo, Rwanda, Somalia, and Sudan.

     Black rhinos remain critically endangered because of demand for rhino horns on the illegal international market, mainly in Asia, where rhino horn is used for traditional medicine, and increasingly as a status symbol to display success and wealth. Between 2008 and 2021, around 11,000 rhinos were poached in Africa. A recent increase in poaching in South Africa threatens to erase our conservation success, reaching an apex in 2014 when 1,215 rhinos were poached. As a sign of hope, increasingly more experts in traditional Chinese medicine no longer support the use of rhino horn and promote herbal ingredients as a replacement.
     """)
                        
                        
                        Text("Picture description")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Image("BlackRhinoPictureDescription")
                            .resizable()
                            .scaledToFit()
                        
                        Text("This picture is a picture without a horn because the government cut off the rhino before being killed by poachers.")
                            
                        
                        
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

