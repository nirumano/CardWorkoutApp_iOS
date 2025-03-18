//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Nirusan Manoharan on 2025-03-14.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView = UIImageView()
    let stopButton = CWButton(Color: .systemRed, title: "Stop!", systemImageName:"stop.circle")
    let resetButton = CWButton(Color: .systemGreen, title: "Reset", systemImageName:"arrow.clockwise.circle")
    let rulesButton = CWButton(Color: .systemBlue, title: "Rules", systemImageName:"list.bullet")
    let workoutInfo = UILabel()
    
    var cards = CardDeck.allValues
    var timer: Timer!
    var counter = 0
    var selectedCard: (image: UIImage, name: String, reps: Int)?
    var countPress = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        //startTimer() //not needed
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomCard(){
        selectedCard = cards.randomElement()
        cardImageView.image = selectedCard?.image
        //cardImageView.image = cards.randomElement()
    }
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
        configureWorkout()
    }
    
    func configureCardImageView(){
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
    
    //fun - add the workout for easier reading
    func configureWorkout(){
        

        if counter > 0 {
            view.addSubview(workoutInfo)
            
            if let card = selectedCard {
                workoutInfo.text = "Workout: \(card.name) - Reps: \(card.reps) "
                    }
            //workoutInfo.text = "Workout: \(counter) Reps: \(counter)"
            workoutInfo.translatesAutoresizingMaskIntoConstraints = false
            
            workoutInfo.font = .systemFont(ofSize: 14, weight: .bold)
            workoutInfo.textAlignment = .center

            
            NSLayoutConstraint.activate([
                workoutInfo.widthAnchor.constraint(equalToConstant: 250),
                workoutInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                workoutInfo.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 20)
            ])
        }
        
        else{
            view.addSubview(workoutInfo)
            
            workoutInfo.text = "Let's Workout! Click Reset To Begin."
            workoutInfo.translatesAutoresizingMaskIntoConstraints = false
            workoutInfo.font = .systemFont(ofSize: 14, weight: .bold)
            workoutInfo.textAlignment = .center
            NSLayoutConstraint.activate([
                workoutInfo.widthAnchor.constraint(equalToConstant: 250),
                workoutInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                workoutInfo.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 20)
            ])
            
        }
        counter = counter + 1
    }
    

    
    //
    
    func configureStopButton(){
        view.addSubview(stopButton)
        NSLayoutConstraint.activate([
        stopButton.widthAnchor.constraint(equalToConstant: 250),
        stopButton.heightAnchor.constraint(equalToConstant: 50),
        stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
        
        //stop
        stopButton.addTarget(self, action: #selector(stopCards), for: .touchUpInside)
    }
    
    @objc func stopCards(){
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
            countPress = false
        }
        configureWorkout() //should call this function
        //timer.invalidate()
    }
    
    

    func configureResetButton(){
        view.addSubview(resetButton)
        NSLayoutConstraint.activate([
        resetButton.widthAnchor.constraint(equalToConstant: 115),
        resetButton.heightAnchor.constraint(equalToConstant: 50),
        resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
        resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
        //start
        resetButton.addTarget(self, action: #selector(startCards), for: .touchUpInside)
    }
    @objc func startCards(){
        if countPress == false{
            startTimer()
            countPress = true
        }
    }

    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
        rulesButton.widthAnchor.constraint(equalToConstant: 115),
        rulesButton.heightAnchor.constraint(equalToConstant: 50),
        rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
        rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func presentRulesVC(){
        present(RulesVC(), animated: true)
    }

}


//Start Workout - initalizes the db array + shows the view controller for the buttons/cards
//End workout - finishes the db array and logs that into a table view
//first create a new coco touch and make it the tableviw

