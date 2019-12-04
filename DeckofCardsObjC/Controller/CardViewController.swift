//
//  CardViewController.swift
//  DeckofCardsObjC
//
//  Created by tyson ericksen on 12/3/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardTypeLabel: UILabel!
    @IBOutlet weak var cardSuiteLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func dealButtonTapped(_ sender: Any) {
        
        LBTCardController.fetchCard()
        DispatchQueue.main.async {
            cardTypeLabel.text = card.type
            cardSuiteLabel.text = card.suite
        }
    }
    
    

}
