//
//  PremiumView.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/23/23.
//

import UIKit
import StoreKit

class PremiumViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    let background = UIImageView(frame: UIScreen.main.bounds)
    let card = CardView()
    let logoView = UIImageView()
    let image = UIImage(named: "pplogo")
    let header = UILabel()
    let featOne = FeatureView()
    let featTwo = FeatureView()
    let featThree = FeatureView()
    let featFour = FeatureView()
    let featFive = UILabel()
    let horizontalLine = UIView()
    let stackView = UIStackView()
    let exitButton = ExitButton()
    let buyButton = BuyButton(type: .system)
    
    override func viewDidLoad() {
        setupBackground()
        setupCard()
        setupExitButton()
        setupLogo()
        setupHeader()
        setupLine()
        configureStackView()
        addFeatToStackView()
        setupfeatFive()
        setupBuyButton()
        fetchProducts()
    }
    
    func setupBackground(){
        view.addSubview(background)
        background.image = UIImage(named: "gradientbg")
    }
    
    func setupCard(){
        view.addSubview(card)
        card.backgroundColor = UIColor(red: 32/255, green: 11/255, blue: 48/255, alpha: 0.65)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        card.widthAnchor.constraint(equalToConstant: 315).isActive = true
        card.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30
        ).isActive = true
    }
    
    func setupExitButton(){
        card.addSubview(exitButton)
        exitButton.setupButton()
        exitButton.addTarget(self, action: #selector(closePremiumView), for: .touchUpInside)
        
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 10).isActive = true
        exitButton.topAnchor.constraint(equalTo: card.topAnchor, constant: 10).isActive = true
    }
    
    @objc func closePremiumView(){
        self.dismiss(animated: true)
    }
    
    func setupLogo(){
        card.addSubview(logoView)
        logoView.image = image
    
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.topAnchor.constraint(equalTo: exitButton.topAnchor, constant: 30).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        logoView.centerXAnchor.constraint(equalTo: card.centerXAnchor).isActive = true
    }
    
    func setupHeader(){
        card.addSubview(header)
        header.text = "PREMIUM ACCESS"
        header.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        header.textColor = .white

        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 25).isActive = true
        header.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 30).isActive = true
    }
    
    func setupLine(){
        card.addSubview(horizontalLine)
        horizontalLine.backgroundColor = .white
        
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        horizontalLine.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 5).isActive = true
        horizontalLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        horizontalLine.widthAnchor.constraint(equalToConstant: 315).isActive = true
        horizontalLine.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -15).isActive = true
        horizontalLine.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 15).isActive = true
    }
    
    //MARK: Feature StackView
    func configureStackView(){
        card.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 30).isActive = true
        stackView.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 15).isActive = true
        stackView.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -15).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    func addFeatToStackView(){
        let boldText = "FEELINGS"
        let regText = " includes animations to enhance emotional development"
        featOne.setupLabel(boldText: boldText, regText: regText)
        
        let boldText2 = "FACES"
        let regText2 = " allows you to add your own photos of loved ones"
        featTwo.setupLabel(boldText: boldText2, regText: regText2)
        
        let boldText3 = "OPPOSITES"
        let regText3 = " introduces differences via visual connections"
        featThree.setupLabel(boldText: boldText3, regText: regText3)
        
        let boldText4 = "COLORS"
        let regText4 = " aids in cognitive understanding"
        featFour.setupLabel(boldText: boldText4, regText: regText4)
        
        stackView.addArrangedSubview(featOne)
        stackView.addArrangedSubview(featTwo)
        stackView.addArrangedSubview(featThree)
        stackView.addArrangedSubview(featFour)
    }
    
    func setupfeatFive() {
        card.addSubview(featFive)
        
        featFive.text = "All cards includes text to speech feature"
        featFive.textColor = .white
        featFive.font = UIFont(name: "HelveticaNeue-Light", size: 14.0)
         
        featFive.translatesAutoresizingMaskIntoConstraints = false
        featFive.centerXAnchor.constraint(equalTo: card.centerXAnchor).isActive = true
        featFive.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        featFive.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -15).isActive = true
    }
    
    //MARK: BuyButton
    func setupBuyButton(){
        view.addSubview(buyButton)
        buyButton.setupButton()
        buyButton.setTitle("GET PREMIUM", for: .normal)
        buyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.addTarget(self, action: #selector(buyPremium), for: .touchUpInside)
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        buyButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
        buyButton.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 10).isActive = true
        buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func buyPremium(){

        guard let myProduct = myProduct else{
            return
        }
        
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: myProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        }
    }
    //MARK: IAP
    //fetch product from app store
    var myProduct: SKProduct?

    
    func fetchProducts(){
        let request = SKProductsRequest(productIdentifiers: ["PPPremium"])
        request.delegate = self
        request.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let product = response.products.first {
            myProduct = product
            print(product.productIdentifier)
            print(product.price)
            print(product.priceLocale)
            print(product.localizedTitle)
            print(product.localizedDescription)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                //no op
                break
            case .purchased, .restored:
                //unlock their item
                UserDefaults.standard.set(true, forKey: "PPPremium")
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                
                dismiss(animated: true)
                break
            case .failed, .deferred:
                
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            default:
                break
            }
        }
    }
}
