//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Artiom on 25/02/2024.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transcationListVm: TransactionListViewModel
    
    var body: some View {
        VStack{
            List{
                //Transaction Groups
                ForEach(Array(transcationListVm.groupTransactionsByMonth()),id: \.key){ month, transactions in
                    Section{
                        ForEach(transactions){ transaction in
                            TransactionRow(transaction: transaction)}
                    }header: {
                        //Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
