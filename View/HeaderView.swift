//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/19.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var homeData : HomeViewModel
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            HStack(spacing: 0){
                

                
                Button(action: {}, label: {
                    Image(systemName: "globe.europe.africa")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: getSize(), height: getSize())
                        .foregroundColor(.primary)
                })
                
                Text("   Africa Forest Elephant")
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            
            ZStack{
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    HStack {
                        Image(systemName: "map")
                            .font(.caption)
                        
                        Text("Central African Republic, Congo, Equatorial Guinea, Gabon, and Angola.")
                            .font(.caption)
                    }
                    
                    HStack(spacing: 8){
                        
                        Image(systemName: "scalemass")
                            .font(.caption)
                        
                        Text("2-5 tons,")
                            .font(.caption)
                        Text(" Status : Critically Endangered")
                            .font(.caption)
                            .foregroundColor(Color.red)
                        
                    }
                   
                    .frame(maxWidth: .infinity,alignment: .leading)
                })
                .opacity(homeData.offset > 200 ? 1 - Double((homeData.offset - 200) / 50) : 1)
                
                // Custom ScrollView....
                
                // For Automatic Scrolling...
                
                ScrollViewReader {reader in
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        HStack(spacing: 0){
                            
                            ForEach(tabsItems){tab in
                                
                                Text(tab.tab)
                                    .font(.caption)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Color.primary.opacity(homeData.selectedtab == tab.tab ? 1 : 0))
                                    .clipShape(Capsule())
                                    .foregroundColor(homeData.selectedtab == tab.tab ? scheme == .dark ? .black : .white : .primary)
                                    .id(tab.tab)
                            }
                            .onChange(of: homeData.selectedtab, perform: { value in
                                
                                // When Scrolling Very Fastly
                                // Animation Is Having Some Problem In Scroll Reader...
                                // May Be It's A Bug....
                                // Comment withAnimation Clouse in That Case....
                                
                                withAnimation(.easeInOut){
                                    reader.scrollTo(homeData.selectedtab,anchor: .leading)
                                }
                            })
                        }
                    })
                    
                    // Visible Only When Scrolls Up...
                    .opacity(homeData.offset > 200 ? Double((homeData.offset - 200) / 50) : 0)
                }
            }
            // Default Frame = 60...
            // Top Fram = 40
            // So Total = 100
            .frame(height: 60)
    
            if homeData.offset > 250{
                Divider()
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(scheme == .dark ? Color.black : Color.white)
    }
    
    // Getting Size Of Button And Doing ANimation...
    func getSize()->CGFloat{
        
        if homeData.offset > 200{
            let progress = (homeData.offset - 200) / 50
            
            if progress <= 1.0{
                return progress * 40
            }
            else{
                return 40
            }
        }
        else{
            return 0
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ElephantDetailView().previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
struct BlackRhinoHeaderView: View {
    
    @EnvironmentObject var homeData : HomeViewModel
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            HStack(spacing: 0){
                

                
                Button(action: {}, label: {
                    Image(systemName: "globe.europe.africa")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: getSize(), height: getSize())
                        .foregroundColor(.primary)
                })
                
                Text("   Black Rhino")
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            
            ZStack{
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    HStack {
                        Image(systemName: "map")
                            .font(.caption)
                        
                        Text("Namibia, Coastal East Africa")
                            .font(.caption)
                    }
                    
                    HStack(spacing: 8){
                        
                        Image(systemName: "scalemass")
                            .font(.caption)
                        
                        Text("1,760-3,080 pounds,")
                            .font(.caption)
                        Text(" Status : Critically Endangered")
                            .font(.caption)
                            .foregroundColor(Color.red)
                        
                    }
                   
                    .frame(maxWidth: .infinity,alignment: .leading)
                })
                .opacity(homeData.offset > 200 ? 1 - Double((homeData.offset - 200) / 50) : 1)
                
                // Custom ScrollView....
                
                // For Automatic Scrolling...
                
                ScrollViewReader {reader in
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        HStack(spacing: 0){
                            
                            ForEach(tabsItems){tab in
                                
                                Text(tab.tab)
                                    .font(.caption)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Color.primary.opacity(homeData.selectedtab == tab.tab ? 1 : 0))
                                    .clipShape(Capsule())
                                    .foregroundColor(homeData.selectedtab == tab.tab ? scheme == .dark ? .black : .white : .primary)
                                    .id(tab.tab)
                            }
                            .onChange(of: homeData.selectedtab, perform: { value in
                                
                                // When Scrolling Very Fastly
                                // Animation Is Having Some Problem In Scroll Reader...
                                // May Be It's A Bug....
                                // Comment withAnimation Clouse in That Case....
                                
                                withAnimation(.easeInOut){
                                    reader.scrollTo(homeData.selectedtab,anchor: .leading)
                                }
                            })
                        }
                    })
                    
                    // Visible Only When Scrolls Up...
                    .opacity(homeData.offset > 200 ? Double((homeData.offset - 200) / 50) : 0)
                }
            }
            // Default Frame = 60...
            // Top Fram = 40
            // So Total = 100
            .frame(height: 60)
    
            if homeData.offset > 250{
                Divider()
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(scheme == .dark ? Color.black : Color.white)
    }
    
    // Getting Size Of Button And Doing ANimation...
    func getSize()->CGFloat{
        
        if homeData.offset > 200{
            let progress = (homeData.offset - 200) / 50
            
            if progress <= 1.0{
                return progress * 40
            }
            else{
                return 40
            }
        }
        else{
            return 0
        }
    }
}

