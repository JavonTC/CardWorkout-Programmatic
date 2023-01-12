//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Javon Calloway on 1/9/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView   = UIImageView()
    let stopButton      =  CWButton.init(backgroundColor: .systemRed, title: "Stop!")
    let resetButton     = CWButton.init(backgroundColor: .systemGreen, title: "Restart")
    let rulesButton     =  CWButton.init(backgroundColor: .systemBlue, title: "Rules")
    
    var timer: Timer!
    var cards:[UIImage] = Card.allValues

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        startTimer()
        view.backgroundColor = .systemBackground
        
        
        
    }
    
    func configureUI() {
        configureCardImage()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImage() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
            
        ])
    }
    
    func configureStopButton(){
        
        
        view.addSubview(stopButton)
        
        stopButton.addTarget(self, action: #selector(stopButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor,constant: 30)
        ])
    }
    
    func configureResetButton(){
        view.addSubview(resetButton)
        
        resetButton.addTarget(self, action: #selector(resetButtonTouched), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor,constant: 20)
        ])
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor,constant: 20)
        ])
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement()
        ?? UIImage(named: "AS")
        
    }
    
    
    
    @objc func presentRulesVC() {
        
        present(RulesVC(), animated: true)
    
    }
    
    @objc func stopButtonPressed() {
        timer.invalidate()
    }
    
    @objc func resetButtonTouched() {
        timer.invalidate()
        startTimer()
    }

}
