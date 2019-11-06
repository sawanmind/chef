//
//  HomeTabModel.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/06.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import AlamofireObjectMapper

class HomeTabModel: NSObject {

    var dishes = [Dish]()
    
    var results = [Dish]()
    
    let disposeBag = DisposeBag()
    
    let dishProvider = BehaviorRelay(value: [SectionOfDish]())
    
    let resultProvider = PublishRelay<[SectionOfDish]>()
    
    let isFoodFound = BehaviorRelay(value: false)
    
    let errorReason = PublishRelay<String>()
    
    override init() {
        super.init()
        getDishes()
    }
    
    func getDishes() {
        DishRequest.shared.getDishes(page: 1).subscribe(onSuccess: { (dishes) in
            for dish in dishes {
                self.dishes.append(Dish(dish_id: dish.dish_id ?? "", thumbnail_url: dish.thumbnail_url, name: dish.name, rating: dish.rating, estimateTime: dish.estimateTime))
            }
            self.dishProvider.accept([SectionOfDish(header: "", items: self.dishes)])
        }) { (error) in
            
        }.disposed(by: disposeBag)
    }
    
    func search(word: String) {
        DishRequest.shared.search(word: word).subscribe(onSuccess: { (response) in
            switch response.response?.statusCode {
            case 200:
                self.results.removeAll()
                response.result.value?.forEach({ (foods) in
                    self.results.append(Dish(dish_id: foods.dish_id ?? "", thumbnail_url: foods.thumbnail_url, name: foods.name, rating: foods.rating, estimateTime: foods.estimateTime))
                })
                self.resultProvider.accept([SectionOfDish(header: "Foods", items: self.results)])
            case 204:
                self.errorReason.accept("No foods found")
            default:
                break
            }
        }) { (error) in
            self.errorReason.accept(error.localizedDescription)
        }.disposed(by: disposeBag)
    }
}
