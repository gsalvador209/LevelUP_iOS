//
//  TaskCell.swift
//  LevelUp
//
//  Created by Salvador Chavez on 23/06/25.
//


import UIKit

class TaskCell: UITableViewCell {
    static let reuseIdentifier = "TaskCell"
    
    let uncheckedImage = UIImage(systemName: "square")
    let checkedImage = UIImage(systemName: "checkmark.square")
    
    // MARK: – Subviews
    private let completionButton: UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        //cb.contentEdgeInsets = .zero
        return cb
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .regular)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 13, weight: .light)
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let chipsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.alignment = .leading
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // MARK: – Inicializadores
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) no soportado") }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Limpiar chips previos
        chipsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        completionButton.removeTarget(nil, action: nil, for: .allEvents)
    }
    
    // MARK: – Setup UI
    private func setupSubviews() {
        contentView.addSubview(completionButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(chipsStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            //CompletionButton
           completionButton.leadingAnchor
               .constraint(equalTo: contentView.leadingAnchor, constant: 14),
           
           completionButton.widthAnchor.constraint(equalToConstant: 26),
           completionButton.heightAnchor.constraint(equalToConstant: 26),
           
           completionButton.centerYAnchor
               .constraint(equalTo: titleLabel.centerYAnchor),
            
            // Title
            titleLabel.leadingAnchor.constraint(equalTo: completionButton.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            // Description
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            
            // Chips Stack
            chipsStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            chipsStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -12),
            chipsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            chipsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
        
        //Forzar el horizontal del boton
        completionButton.setContentHuggingPriority(.required, for: .horizontal)
        completionButton.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    // MARK: – Configuración pública
    /// `item` combina tu modelo de dominio + datos de lista
    func configure(
        with task: TaskEntity,
        onCompletionToggled: @escaping (UUID) -> Void
    ) {
        //Titulo y desc
        let isDone = task.isCompleted
        
        titleLabel.attributedText = NSAttributedString(
            string: task.title!,
            attributes: isDone
            ? [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
            : [:]
        )
        
        let image = isDone
        ? checkedImage
        : uncheckedImage
        completionButton.setBackgroundImage(image, for: .normal)
        
        
        //Accion del swicth
        completionButton.addAction(
            UIAction{ _ in onCompletionToggled(task.id!) },
            for: .touchUpInside)
        
        //Limpieza de chips
        chipsStackView.arrangedSubviews.forEach{ $0.removeFromSuperview()}
        
        //Obtener la lista
        if let list = task.list {
            let colorId = list.colorId
            let bgColor = UIColor.listBackgroundColor(for: colorId)
            let textColor = UIColor.listTextColor(for: colorId)
            let name = list.customName ?? list.type!
            
            let chip = makeChip(text: name, bgColor: bgColor, textColor: textColor)
            chipsStackView.addArrangedSubview(chip)
        }
        
        if let dl = task.deadline {
            let df = DateFormatter(); df.dateStyle = .medium
            let tf = DateFormatter(); tf.timeStyle = .short
            chipsStackView.addArrangedSubview(makeChip(text: df.string(from: dl)))
            chipsStackView.addArrangedSubview(makeChip(text: tf.string(from: dl)))
        }
        
    }
    
    // MARK: – Helper para chips
    private func makeChip(
        text: String,
        bgColor: UIColor = .secondarySystemBackground,
        textColor: UIColor = .label,
        icon: UIImage? = nil
    ) -> UIView {
        let label = PaddingLabel()
        label.text = text
        label.font = .systemFont(ofSize: 13)
        label.textColor = textColor
        label.backgroundColor = bgColor
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        if let ic = icon {
            let iv = UIImageView(image: ic.withRenderingMode(.alwaysTemplate))
            iv.tintColor = textColor
            iv.translatesAutoresizingMaskIntoConstraints = false
            let stack = UIStackView(arrangedSubviews: [iv, label])
            stack.spacing = 4
            stack.alignment = .center
            return stack
        }
        return label
    }
}

// MARK: – UILabel con padding
private class PaddingLabel: UILabel {
    private let inset = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: inset))
    }
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + inset.left + inset.right,
            height: size.height + inset.top + inset.bottom
        )
    }
}

