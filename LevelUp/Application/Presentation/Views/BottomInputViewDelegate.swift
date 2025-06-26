//
//  BottomInputViewDelegate.swift
//  LevelUp
//
//  Created by Salvador Chavez on 25/06/25.
//


import UIKit

protocol BottomInputViewDelegate: AnyObject {
  func bottomInputViewDidTapSave(_ inputView: BottomInputView, text: String)
}

class BottomInputView: UIView {
  // MARK: – Subviews
  private let textField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Título de la tarea"
    tf.borderStyle = .roundedRect
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  private let saveButton: UIButton = {
    let btn = UIButton(type: .system)
    btn.setTitle("Guardar", for: .normal)
    btn.isEnabled = false
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  private let stack: UIStackView = {
    let sv = UIStackView()
    sv.axis = .horizontal
    sv.spacing = 8
    sv.alignment = .center
    sv.translatesAutoresizingMaskIntoConstraints = false
    return sv
  }()
  
  weak var delegate: BottomInputViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.1
    layer.shadowOffset = CGSize(width: 0, height: -2)
    setupLayout()
  }
  required init?(coder: NSCoder) { fatalError("no coder") }
  
  private func setupLayout() {
    addSubview(stack)
    stack.addArrangedSubview(textField)
    stack.addArrangedSubview(saveButton)
    NSLayoutConstraint.activate([
      stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
      stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
      stack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      stack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
      
      textField.heightAnchor.constraint(equalToConstant: 36),
      saveButton.widthAnchor.constraint(equalToConstant: 80)
    ])
    textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
  }
  
  @objc private func textChanged() {
    let txt = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    saveButton.isEnabled = !txt.isEmpty
  }
  
  @objc private func saveTapped() {
    let txt = textField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    delegate?.bottomInputViewDidTapSave(self, text: txt)
  }
  
  func clear() {
    textField.text = ""
    saveButton.isEnabled = false
  }
  
  func focus() {
    textField.becomeFirstResponder()
  }
  
  func blur() {
    textField.resignFirstResponder()
  }
}
