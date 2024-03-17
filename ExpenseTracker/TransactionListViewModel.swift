//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Artiom on 25/02/2024.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>


final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid Url")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type:[Transaction].self, decoder: JSONDecoder())
            .receive(on:DispatchQueue.main)
            .sink { complition in
                switch complition{
                case .failure(let error):
                    print("Error fetching transactions", error.localizedDescription)
                case.finished:
                    print("Finish fetching transactions")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
            }
            .store(in: &cancellables)

    }
    
    func groupTransactionsByMonth() -> TransactionGroup{
        guard !transactions.isEmpty else {return [:] }
        
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
        
        return groupedTransactions
        
    }
}
 
