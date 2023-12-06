//
//  AllCoinsView.swift
//  MVcoinTestApp
//
//  Created by Emmanuel Agene on 06/12/2023.
//

import SwiftUI

struct AllCoinsView: View {
    
    @EnvironmentObject private var model: RootModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            HStack{
                Text("Coin")
                    
                Spacer()
                Text("Prices")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)

            ScrollView{
                VStack{
                    ForEach(model.coins){ coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }.task {
            do {
                try await model.populateCoins()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    AllCoinsView()
}
