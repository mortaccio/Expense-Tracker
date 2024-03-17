//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Artiom on 25/02/2024.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVm: TransactionListViewModel 
    var body: some View {
        VStack{
            HStack{
                //Header Title
                Text("Recent Transactions")
                    .bold()
                Spacer()
                
                //Header Link
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 4){
                        Text("See all")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }

            }
            .padding(.top)
            
            //Recent Transactions List
            ForEach(Array(transactionListVm.transactions.prefix(5).enumerated()),id: \.element) {index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))
        .shadow(color: .primary.opacity(0.2), radius: 10,x: 0,y: 5)
    }
}
 
struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVm: TransactionListViewModel = {
        let transactionListVm = TransactionListViewModel()
        transactionListVm.transactions = transactionListPreviewData
        return transactionListVm
    }()
    
    static var previews: some View {
        Group{
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        .environmentObject(transactionListVm)
    }
}
