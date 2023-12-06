//
//  RootModel.swift
//  MVcoinTestApp
//
//  Created by Emmanuel Agene on 06/12/2023.
//

import Foundation


@MainActor
class RootModel: ObservableObject {
    
    let webservice: WebService
    @Published private(set) var coins: [Coin] = []
    @Published private(set) var topCoins: [Coin] = []
    
    init(webservice: WebService) {
        self.webservice = webservice
    }
    
    func populateCoins() async throws {
        coins = try await webservice.getCoins()
//        print(coins)
    }
    
    func configureTopMovingCoins() async throws {
        topCoins = try await webservice.getTopCoins()
//        print(topCoins)
    }
    
}
