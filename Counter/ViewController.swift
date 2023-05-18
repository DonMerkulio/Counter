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
        
        //MARK: TextView
        
        
        
        
        //MARK: КНОПКИ
        // изменение внешнего вида у кнопок увеличения и уменьшения
        addButton = changingApperanceButton(of: addButton)
        subtractButton = changingApperanceButton(of: subtractButton)
        resetButton.layer.cornerRadius = 20
        
    }
    
    //MARK: метод для изменения отображения кнопки (размер текста, округление формы)
    private func changingApperanceButton(of button: UIButton!) -> UIButton! {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.layer.cornerRadius = 20
        return button
    }
}

