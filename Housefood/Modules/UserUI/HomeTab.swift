//
//  FirstViewController.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/05.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class HomeTab: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchResult: UITableView!
    @IBOutlet weak var noFoodView: UIView!
    @IBOutlet weak var errorMsgLabel: UILabel!
    
    let searchBar = UISearchBar()
    
    let viewModel = HomeTabModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search food or restaurant"
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        let dataSource = RxTableViewSectionedAnimatedDataSource<SectionOfDish>(configureCell: { (ds: TableViewSectionedDataSource<SectionOfDish>, tableView: UITableView, indexPath: IndexPath, item: Dish) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DishCell
            cell.set(thumbnail_url: item.thumbnail_url, name: item.name, rating: item.rating, time: item.estimateTime)
            return cell
        })
        viewModel.dishProvider.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        viewModel.isFoodFound.bind(to: noFoodView.rx.isHidden).disposed(by: disposeBag)
        viewModel.errorReason.bind(to: errorMsgLabel.rx.text).disposed(by: disposeBag)
    }
}

extension HomeTab: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchResult.isHidden = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.search(word: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchResult.isHidden = true
    }
}
