//
//  ViewController.swift
//  YouGuess
//
//  Created by c w on 2021/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        var title = UILabel()
        
        title.text = "YOU GUESS"
        
        title.font = UIFont.systemFont(ofSize: 22)
        
        title.backgroundColor = .gray
       
        view.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        var score = UILabel()
        
        score.text = "YOUR SCORE: 87"
        
        score.backgroundColor = .blue
        
        score.font = UIFont.systemFont(ofSize: 22)
       
        view.addSubview(score)
        
        score.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
        var question = UILabel()
        
        question.text = "question: xxxxxxxxxxxxxxxxx"
        
        question.backgroundColor = .green
        
        question.font = UIFont.systemFont(ofSize: 22)
       
        view.addSubview(question)
        
        question.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0
        
        
        
        var correct = UIButton(type: .custom)
      
        
        correct.setTitle("正确", for: .normal)
      
        correct.backgroundColor = .green
        
        correct.addTarget(self, action:#selector(self.press_correct), for: .touchUpInside)
       
        correct.translatesAutoresizingMaskIntoConstraints = false
        
        
//        correct.topAnchor.constraint(equalTo: question.bottomAnchor, constant: 10).isActive = true
//
//        correct.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true

    
        


        var uncorrect = UIButton(type: .custom)
        
        uncorrect.setTitle("错误", for: .normal)
        
        uncorrect.backgroundColor = .red
        
        uncorrect.addTarget(self, action:#selector(self.press_uncorrect), for: .touchUpInside)
       
        uncorrect.translatesAutoresizingMaskIntoConstraints = false
        
//        uncorrect.topAnchor.constraint(equalTo: correct.bottomAnchor, constant: 10).isActive = true
//
//        uncorrect.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        
        
        
        //Stack View
        let btnGroupStack   = UIStackView()
        btnGroupStack.axis  = NSLayoutConstraint.Axis.horizontal
        btnGroupStack.distribution  = UIStackView.Distribution.fillEqually
        btnGroupStack.alignment = UIStackView.Alignment.center
        btnGroupStack.spacing   = 16.0
        btnGroupStack.backgroundColor = .gray
        
        
        btnGroupStack.addArrangedSubview(correct)
        btnGroupStack.addArrangedSubview(uncorrect)
        
        btnGroupStack.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(btnGroupStack)
        
        
        
        
        
        
        
        
        
        
        
        
        
        var progress_bar = UIView()

        progress_bar.backgroundColor = .yellow
        
        progress_bar.translatesAutoresizingMaskIntoConstraints = false;
        
        progress_bar.widthAnchor.constraint(equalToConstant:  view.frame.width*2/13 ).isActive = true
       
        progress_bar.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
       
        
        
        
        
        
        var progress_text = UILabel()
        
        progress_text.text = "1/13"
        
        progress_text.font = UIFont.systemFont(ofSize: 16)
        
        progress_text.backgroundColor = .white

        progress_text.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
        //Stack View
        let progress_stack   = UIStackView()
        progress_stack.axis  = NSLayoutConstraint.Axis.vertical
        progress_stack.distribution  = UIStackView.Distribution.fill
        progress_stack.alignment = UIStackView.Alignment.leading
        progress_stack.spacing   = 0
        progress_stack.backgroundColor = .white
        
        
        progress_stack.addArrangedSubview(progress_text)
        progress_stack.addArrangedSubview(progress_bar)
   
        
        progress_stack.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(progress_stack)
        
        progress_stack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        progress_stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        
        
        
        title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        score.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        question.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnGroupStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
        title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        title.bottomAnchor.constraint(equalTo: score.topAnchor, constant: -10).isActive = true
        
        score.bottomAnchor.constraint(equalTo: question.topAnchor, constant: -10).isActive = true
        
        question.bottomAnchor.constraint(equalTo: btnGroupStack.topAnchor, constant: -10).isActive = true
        
        btnGroupStack.bottomAnchor.constraint(equalTo: progress_stack.topAnchor, constant: -10).isActive = true
        
        
        btnGroupStack.heightAnchor.constraint(equalTo: question.heightAnchor).isActive = true
        
        question.heightAnchor.constraint(equalTo: score.heightAnchor).isActive = true
        
        score.heightAnchor.constraint(equalTo: title.heightAnchor).isActive = true



        // Do any additional setup after loading the view.
    }
    
    
    @objc func press_correct(sender: UIButton!) {
        var alertView = UIAlertView();
        alertView.addButton(withTitle: "Ok");
        alertView.title = "title";
        alertView.message = "correct";
        alertView.show();
    }
    
    @objc func press_uncorrect(sender: UIButton!) {
        var alertView = UIAlertView();
        alertView.addButton(withTitle: "Ok");
        alertView.title = "title";
        alertView.message = "uncorrect";
        alertView.show();
    }


}

