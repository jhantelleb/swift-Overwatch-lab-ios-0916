//
//  File.swift
//  Overwatch
//
//  Created by Robert Deans on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation


struct Game {
    var offenseCharacters = [Hero]()
    var defenseCharacters = [Hero]()
    var supportCharacters = [Hero]()
    var tankCharacters = [Hero]()
    
    var heroType: HeroType = .offense
    
    var heroes: [Hero] {
        return heroesForType()
    }
    
    init() {
        createAllHeroes()
    }
    
    func heroesForType() -> [Hero] {
        switch self.heroType {
        case .offense:
            return offenseCharacters
        case .defense:
            return defenseCharacters
        case .support:
            return supportCharacters
        case .tank:
            return tankCharacters
        }
    }
    
}

extension Game {
    mutating func createAllHeroes() {
        var hero: Hero?
        
        for heroName in HeroName.heroes(with: .offense) {
            hero = Hero(name: heroName)
            offenseCharacters.append(hero!)
        }
        for heroName in HeroName.heroes(with: .defense) {
            hero = Hero(name: heroName)
            defenseCharacters.append(hero!)
        }
        for heroName in HeroName.heroes(with: .tank) {
            hero = Hero(name: heroName)
            tankCharacters.append(hero!)
        }
        for heroName in HeroName.heroes(with: .support) {
            hero = Hero(name: heroName)
            supportCharacters.append(hero!)
        }
    }
}
