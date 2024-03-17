//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Artiom on 25/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                   //Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon,.primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.icon)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVm: TransactionListViewModel = {
        let transactionListVm = TransactionListViewModel()
        transactionListVm.transactions = transactionListPreviewData
        return transactionListVm
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVm)
    }
}
