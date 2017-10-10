//
//  InAppPurchasesService.swift
//  FHE
//
//  Created by Rylan Evans on 10/4/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.


import Foundation
import StoreKit

protocol IAPServiceDelege {
    func iapProductsLoaded()
}

class InAppPurchasesService: NSObject, SKProductsRequestDelegate {
    
    static let instance = InAppPurchasesService()
    
    var delegate: IAPServiceDelege?
    var products = [SKProduct]()
    var productIds = Set<String>()
    var productRequest = SKProductsRequest()
    
    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    func loadProducts() {
        productIdToStringSet()
        requestProducts(forIds: productIds)
    }
    
    func productIdToStringSet() {
        let ids = [IAP_FHE_ID_thankYou, IAP_FHE_ID_likeIt, IAP_FHE_ID_loveIt, IAP_FHE_ID_amazing]
        for id in ids {
            productIds.insert(id)
        }
    }
    
    func requestProducts(forIds ids: Set<String>) {
        productRequest.cancel()
        productRequest = SKProductsRequest(productIdentifiers: ids)
        productRequest.delegate = self
        productRequest.start()
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
        
        if products.count == 0 {
            requestProducts(forIds: productIds)
        } else {
            delegate?.iapProductsLoaded()
        }
    }
    
    func attemptPurchaseForItemWith(productIndex: Product) {
        let product = products[productIndex.rawValue]
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
}

extension InAppPurchasesService: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
//                sendNotificationFor(status: .purchased, withIdentifier: nil)
                debugPrint("Purchase was successfull")
                break
            case .restored:
                break
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
//                sendNotificationFor(status: .failed, withIdentifier: nil)
                break
            case .deferred:
                break
            case .purchasing:
                break
            }
        }
    }
}

