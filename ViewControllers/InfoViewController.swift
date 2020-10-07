//
//  InfoViewController.swift
//  Seven
//
//  Created by Aliaksandr on 9/5/20.
//  Copyright © 2020 Aliaksandr. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardInfo: UILabel!
    var ImageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements() {
        cardImage.image = UIImage(named: ImageName!)
        cardInfo.text = Utils.cardInformation(cardName: ImageName!)
    }

}
