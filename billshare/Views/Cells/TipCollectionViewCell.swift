//
//  TipCollectionViewCell.swift
//  billshare
//
//  Created by Bubble Waffle on 14.09.2023.
//

import UIKit

class TipCollectionViewCell: UICollectionViewCell {
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
 //       label.font = UIFont(name: "Avenir Next Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.9529411765, alpha: 1)
        layer.cornerRadius = 10
        
        addSubview(percentLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        percentLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 3.4)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([        
            percentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            percentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
