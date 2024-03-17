//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Artiom on 25/02/2024.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/24/2024", institution: "Maib", account: "Visa Maib", merchant: "Apple", amount: 11.54, type: "debit", categoryId: 801, category: "Software", isPending: true, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
