//
//  ViewController.swift
//  Counter
//
//  Created by Александр Меркулов on 17.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    private var score: Int = 0
    
    // outlet отображения счетчика
    @IBOutlet weak var scoreLabel: UILabel!
    // outlet кнопки увеличения значения
    @IBOutlet weak var addButton: UIButton!
    // outlet кнопки уменьшения значения
    @IBOutlet weak var subtractButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Выделение score жирным и увеличения size font
        let attributedText = NSMutableAttributedString(string: "Значение счётчика: \(score)")
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 22)
        ]
        let scoreRange = NSRange(location: 19, length: "\(score)".count)
        attributedText.addAttributes(boldAttributes, range: scoreRange)
        
        //MARK: Добавление форматированного текста в lable
        scoreLabel.attributedText = attributedText
        //MARK: Округление краев lable
        scoreLabel.layer.cornerRadius = 10
        scoreLabel.clipsToBounds = true
        
        //MARK: Настройка отображения кнопки добавления
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        addButton.layer.cornerRadius = 15
        //MARK: Настройка отображения кнопки уменьшения
        subtractButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        subtractButton.layer.cornerRadius = 15
    }
}

