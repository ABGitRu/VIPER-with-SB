//
//  GreetingViewController.swift
//  VIPER with SB
//
//  Created by Mac on 21.07.2021.
//

import UIKit

protocol GreetingViewInputProtocol: AnyObject {
    func setGreeting(_ greeting: String)
    
}

protocol GreetingViewOutputProtocol {
    init(view: GreetingViewInputProtocol)
    func didTapShowGreetingButton()
}

class GreetingViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    
    private let configurator: GreetingConfiguratorInputProtocol = GreetingConfigurator()
    
    var presenter: GreetingViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }

    @IBAction func showGreetingPressed() {
        presenter.didTapShowGreetingButton()
    }
    
}

// MARK: - GreetingViewInputProtocol
extension GreetingViewController: GreetingViewInputProtocol {
    func setGreeting(_ greeting: String) {
        greetingLabel.text = greeting
    }
    
    
}
