//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by Robert Deans on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var characterStackView: UIStackView!
    @IBOutlet weak var characterStackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroScrollView: UIScrollView!
    
    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            return heroType = .offense
        case 1:
            return heroType = .defense
        case 2:
            return heroType = .tank
        case 3:
            return heroType = .support
        default: break
        }
    }
    
    var game: Game = Game()
    var heroType: HeroType! {
        didSet { game.heroType = heroType
                 updateStackViewWithHeroes() }
    }
    
    func updateStackViewWithHeroes(){
        let heroArray = game.heroes
        let heroImageView = UIImageView()
        
        heroScrollView.removeFromSuperview()
        
        for i in 0..<heroArray.count {
        heroImageView.image = heroArray[i].image
        heroImageView.contentMode = .scaleAspectFit
        let xPosition = self.containerView.frame.width * CGFloat(i)
        heroImageView.frame = CGRect(x: xPosition, y:0, width: self.heroScrollView.frame.width, height: self.heroScrollView.frame.height)
        
        characterStackViewWidthConstraint.constant = heroScrollView.frame.width * CGFloat(i)
        heroScrollView.contentSize.width = containerView.frame.width
        characterStackView.addArrangedSubview(heroImageView)
        heroScrollView.addSubview(characterStackView)
        view.addSubview(heroScrollView)
        
//      characterStackView.frame = heroScrollView.frame
        heroNameLabel?.text = heroArray[i].name.description
//        heroScrollView.addSubview(heroImageView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        heroType = .offense
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroScrollView.delegate = self
        heroScrollView.frame = containerView.frame
    }
}
