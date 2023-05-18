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
    // outlet отображения истории изменений
    @IBOutlet weak var historyText: UITextView!
    
    // outlet кнопки увеличения значения
    @IBOutlet weak var addButton: UIButton!
    // outlet кнопки уменьшения значения
    @IBOutlet weak var subtractButton: UIButton!
    // outlet кнопки сброса значения
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: LABEL счетчик
        //Выделение "score" жирным и увеличения size font
        let attributedText = NSMutableAttributedString(string: "Значение счётчика: \(score)")
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 22)
        ]
        let scoreRange = NSRange(location: 19, length: "\(score)".count)
        attributedText.addAttributes(boldAttributes, range: scoreRange)
        
        // Добавление форматированного текста в lable
        scoreLabel.attributedText = attributedText
        // Округление краев lable
        scoreLabel.layer.cornerRadius = 10
        scoreLabel.clipsToBounds = true
        
        //MARK: TextView история изменений
        //Округление краев textField
        historyText.layer.cornerRadius = 10
        historyText.clipsToBounds = true
        
        
        //MARK: КНОПКИ
        // изменение внешнего вида у кнопок увеличения, уменьшения и сброса значения
        addButton = changingApperanceButton(of: addButton)
        subtractButton = changingApperanceButton(of: subtractButton)
        resetButton = changingApperanceButton(of: resetButton)
        
    }
    
    //MARK: метод для изменения отображения кнопки (размер текста, округление формы)
    private func changingApperanceButton(of button: UIButton!) -> UIButton! {
        // округление граний у кнопок
        button.layer.cornerRadius = 20
        // Добавление тени к кнопке
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        button.layer.masksToBounds = false
        return button
    }
}

