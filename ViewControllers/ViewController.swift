//
//  ViewController.swift
//  Seven
//
//  Created by Aliaksandr on 8/31/20.
//  Copyright © 2020 Aliaksandr. All rights reserved.
//

import UIKit
import SCLAlertView

class ViewController: UIViewController {

    @IBOutlet weak var logo_Image: UIImageView!
    @IBOutlet weak var leftCardImage: UIImageView!
    @IBOutlet weak var rightCardImage: UIImageView!
    @IBOutlet weak var numberOfCardsLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var generateImage: UIButton!
    
    var cards = Constants.cardsStack
    var numberOfCards = Constants.numberOfCardsInStack
    var cardImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    // MARK: Check info about card
    @IBAction func infoTapped(_ sender: Any) {
        guard let imageName = cardImage else {
            SCLAlertView().showError("Хотел сломать приложение?", subTitle: "Пей! 💣")
            return
        }
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "InfoViewController") as! InfoViewController
        controller.modalTransitionStyle = .flipHorizontal
        controller.ImageName = imageName
        self.present(controller, animated: true)
    }
    
    // MARK: Random Card from cardStack
    func randomCard(cards: inout [String]) -> String {
        let index = Int.random(in: 0..<cards.count)
        cardImage = cards.remove(at: index)
        return cardImage!
    }
    
    // MARK: Take card from cardStack
    func generateCard() {
        rightCardImage.isHidden = false
        rightCardImage.alpha = 0
        rightCardImage.image = UIImage(named: randomCard(cards: &cards))
        UIView.animate(withDuration: 1) {
            self.rightCardImage.alpha = 1
        }
        numberOfCards -= 1
        numberOfCardsLabel.text = String(numberOfCards)
    }
    
    // MARK: Reloading game
    func reloadGameIfNeed() {
        cardImage = nil
        cards = Constants.cardsStack
        numberOfCards = Constants.numberOfCardsInStack
        numberOfCardsLabel.text = "41"
        rightCardImage.image = UIImage(named: "Rubashka")
    }
    
    // MARK: End game
    func endGame() {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alertView = SCLAlertView(appearance: appearance)
        alertView.addButton("Рискну ещё ☠️") {
            self.reloadGameIfNeed()
        }
        alertView.addButton("Cдаюсь 🤮") {
//            что-нибудь придумать
            
        }
        alertView.showSuccess("Выбери свoю сторону 🔞", subTitle: "🍺🍻🥃")
    }
    
    // MARK: Appearing card on the screen
    @IBAction func generateTapped(_ sender: Any) {
        if (cards.isEmpty) {
            endGame()
        } else {
            generateCard()
        }
    }
    
}
