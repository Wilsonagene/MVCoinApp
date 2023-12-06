//
//  TopMoversView.swift
//  MVcoinTestApp
//
//  Created by Emmanuel Agene on 06/12/2023.
//

import SwiftUI

struct TopMoversView: View {
    
    @EnvironmentObject private var model: RootModel
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Top Movers")
                .font(.headline)
                .fontWeight(.bold)
             
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(model.topCoins){ topCoin in
                        TopMoversItemView(coin: topCoin)
                    }
                }
            }
        }
        .task {
            do {
                try await model.configureTopMovingCoins()
            } catch {
                print(error)
            }
        }
        .padding()
    }
}

#Preview {
    TopMoversView()
}
