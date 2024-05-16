//
//  ItemListViewController.swift
//  Move
//
//  Created by Ludovic Ollagnier on 15/05/2024.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let library = Library(items: [Item(name: "Test", price: 25, comment: "", toSell: true, condition: .bad)])
    var refresh: UIRefreshControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.dataSource = self
        tableView.delegate = self

        refresh = UIRefreshControl(frame: .zero, primaryAction: UIAction(handler: { action in
            self.tableView.reloadData()
        }))
        tableView.refreshControl = refresh

        let notifCenter = NotificationCenter.default
        notifCenter.addObserver(forName: Notification.Name("modelUpdated"), object: library, queue: OperationQueue.main) { notif in
            self.tableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "form", let destination = segue.destination as? ItemFormViewController {
            destination.library = library
        }
    }
}

extension ItemListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        refresh?.endRefreshing()
        return library.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id: String
        if indexPath.section == 0 {
            id = "itemCell"
        } else {
            id = "itemCell2"
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)

        // Customize the cell
        let item = library.allItems[indexPath.row]

        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = item.name
        contentConfig.secondaryText = "\(item.price)€"

        cell.contentConfiguration = contentConfig

        return cell
    }
}

extension ItemListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Section 0"
        case 1:
            return "Section 1"
        default:
            return nil
        }
    }
}