struct GorillaHeaderView: View {
    
    @EnvironmentObject var homeData : HomeViewModel
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            HStack(spacing: 0){
                

                
                Button(action: {}, label: {
                    Image(systemName: "globe.europe.africa")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: getSize(), height: getSize())
                        .foregroundColor(.primary)
                })
                
                Text("   Western Lowland Gorilla")
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            
            ZStack{
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    HStack {
                        Image(systemName: "map")
                            .font(.caption)
                        
                        Text("Congo Basin")
                            .font(.caption)
                    }
                    
                    HStack(spacing: 8){
                        
                        Image(systemName: "scalemass")
                            .font(.caption)
                        
                        Text("up to 440 pounds")
                            .font(.caption)
                        Text(" Status : Critically Endangered")
                            .font(.caption)
                            .foregroundColor(Color.red)
                        
                    }
                   
                    .frame(maxWidth: .infinity,alignment: .leading)
                })
                .opacity(homeData.offset > 200 ? 1 - Double((homeData.offset - 200) / 50) : 1)
                
                // Custom ScrollView....
                
                // For Automatic Scrolling...
                
                ScrollViewReader {reader in
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        HStack(spacing: 0){
                            
                            ForEach(tabsItems){tab in
                                
                                Text(tab.tab)
                                    .font(.caption)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Color.primary.opacity(homeData.selectedtab == tab.tab ? 1 : 0))
                                    .clipShape(Capsule())
                                    .foregroundColor(homeData.selectedtab == tab.tab ? scheme == .dark ? .black : .white : .primary)
                                    .id(tab.tab)
                            }
                            .onChange(of: homeData.selectedtab, perform: { value in
                                
                                // When Scrolling Very Fastly
                                // Animation Is Having Some Problem In Scroll Reader...
                                // May Be It's A Bug....
                                // Comment withAnimation Clouse in That Case....
                                
                                withAnimation(.easeInOut){
                                    reader.scrollTo(homeData.selectedtab,anchor: .leading)
                                }
                            })
                        }
                    })
                    
                    // Visible Only When Scrolls Up...
                    .opacity(homeData.offset > 200 ? Double((homeData.offset - 200) / 50) : 0)
                }
            }
            // Default Frame = 60...
            // Top Fram = 40
            // So Total = 100
            .frame(height: 60)
    
            if homeData.offset > 250{
                Divider()
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(scheme == .dark ? Color.black : Color.white)
    }
    
    // Getting Size Of Button And Doing ANimation...
    func getSize()->CGFloat{
        
        if homeData.offset > 200{
            let progress = (homeData.offset - 200) / 50
            
            if progress <= 1.0{
                return progress * 40
            }
            else{
                return 40
            }
        }
        else{
            return 0
        }
    }
}
