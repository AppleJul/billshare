//
//  PersonsView.swift
//  billshare
//
//  Created by Bubble Waffle on 17.08.2023.
//

import UIKit

class PersonsView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.1882352941, green: 0.2235294118, blue: 0.2784313725, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var counter = 2
    
    let backgroundGreyView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9345039081, green: 0.9345039081, blue: 0.9345039081, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.4513477087, green: 0.4857000113, blue: 0.5633345246, alpha: 1)
        button.isEnabled = false
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.4513477087, green: 0.4857000113, blue: 0.5633345246, alpha: 1)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: frame.width / 26.7)
        counterLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
    }
    
    func setupView () {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(backgroundGreyView)
        backgroundGreyView.addSubview(minusButton)
        backgroundGreyView.addSubview(plusButton)
        backgroundGreyView.addSubview(counterLabel)
    }
    
    @objc func minusButtonTapped() {
        
        counter -= 1
        counterLabel.text = "\(counter)"
        
        if counter <= 2 {
            minusButton.isEnabled = false
        }
    }
    
    @objc func plusButtonTapped() {
        counter += 1
        counterLabel.text = "\(counter)"
        minusButton.isEnabled = true
    }
    
    func setConstraints () {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            backgroundGreyView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backgroundGreyView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundGreyView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundGreyView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            minusButton.topAnchor.constraint(equalTo: backgroundGreyView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGreyView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: backgroundGreyView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 60),
            
            plusButton.topAnchor.constraint(equalTo: backgroundGreyView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGreyView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: backgroundGreyView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 60),
            
            counterLabel.centerYAnchor.constraint(equalTo: backgroundGreyView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10),            
        ])
    }
}

