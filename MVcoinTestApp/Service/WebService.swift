//
//  WebService.swift
//  MVcoinTestApp
//
//  Created by Emmanuel Agene on 06/12/2023.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badRequest
    case decodingerror
    case sortingerror
}

class WebService: ObservableObject {
    
    let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
    
    func getCoins() async throws -> [Coin] {
        
        guard let url = URL(string: urlString) else {
           throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let coin = try? JSONDecoder().decode([Coin].self, from: data) else {
            throw NetworkError.decodingerror
        }
        
        return coin
        
        
    }
    
    
    func getTopCoins()async throws -> [Coin] {
        
        guard let url = URL(string: urlString) else {
           throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let coin = try? JSONDecoder().decode([Coin].self, from: data) else {
            throw NetworkError.decodingerror
        }
        
         let topMovers = coin.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
         
        
        return Array(topMovers.prefix(20))
    }
    
}
