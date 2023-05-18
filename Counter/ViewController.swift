//
//  ViewController.swift
//  Counter
//
//  Created by Александр Меркулов on 17.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    private var score: Int = 0 {
        didSet {
            updateScoreLabel()
        }
    }
    
    
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
        // Добавление форматированного текста в lable
        scoreLabel.attributedText = changeScoreApperance(of: "Значение счетчика: \(score)")
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
    
    @IBAction func addScoreButton(_ sender: Any) {
        score += 1
    }
    
    @IBAction func subtractScoreButton(_ sender: Any) {
        score -= 1
    }
    
    @IBAction func resetScoreButton(_ sender: Any) {
        score = 0
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
    
    //MARK: метод для выделение "score" жирным и увеличения size font
    private func changeScoreApperance(of text: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: text)
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 22)
        ]
        let scoreRange = NSRange(location: 19, length: "\(score)".count)
        attributedText.addAttributes(boldAttributes, range: scoreRange)
        return attributedText
    }
    
    //MARK: метод обновления score lable
    private func updateScoreLabel() {
        scoreLabel.attributedText = changeScoreApperance(of: "Значение счетчика: \(score)")
    }
}

