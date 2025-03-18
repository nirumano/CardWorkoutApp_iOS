//
//  RulesVC.swift
//  CardWorkout
//
//  Created by Nirusan Manoharan on 2025-03-15.
//

import UIKit

class RulesVC: UIViewController {
    
    let titleLabel = UILabel()
    let rulesLabel = UILabel()
    let exerciseLabel = UILabel()
    
    let closeButton = UIButton() //fun

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRulesLabel()
        configureExcerciseLabel()
        configureCloseButton()
    }
    
    func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    
    func configureRulesLabel(){
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = "The value of each card represents the number of excercise you do. \n\n J = 11,  Q = 12,  K = 13,  A = 14"
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.textAlignment = .center
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    func configureExcerciseLabel(){
        view.addSubview(exerciseLabel)
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseLabel.text = "♠️ = Push-Ups \n\n❤️ = Squats \n\n♣️ = Burpees \n\n♦️ = Jumping Jacks"
        exerciseLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        exerciseLabel.numberOfLines = 0

        
        NSLayoutConstraint.activate([
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60),
            exerciseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            exerciseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    // fun - close button
    
    func configureCloseButton(){
        view.addSubview(closeButton)
        closeButton.setTitle("X", for: .normal)
        closeButton.setTitleColor(.gray, for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false


        closeButton.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
            
            
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func closeModal() {
        dismiss(animated: true, completion: nil)
    }
}
