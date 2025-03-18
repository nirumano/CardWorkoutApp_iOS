//
//  CWButton.swift
//  CardWorkout
//
//  Created by Nirusan Manoharan on 2025-03-14.
//

import UIKit

class CWButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(Color: UIColor, title: String, systemImageName: String){
        super.init(frame: .zero)
        configuration = .tinted()
        configuration?.baseBackgroundColor = Color
        configuration?.baseForegroundColor = Color
        configuration?.title = title
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePlacement = .leading
        configuration?.imagePadding = 5
        

    }
}
