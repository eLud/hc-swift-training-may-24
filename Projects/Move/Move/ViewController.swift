//
//  ViewController.swift
//  Move
//
//  Created by Ludovic Ollagnier on 14/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var popUpButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var conditionSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configurePopupButton()
        configureSegmentedControl()
    }

    private func configureSegmentedControl() {
        conditionSegmentedControl.removeAllSegments()
        let allConditions = Item.Condition.allCases
        for condition in allConditions {
            let index = conditionSegmentedControl.numberOfSegments
            conditionSegmentedControl.insertSegment(withTitle: "\(condition)", at: index, animated: true)
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
    }
}

