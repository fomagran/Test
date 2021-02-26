//
//  ViewController.swift
//  Test
//
//  Created by Fomagran on 2021/01/22.
//


import UIKit


class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    var allFoods:[Food]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllFoods()
        print(allFoods)
    }
    
    private func addFood() {
        
        let 짜장면 = Food(name: "짜장면", price: 6000, isDelicious: true)
        let 샐러드 = Food(name: "샐러드", price: 4500, isDelicious: false)
        let 소고기 = Food(name: "소고기", price: 25000, isDelicious: true)
        
        
        allFoods = [짜장면,샐러드,소고기]
        
        for food in allFoods!{
            saveAllFoods(food: food)
        }
        
    }
    
    private func saveAllFoods(food:Food) {
        if allFoods != nil {
            if !allFoods!.contains(food) {
                allFoods!.append(food)
            }
        }else{
            allFoods = [food]
        }
        userDefaults.setValue(try? PropertyListEncoder().encode(allFoods!), forKey: "Foods")
        userDefaults.synchronize()
    }
    
    private func loadAllFoods() {
        if let data = userDefaults.value(forKey: "Foods") as? Data {
            allFoods = try? PropertyListDecoder().decode(Array<Food>.self,from: data)
        }
    }
}
  
