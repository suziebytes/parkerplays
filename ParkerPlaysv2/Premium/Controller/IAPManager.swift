//
//  IAPManager.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/25/23.
//

import UIKit
import StoreKit

final class IAPManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    static let shared = IAPManager()
    
    //fetch product from app store
    var products = [SKProduct]()
    
    //add all products here 
    enum Product: String, CaseIterable {
        case PPPremium
    }
    
    public func fetchProducts(){
        let request = SKProductsRequest(productIdentifiers: Set(Product.allCases.compactMap({ $0.rawValue })))
        request.delegate = self
        request.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("Products Returned: \(response.products.count)")
        self.products = response.products
    }
    
    public func purchase(product: Product){
        //enable user to make purchases
        guard SKPaymentQueue.canMakePayments() else {
            return
        }
        //check  that product exist
        guard let storeKitProduct = products.first(where: { $0.productIdentifier == product.rawValue}) else {
            return
        }
        
        let paymentRequest = SKPayment(product: storeKitProduct)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(paymentRequest)
    }
    
    //handles transactions
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        transactions.forEach({
            switch $0.transactionState {
                
            case .purchasing:
                break
            case .purchased:
                break
            case .failed:
                break
            case .restored:
                break
            case .deferred:
                break
            @unknown default:
                break
            }
        })
    }
}
