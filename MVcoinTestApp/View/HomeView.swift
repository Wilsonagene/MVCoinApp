//
//  HomeView.swift
//  MVcoinTestApp
//
//  Created by Emmanuel Agene on 06/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var model: RootModel
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                // top movers view
                TopMoversView()
                
                Divider()
                
                //all coins view
                AllCoinsView()
            }.navigationTitle("Live Prices")
        }
    }
}

#Preview {
    HomeView()
}
