import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var flipcountLabel: UILabel!
    @IBOutlet private var cardButton: [UIButton]!
    
    private var game: Concentration!
    private var flipcount = 0 {
        didSet {
            flipcountLabel.text = "Flips: \(flipcount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewGame()
    }
    
    @IBAction private func touchNewGame(_ sender: UIButton) {
        setupNewGame()
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipcount+=1
        if let cardNumber = cardButton.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    // MARK: - Private
    
    private func setupNewGame() {
        game = Concentration(numberOfPairsOfCards: (cardButton.count)/2)
        flipcount = 0
        updateViewFromModel()
    }
    
    private func updateViewFromModel(){
        for index  in cardButton.indices{
            let button = cardButton[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(String(card.identifier), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0, green: 0.3294117647, blue: 0.5764705882, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.003921568627, green: 0.09803921569, blue: 0.5764705882, alpha: 1)
            }
        }
    }
}

