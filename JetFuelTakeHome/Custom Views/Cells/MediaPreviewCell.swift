//
//  MediaPreviewCell.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class MediaPreviewCell: UICollectionViewCell {
    
    // MARK: - Views
    
    var coverPhotoImageView = CoverPhotoImageView(frame: .zero)
    var playButton = UIButton(frame: .zero)
    var copyLinkButton = UIButton(frame: .zero)
    var downloadButton = UIButton(frame: .zero)
    
    // MARK: - Properties
    
    static let reuseId = "MediaPreviewCell"
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure UI
    
    private func configure() {
        configureCoverPhotoImageView()
        configurePlayButton()
        configureCopyLinkButton()
        configureDownloadButton()
    }
    
    private func configureCoverPhotoImageView() {
        addSubview(coverPhotoImageView)
        coverPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coverPhotoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            coverPhotoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            coverPhotoImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            coverPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            coverPhotoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configurePlayButton() {
        addSubview(playButton)
        playButton.setImage(SFSymbols.play, for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.centerYAnchor.constraint(equalTo: coverPhotoImageView.centerYAnchor),
            playButton.centerXAnchor.constraint(equalTo: coverPhotoImageView.centerXAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            playButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureCopyLinkButton() {
        addSubview(copyLinkButton)
        copyLinkButton.setImage(SFSymbols.link, for: .normal)
        copyLinkButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            copyLinkButton.topAnchor.constraint(equalTo: coverPhotoImageView.bottomAnchor, constant: 10),
            copyLinkButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            copyLinkButton.widthAnchor.constraint(equalToConstant: 50),
            copyLinkButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureDownloadButton() {
        addSubview(downloadButton)
        downloadButton.setImage(SFSymbols.download, for: .normal)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            downloadButton.topAnchor.constraint(equalTo: coverPhotoImageView.bottomAnchor, constant: 10),
            downloadButton.leadingAnchor.constraint(equalTo: copyLinkButton.trailingAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 50),
            downloadButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Helpers
    
    func set(_ mediaItem: MediaItem) {
        coverPhotoImageView.setImage(fromURL: mediaItem.coverPhotoUrl ?? "")
    }
}
