//
//  ItemFormViewController.swift
//  Move
//
//  Created by Ludovic Ollagnier on 14/05/2024.
//

import UIKit

class ItemFormViewController: UIViewController {
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var popUpButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var toSellSwitch: UISwitch!
    @IBOutlet weak var conditionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var priceStackView: UIStackView!
    @IBOutlet weak var toSellLabel: UILabel!
    
    var library: Library?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configurePopupButton()
        configureSegmentedControl()
    }

    private func configureSegmentedControl() {
        conditionSegmentedControl.removeAllSegments()
        let allConditions = Item.Condition.allCases

//        allConditions.forEach { condition in
//            let index = conditionSegmentedControl.numberOfSegments
//            conditionSegmentedControl.insertSegment(withTitle: "\(condition)", at: index, animated: true)
//        }

//        allConditions.forEach(generateSegControl)

        for condition in allConditions {
            conditionSegmentedControl.insertSegment(withTitle: "\(condition)", at: condition.rawValue, animated: true)
        }
        conditionSegmentedControl.selectedSegmentIndex = 0
    }

    private func configurePopupButton() {
        popUpButton.menu = UIMenu(children: [
            UIAction(title: "Option A") {_ in

            },
            UIAction(title: "Option B") {_ in

            }
        ])
        popUpButton.showsMenuAsPrimaryAction = true
        popUpButton.changesSelectionAsPrimaryAction = true
    }

    @IBAction func save(_ sender: Any) {

        guard let name = nameTextField.text, name.count > 2 else { return }
        guard let priceString = priceTextField.text, let price = Double(priceString) else { return }

        // Recup text
        // Check si text non vide
        // Check si text est URL
        if let urlString = urlTextField.text, !urlString.isEmpty, let url = URL(string: urlString) {
            //
        }

        let selectedIndex = conditionSegmentedControl.selectedSegmentIndex
        guard let condition = Item.Condition(rawValue: selectedIndex) else { fatalError("Condition should not be nil") }

        let item = Item(name: name, price: price, comment: "", toSell: toSellSwitch.isOn, condition: condition)
        library?.add(item)
        // Save the item to the library

        dismiss(animated: true)
    }

    func generateSegControl(cond: Item.Condition) {

    }

    @IBAction func togglePriceVisibility(_ sender: UISwitch) {

//        UIView.animate(withDuration: 0.2) {
//            self.priceStackView.isHidden = !sender.isOn
//        }

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 20, animations: {
            self.priceStackView.isHidden = !sender.isOn
        })

    }
}

