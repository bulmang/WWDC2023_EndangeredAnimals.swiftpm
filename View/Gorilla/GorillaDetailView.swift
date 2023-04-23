//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/20.
//

import SwiftUI

struct GorillaDetailView: View {
    @StateObject var homeData = HomeViewModel()
    // For Dark Mode Adoption....
    @Environment(\.colorScheme) var scheme
    
    @State var isMainActive: Bool = false
    var body: some View {
        
        NavigationView {
            ScrollView{
                
                LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                    
                    
                    GeometryReader{reader -> AnyView in
                        
                        let offset = reader.frame(in: .global).minY
                        
                        if -offset >= 0{
                            DispatchQueue.main.async {
                                self.homeData.offset = -offset
                            }
                        }
                        
                        return AnyView(
                        
                            Image("Gorilla")
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
                    
                    Section(header: GorillaHeaderView()) {

                        
                        Text("Facts")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Text(
        """
     The western lowland gorilla is the most numerous and widespread of all gorilla subspecies. Populations can be found in Cameroon, the Central African Republic, the Democratic Republic of Congo and Equatorial Guinea as well as in large areas in Gabon and the Republic of Congo. The exact number of western lowland gorillas is not known because they inhabit some of the most dense and remote rainforests in Africa. Significant populations still exist, including in isolated swamps and the remote swampy forests of the Republic of Congo.

     Western lowland gorillas can be distinguished from other gorilla subspecies by their slightly smaller size, their brown-grey coats and auburn chests. They also have wider skulls with more pronounced brow ridges and smaller ears. Large numbers have not protected the western lowland gorilla from decline. Because of poaching and disease, the gorilla’s numbers have declined by more than 60% over the last 20 to 25 years. Even if all of the threats to western lowland gorillas were removed, scientists calculate that the population would require some 75 years to recover.
     """)
                        Text("Why They Matter")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Text(
                        """
                        The western lowland gorilla is currently classified as critically endangered by the International Union for Conservation of Nature (IUCN) Red List of Threatened Species. This is due to several threats, including habitat loss and fragmentation, poaching, and disease.

                        Habitat loss and fragmentation occur due to the expansion of agriculture, logging, mining, and human settlements. This has resulted in the loss and degradation of gorilla habitats, reducing their range and making it more difficult for them to find food and mates. Poaching for the bushmeat trade and the illegal trade in live gorillas also poses a significant threat to their survival. Additionally, gorillas are susceptible to diseases like Ebola, which can decimate entire populations.

                        Conservation efforts, such as the establishment of protected areas, law enforcement against poaching and illegal trade, and community-based conservation initiatives, are critical to the survival of western lowland gorillas.
                        """
                        )
                        
                        Text("Threats")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Text(
        """
     DISEASE
     western lowland gorilla threats
     Central Africa is home to not only gorillas, but also the deadly Ebola virus. Ebola has caused a number of massive gorilla and chimpanzee die-offs in the remote forests at the heart of the primates’ ranges. Some scientists estimate that it has killed about one third of the wild gorilla population, mostly western lowland gorillas. The toll has been even greater in some areas, such as the Minkébé Forest—once considered one of the most important populations—where the virus may have killed more than 90% of the region’s gorillas and chimpanzees.
     """)
                        
                        
                        Text("Picture description")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Image("GorillaDetailPicture")
                            .resizable()
                            .scaledToFit()
                        
                        Text("This painting is of a gorilla dying from an infectious disease.")
                            
                        
                        
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
