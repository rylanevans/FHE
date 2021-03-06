//
//  Songs.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

func generateSongs() {
    getAllTasks()
    let song1 = Song(context: context)
    song1.order = 1
    song1.random = Int64(arc4random_uniform(100))
    song1.book = songBooksArray[1]
    song1.number = 2
    song1.url = "https://www.churchofjesuschrist.org/music/library/hymns/the-spirit-of-god?lang=eng"
    song1.title = "The Spirit of God"
    song1.topic = "Holy Ghost"
    song1.selected = false
    song1.favorite = false
    song1.sortingIndex = 0
    song1.alphabet = String(describing: song1.title![(song1.title!.startIndex)])
    
    let song2 = Song(context: context)
    song2.order = 2
    song2.random = Int64(arc4random_uniform(1000))
    song2.book = songBooksArray[1]
    song2.number = 19
    song2.url = "https://www.churchofjesuschrist.org/music/library/hymns/we-thank-thee-o-god-for-a-prophet?lang=eng"
    song2.title = "We Thank Thee, O God, for a Prophet"
    song2.topic = "Restoration"
    song2.selected = false
    song2.favorite = false
    song2.sortingIndex = 0
    song2.alphabet = String(describing: song2.title![(song2.title!.startIndex)])
    
    let song3 = Song(context: context)
    song3.order = 3
    song3.random = Int64(arc4random_uniform(1000))
    song3.book = songBooksArray[1]
    song3.number = 27
    song3.url = "https://www.churchofjesuschrist.org/music/library/hymns/praise-to-the-man?lang=eng"
    song3.title = "Praise to the Man"
    song3.topic = "Restoration"
    song3.selected = false
    song3.favorite = false
    song3.sortingIndex = 0
    song3.alphabet = String(describing: song3.title![(song3.title!.startIndex)])
    
    let song4 = Song(context: context)
    song4.order = 4
    song4.random = Int64(arc4random_uniform(1000))
    song4.book = songBooksArray[1]
    song4.number = 29
    song4.url = "https://www.churchofjesuschrist.org/music/library/hymns/a-poor-wayfaring-man-of-grief?lang=eng"
    song4.title = "A Poor Wayfaring Man of Grief"
    song4.topic = "Care for the Poor & Needy"
    song4.selected = false
    song4.favorite = false
    song4.sortingIndex = 0
    song4.alphabet = String(describing: song4.title![(song4.title!.startIndex)])
    
    let song5 = Song(context: context)
    song5.order = 5
    song5.random = Int64(arc4random_uniform(1000))
    song5.book = songBooksArray[1]
    song5.number = 85
    song5.url = "https://www.churchofjesuschrist.org/music/library/hymns/how-firm-a-foundation?lang=eng"
    song5.title = "How Firm a Foundation"
    song5.topic = "Atonement"
    song5.selected = false
    song5.favorite = false
    song5.sortingIndex = 0
    song5.alphabet = String(describing: song5.title![(song5.title!.startIndex)])
    
    let song6 = Song(context: context)
    song6.order = 6
    song6.random = Int64(arc4random_uniform(1000))
    song6.book = songBooksArray[1]
    song6.number = 89
    song6.url = "https://www.churchofjesuschrist.org/music/library/hymns/the-lord-is-my-light?lang=eng"
    song6.title = "The Lord Is My Light"
    song6.topic = "Jesus Christ"
    song6.selected = false
    song6.favorite = false
    song6.sortingIndex = 0
    song6.alphabet = String(describing: song6.title![(song6.title!.startIndex)])
    
    let song7 = Song(context: context)
    song7.order = 7
    song7.random = Int64(arc4random_uniform(1000))
    song7.book = songBooksArray[1]
    song7.number = 92
    song7.url = "https://www.churchofjesuschrist.org/music/library/hymns/for-the-beauty-of-the-earth?lang=eng"
    song7.title = "For the Beauty of the Earth"
    song7.topic = "Plan of Salvation"
    song7.selected = false
    song7.favorite = false
    song7.sortingIndex = 0
    song7.alphabet = String(describing: song7.title![(song7.title!.startIndex)])
    
    let song8 = Song(context: context)
    song8.order = 8
    song8.random = Int64(arc4random_uniform(1000))
    song8.book = songBooksArray[1]
    song8.number = 98
    song8.url = "https://www.churchofjesuschrist.org/music/library/hymns/i-need-thee-every-hour?lang=eng"
    song8.title = "I Need Thee Every Hour"
    song8.topic = "Jesus Christ"
    song8.selected = false
    song8.favorite = true
    song8.sortingIndex = 0
    song8.alphabet = String(describing: song8.title![(song8.title!.startIndex)])
    
    let song9 = Song(context: context)
    song9.order = 9
    song9.random = Int64(arc4random_uniform(1000))
    song9.book = songBooksArray[1]
    song9.number = 100
    song9.url = "https://www.churchofjesuschrist.org/music/library/hymns/nearer-my-god-to-thee?lang=eng"
    song9.title = "Nearer, My God, to Thee"
    song9.topic = "Heavenly Father"
    song9.selected = false
    song9.favorite = true
    song9.sortingIndex = 0
    song9.alphabet = String(describing: song9.title![(song9.title!.startIndex)])
    
    let song10 = Song(context: context)
    song10.order = 10
    song10.random = Int64(arc4random_uniform(1000))
    song10.book = songBooksArray[1]
    song10.number = 103
    song10.url = "https://www.churchofjesuschrist.org/music/library/hymns/precious-savior-dear-redeemer?lang=eng"
    song10.title = "Precious Savior, Dear Redeemer"
    song10.topic = "Jesus Christ"
    song10.selected = false
    song10.favorite = false
    song10.sortingIndex = 0
    song10.alphabet = String(describing: song10.title![(song10.title!.startIndex)])
    
    let song11 = Song(context: context)
    song11.order = 11
    song11.random = Int64(arc4random_uniform(1000))
    song11.book = songBooksArray[1]
    song11.number = 106
    song11.url = "https://www.churchofjesuschrist.org/music/library/hymns/god-speed-the-right?lang=eng"
    song11.title = "God Speed the Right"
    song11.topic = "Heavenly Father"
    song11.selected = false
    song11.favorite = false
    song11.sortingIndex = 0
    song11.alphabet = String(describing: song11.title![(song11.title!.startIndex)])
    
    let song12 = Song(context: context)
    song12.order = 12
    song12.random = Int64(arc4random_uniform(1000))
    song12.book = songBooksArray[1]
    song12.number = 108
    song12.url = "https://www.churchofjesuschrist.org/music/library/hymns/the-lord-is-my-shepherd?lang=eng"
    song12.title = "The Lord Is My Shepherd"
    song12.topic = "Jesus Christ"
    song12.selected = false
    song12.favorite = false
    song12.sortingIndex = 0
    song12.alphabet = String(describing: song12.title![(song1.title!.startIndex)])
    
    let song13 = Song(context: context)
    song13.order = 13
    song13.random = Int64(arc4random_uniform(1000))
    song13.book = songBooksArray[1]
    song13.number = 113
    song13.url = "https://www.churchofjesuschrist.org/music/library/hymns/our-saviors-love?lang=eng"
    song13.title = "Our Savior’s Love"
    song13.topic = "Christlike Attributes"
    song13.selected = false
    song13.favorite = false
    song13.sortingIndex = 0
    song13.alphabet = String(describing: song13.title![(song13.title!.startIndex)])
    
    let song14 = Song(context: context)
    song14.order = 14
    song14.random = Int64(arc4random_uniform(1000))
    song14.book = songBooksArray[1]
    song14.number = 116
    song14.url = "https://www.churchofjesuschrist.org/music/library/hymns/come-follow-me?lang=eng"
    song14.title = "Come, Follow Me"
    song14.topic = "Commandments"
    song14.selected = false
    song14.favorite = false
    song14.sortingIndex = 0
    song14.alphabet = String(describing: song14.title![(song14.title!.startIndex)])
    
    let song15 = Song(context: context)
    song15.order = 15
    song15.random = Int64(arc4random_uniform(1000))
    song15.book = songBooksArray[1]
    song15.number = 130
    song15.url = "https://www.churchofjesuschrist.org/music/library/hymns/be-thou-humble?lang=eng"
    song15.title = "Be Thou Humble"
    song15.topic = "Christlike Attributes"
    song15.selected = false
    song15.favorite = false
    song15.sortingIndex = 0
    song15.alphabet = String(describing: song15.title![(song15.title!.startIndex)])
    
    let song16 = Song(context: context)
    song16.order = 16
    song16.random = Int64(arc4random_uniform(1000))
    song16.book = songBooksArray[1]
    song16.number = 131
    song16.url = "https://www.churchofjesuschrist.org/music/library/hymns/more-holiness-give-me?lang=eng"
    song16.title = "More Holiness Give Me"
    song16.topic = "Christlike Attributes"
    song16.selected = false
    song16.favorite = false
    song16.sortingIndex = 0
    song16.alphabet = String(describing: song16.title![(song16.title!.startIndex)])
    
    let song17 = Song(context: context)
    song17.order = 17
    song17.random = Int64(arc4random_uniform(1000))
    song17.book = songBooksArray[1]
    song17.number = 133
    song17.url = "https://www.churchofjesuschrist.org/music/library/hymns/father-in-heaven?lang=eng"
    song17.title = "Father in Heaven"
    song17.topic = "Heavenly Father"
    song17.selected = false
    song17.favorite = false
    song17.sortingIndex = 0
    song17.alphabet = String(describing: song17.title![(song17.title!.startIndex)])
    
    let song18 = Song(context: context)
    song18.order = 18
    song18.random = Int64(arc4random_uniform(1000))
    song18.book = songBooksArray[1]
    song18.number = 134
    song18.url = "https://www.churchofjesuschrist.org/music/library/hymns/i-believe-in-christ?lang=eng"
    song18.title = "I Believe in Christ"
    song18.topic = "Jesus Christ"
    song18.selected = false
    song18.favorite = false
    song18.sortingIndex = 0
    song18.alphabet = String(describing: song18.title![(song18.title!.startIndex)])
    
    let song19 = Song(context: context)
    song19.order = 19
    song19.random = Int64(arc4random_uniform(1000))
    song19.book = songBooksArray[1]
    song19.number = 136
    song19.url = "https://www.churchofjesuschrist.org/music/library/hymns/i-know-that-my-redeemer-lives?lang=eng"
    song19.title = "I Know That My Redeemer Lives"
    song19.topic = "Jesus Christ"
    song19.selected = false
    song19.favorite = false
    song19.sortingIndex = 0
    song19.alphabet = String(describing: song19.title![(song19.title!.startIndex)])
    
    let song20 = Song(context: context)
    song20.order = 20
    song20.random = Int64(arc4random_uniform(1000))
    song20.book = songBooksArray[1]
    song20.number = 137
    song20.url = "https://www.churchofjesuschrist.org/music/library/hymns/testimony?lang=eng"
    song20.title = "Testimony"
    song20.topic = "Christlike Attributes"
    song20.selected = false
    song20.favorite = false
    song20.sortingIndex = 0
    song20.alphabet = String(describing: song20.title![(song20.title!.startIndex)])
    
    let song21 = Song(context: context)
    song21.order = 21
    song21.random = Int64(arc4random_uniform(1000))
    song21.book = songBooksArray[1]
    song21.number = 140
    song21.url = "https://www.churchofjesuschrist.org/music/library/hymns/did-you-think-to-pray?lang=eng"
    song21.title = "Did You Think to Pray?"
    song21.topic = "Commandments"
    song21.selected = false
    song21.favorite = false
    song21.sortingIndex = 0
    song21.alphabet = String(describing: song21.title![(song21.title!.startIndex)])
    
    let song22 = Song(context: context)
    song22.order = 22
    song22.random = Int64(arc4random_uniform(1000))
    song22.book = songBooksArray[1]
    song22.number = 142
    song22.url = "https://www.churchofjesuschrist.org/music/library/hymns/sweet-hour-of-prayer?lang=eng"
    song22.title = "Sweet Hour of Prayer"
    song22.topic = "Commandments"
    song22.selected = false
    song22.favorite = false
    song22.sortingIndex = 0
    song22.alphabet = String(describing: song22.title![(song22.title!.startIndex)])
    
    let song23 = Song(context: context)
    song23.order = 23
    song23.random = Int64(arc4random_uniform(1000))
    song23.book = songBooksArray[1]
    song23.number = 152
    song23.url = "https://www.churchofjesuschrist.org/music/library/hymns/god-be-with-you-till-we-meet-again?lang=eng"
    song23.title = "God Be with You Till We Meet Again"
    song23.topic = "Plan of Salvation"
    song23.selected = false
    song23.favorite = false
    song23.sortingIndex = 0
    song23.alphabet = String(describing: song23.title![(song23.title!.startIndex)])
    
    let song24 = Song(context: context)
    song24.order = 24
    song24.random = Int64(arc4random_uniform(1000))
    song24.book = songBooksArray[1]
    song24.number = 165
    song24.url = "https://www.churchofjesuschrist.org/music/library/hymns/abide-with-me-tis-eventide?lang=eng"
    song24.title = "Abide with Me; ’Tis Eventide"
    song24.topic = "Jesus Christ"
    song24.selected = false
    song24.favorite = false
    song24.sortingIndex = 0
    song24.alphabet = String(describing: song24.title![(song24.title!.startIndex)])
    
    let song25 = Song(context: context)
    song25.order = 25
    song25.random = Int64(arc4random_uniform(1000))
    song25.book = songBooksArray[1]
    song25.number = 170
    song25.url = "https://www.churchofjesuschrist.org/music/library/hymns/god-our-father-hear-us-pray?lang=eng"
    song25.title = "God, Our Father, Hear Us Pray"
    song25.topic = "Heavenly Father"
    song25.selected = false
    song25.favorite = false
    song25.sortingIndex = 0
    song25.alphabet = String(describing: song25.title![(song25.title!.startIndex)])

    let song26 = Song(context: context)
    song26.order = 26
    song26.random = Int64(arc4random_uniform(1000))
    song26.book = songBooksArray[1]
    song26.number = 193
    song26.url = "https://www.churchofjesuschrist.org/music/library/hymns/i-stand-all-amazed?lang=eng"
    song26.title = "I Stand All Amazed"
    song26.topic = "Heavenly Father"
    song26.selected = false
    song26.favorite = false
    song26.sortingIndex = 0
    song26.alphabet = String(describing: song26.title![(song26.title!.startIndex)])

    let song27 = Song(context: context)
    song27.order = 27
    song27.random = Int64(arc4random_uniform(1000))
    song27.book = songBooksArray[1]
    song27.number = 194
    song27.url = "https://www.churchofjesuschrist.org/music/library/hymns/there-is-a-green-hill-far-away?lang=eng"
    song27.title = "There Is a Green Hill Far Away"
    song27.topic = "Atonement"
    song27.selected = false
    song27.favorite = false
    song27.sortingIndex = 0
    song27.alphabet = String(describing: song27.title![(song27.title!.startIndex)])

    let song28 = Song(context: context)
    song28.order = 28
    song28.random = Int64(arc4random_uniform(1000))
    song28.book = songBooksArray[1]
    song28.number = 199
    song28.url = "https://www.churchofjesuschrist.org/music/library/hymns/he-is-risen?lang=eng"
    song28.title = "He Is Risen!"
    song28.topic = "Resurrection"
    song28.selected = false
    song28.favorite = false
    song28.sortingIndex = 0
    song28.alphabet = String(describing: song28.title![(song28.title!.startIndex)])

    let song29 = Song(context: context)
    song29.order = 29
    song29.random = Int64(arc4random_uniform(1000))
    song29.book = songBooksArray[1]
    song29.number = 203
    song29.url = "https://www.churchofjesuschrist.org/music/library/hymns/angels-we-have-heard-on-high?lang=eng"
    song29.title = "Angels We Have Heard on High"
    song29.topic = "Birth of our Savior"
    song29.selected = false
    song29.favorite = false
    song29.sortingIndex = 0
    song29.alphabet = String(describing: song29.title![(song29.title!.startIndex)])

    let song30 = Song(context: context)
    song30.order = 30
    song30.random = Int64(arc4random_uniform(1000))
    song30.book = songBooksArray[1]
    song30.number = 204
    song30.url = "https://www.churchofjesuschrist.org/music/library/hymns/silent-night?lang=eng"
    song30.title = "Silent Night"
    song30.topic = "Birth of our Savior"
    song30.selected = false
    song30.favorite = false
    song30.sortingIndex = 0
    song30.alphabet = String(describing: song30.title![(song30.title!.startIndex)])

    let song31 = Song(context: context)
    song31.order = 31
    song31.random = Int64(arc4random_uniform(1000))
    song31.book = songBooksArray[1]
    song31.number = 209
    song31.url = "https://www.churchofjesuschrist.org/music/library/hymns/hark-the-herald-angels-sing?lang=eng"
    song31.title = "Hark! The Herald Angels Sing"
    song31.topic = "Birth of our Savior"
    song31.selected = false
    song31.favorite = false
    song31.sortingIndex = 0
    song31.alphabet = String(describing: song31.title![(song31.title!.startIndex)])

    let song32 = Song(context: context)
    song32.order = 32
    song32.random = Int64(arc4random_uniform(1000))
    song32.book = songBooksArray[1]
    song32.number = 213
    song32.url = "https://www.churchofjesuschrist.org/music/library/hymns/the-first-noel?lang=eng"
    song32.title = "The First Noel"
    song32.topic = "Birth of our Savior"
    song32.selected = false
    song32.favorite = false
    song32.sortingIndex = 0
    song32.alphabet = String(describing: song32.title![(song32.title!.startIndex)])

    let song33 = Song(context: context)
    song33.order = 33
    song33.random = Int64(arc4random_uniform(1000))
    song33.book = songBooksArray[1]
    song33.number = 223
    song33.url = "https://www.churchofjesuschrist.org/music/library/hymns/have-i-done-any-good?lang=eng"
    song33.title = "Have I Done Any Good?"
    song33.topic = "Care for the Poor & Needy"
    song33.selected = false
    song33.favorite = false
    song33.sortingIndex = 0
    song33.alphabet = String(describing: song33.title![(song33.title!.startIndex)])

    let song34 = Song(context: context)
    song34.order = 34
    song34.random = Int64(arc4random_uniform(1000))
    song34.book = songBooksArray[1]
    song34.number = 227
    song34.url = "https://www.churchofjesuschrist.org/music/library/hymns/there-is-sunshine-in-my-soul-today?lang=eng"
    song34.title = "There Is Sunshine in My Soul Today"
    song34.topic = "Holy Ghost"
    song34.selected = false
    song34.favorite = false
    song34.sortingIndex = 0
    song34.alphabet = String(describing: song34.title![(song34.title!.startIndex)])

    let song35 = Song(context: context)
    song35.order = 35
    song35.random = Int64(arc4random_uniform(1000))
    song35.book = songBooksArray[1]
    song35.number = 239
    song35.url = "https://www.churchofjesuschrist.org/music/library/hymns/choose-the-right?lang=eng"
    song35.title = "Choose the Right"
    song35.topic = "Commandments"
    song35.selected = false
    song35.favorite = true
    song35.sortingIndex = 0
    song35.alphabet = String(describing: song35.title![(song35.title!.startIndex)])
    
    let song36 = Song(context: context)
    song36.order = 36
    song36.random = Int64(arc4random_uniform(1000))
    song36.book = songBooksArray[1]
    song36.number = 243
    song36.url = "https://www.churchofjesuschrist.org/music/library/hymns/let-us-all-press-on?lang=eng"
    song36.title = "Let Us All Press On"
    song36.topic = "Endure to the end"
    song36.selected = false
    song36.favorite = false
    song36.sortingIndex = 0
    song36.alphabet = String(describing: song36.title![(song36.title!.startIndex)])
    
    let song37 = Song(context: context)
    song37.order = 37
    song37.random = Int64(arc4random_uniform(1000))
    song37.book = songBooksArray[1]
    song37.number = 246
    song37.url = "https://www.churchofjesuschrist.org/music/library/hymns/onward-christian-soldiers?lang=eng"
    song37.title = "Onward, Christian Soldiers"
    song37.topic = "Perfect the Saints"
    song37.selected = false
    song37.favorite = false
    song37.sortingIndex = 0
    song37.alphabet = String(describing: song37.title![(song37.title!.startIndex)])
    
    let song38 = Song(context: context)
    song38.order = 38
    song38.random = Int64(arc4random_uniform(1000))
    song38.book = songBooksArray[1]
    song38.number = 249
    song38.url = "https://www.churchofjesuschrist.org/music/library/hymns/called-to-serve?lang=eng"
    song38.title = "Called to Serve"
    song38.topic = "Proclaim the Gospel"
    song38.selected = false
    song38.favorite = false
    song38.sortingIndex = 0
    song38.alphabet = String(describing: song38.title![(song38.title!.startIndex)])
    
    let song39 = Song(context: context)
    song39.order = 39
    song39.random = Int64(arc4random_uniform(1000))
    song39.book = songBooksArray[1]
    song39.number = 250
    song39.url = "https://www.churchofjesuschrist.org/music/library/hymns/we-are-all-enlisted?lang=eng"
    song39.title = "We Are All Enlisted"
    song39.topic = "Perfect the Saints"
    song39.selected = false
    song39.favorite = false
    song39.sortingIndex = 0
    song39.alphabet = String(describing: song39.title![(song39.title!.startIndex)])
    
    let song40 = Song(context: context)
    song40.order = 40
    song40.random = Int64(arc4random_uniform(1000))
    song40.book = songBooksArray[1]
    song40.number = 252
    song40.url = "https://www.churchofjesuschrist.org/music/library/hymns/put-your-shoulder-to-the-wheel?lang=eng"
    song40.title = "Put Your Shoulder to the Wheel"
    song40.topic = "Endure to the end"
    song40.selected = false
    song40.favorite = false
    song40.sortingIndex = 0
    song40.alphabet = String(describing: song40.title![(song40.title!.startIndex)])
    
    let song41 = Song(context: context)
    song41.order = 41
    song41.random = Int64(arc4random_uniform(1000))
    song41.book = songBooksArray[1]
    song41.number = 255
    song41.url = "https://www.churchofjesuschrist.org/music/library/hymns/carry-on?lang=eng"
    song41.title = "Carry On"
    song41.topic = "Endure to the end"
    song41.selected = false
    song41.favorite = false
    song41.sortingIndex = 0
    song41.alphabet = String(describing: song41.title![(song41.title!.startIndex)])
    
    let song42 = Song(context: context)
    song42.order = 42
    song42.random = Int64(arc4random_uniform(1000))
    song42.book = songBooksArray[1]
    song42.number = 259
    song42.url = "https://www.churchofjesuschrist.org/music/library/hymns/hope-of-israel?lang=eng"
    song42.title = "Hope of Israel"
    song42.topic = "Perfect the Saints"
    song42.selected = false
    song42.favorite = false
    song42.sortingIndex = 0
    song42.alphabet = String(describing: song42.title![(song42.title!.startIndex)])
    
    let song43 = Song(context: context)
    song43.order = 43
    song43.random = Int64(arc4random_uniform(1000))
    song43.book = songBooksArray[1]
    song43.number = 260
    song43.url = "https://www.churchofjesuschrist.org/music/library/hymns/whos-on-the-lords-side?lang=eng"
    song43.title = "Who’s on the Lord’s Side?"
    song43.topic = "Perfect the Saints"
    song43.selected = false
    song43.favorite = false
    song43.sortingIndex = 0
    song43.alphabet = String(describing: song43.title![(song43.title!.startIndex)])
    
    let song51 = Song(context: context)
    song51.order = 51
    song51.random = Int64(arc4random_uniform(100))
    song51.book = songBooksArray[0]
    song51.number = 2
    song51.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/i-am-a-child-of-god?lang=eng"
    song51.title = "I Am a Child of God"
    song51.topic = "Heavenly Father"
    song51.selected = false
    song51.favorite = true
    song51.sortingIndex = 0
    song51.alphabet = String(describing: song51.title![(song51.title!.startIndex)])
    
    let song52 = Song(context: context)
    song52.order = 52
    song52.random = Int64(arc4random_uniform(1000))
    song52.book = songBooksArray[0]
    song52.number = 4
    song52.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/i-lived-in-heaven?lang=eng"
    song52.title = "I Lived in Heaven"
    song52.topic = "Plan of Salvation"
    song52.selected = false
    song52.favorite = false
    song52.sortingIndex = 0
    song52.alphabet = String(describing: song52.title![(song52.title!.startIndex)])
    
    let song53 = Song(context: context)
    song53.order = 53
    song53.random = Int64(arc4random_uniform(1000))
    song53.book = songBooksArray[0]
    song53.number = 5
    song53.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/i-know-my-father-lives?lang=eng"
    song53.title = "I Know My Father Lives"
    song53.topic = "Heavenly Father"
    song53.selected = false
    song53.favorite = false
    song53.sortingIndex = 0
    song53.alphabet = String(describing: song53.title![(song53.title!.startIndex)])
    
    let song54 = Song(context: context)
    song54.order = 54
    song54.random = Int64(arc4random_uniform(1000))
    song54.book = songBooksArray[0]
    song54.number = 7
    song54.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/i-thank-thee-dear-father?lang=eng"
    song54.title = "I Thank Thee, Dear Father"
    song54.topic = "Heavenly Father"
    song54.selected = false
    song54.favorite = false
    song54.sortingIndex = 0
    song54.alphabet = String(describing: song54.title![(song54.title!.startIndex)])
    
    let song55 = Song(context: context)
    song55.order = 55
    song55.random = Int64(arc4random_uniform(1000))
    song55.book = songBooksArray[0]
    song55.number = 11
    song55.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/im-thankful-to-be-me?lang=eng"
    song55.title = "I’m Thankful to Be Me"
    song55.topic = "Christlike Attributes"
    song55.selected = false
    song55.favorite = false
    song55.sortingIndex = 0
    song55.alphabet = String(describing: song55.title![(song55.title!.startIndex)])
    
    let song56 = Song(context: context)
    song56.order = 56
    song56.random = Int64(arc4random_uniform(1000))
    song56.book = songBooksArray[0]
    song56.number = 12
    song56.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/a-childs-prayer?lang=eng"
    song56.title = "A Child’s Prayer"
    song56.topic = "Heavenly Father"
    song56.selected = true
    song56.favorite = true
    song56.selectedOne = taskSong
    song56.sortingIndex = 0
    song56.alphabet = String(describing: song56.title![(song56.title!.startIndex)])
    
    let song57 = Song(context: context)
    song57.order = 57
    song57.random = Int64(arc4random_uniform(1000))
    song57.book = songBooksArray[0]
    song57.number = 16
    song57.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/children-all-over-the-world?lang=eng"
    song57.title = "Children All Over the World"
    song57.topic = "Plan of Salvation"
    song57.selected = false
    song57.favorite = false
    song57.sortingIndex = 0
    song57.alphabet = String(describing: song57.title![(song57.title!.startIndex)])
    
    let song58 = Song(context: context)
    song58.order = 58
    song58.random = Int64(arc4random_uniform(1000))
    song58.book = songBooksArray[0]
    song58.number = 26
    song58.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/reverently-quietly?lang=eng"
    song58.title = "Reverently, Quietly"
    song58.topic = "Christlike Attributes"
    song58.selected = false
    song58.favorite = false
    song58.sortingIndex = 0
    song58.alphabet = String(describing: song58.title![(song58.title!.startIndex)])
    
    let song59 = Song(context: context)
    song59.order = 59
    song59.random = Int64(arc4random_uniform(1000))
    song59.book = songBooksArray[0]
    song59.number = 37
    song59.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/stars-were-gleaming?lang=eng"
    song59.title = "Stars Were Gleaming"
    song59.topic = "Birth of our Savior"
    song59.selected = false
    song59.favorite = false
    song59.sortingIndex = 0
    song59.alphabet = String(describing: song59.title![(song59.title!.startIndex)])
    
    let song60 = Song(context: context)
    song60.order = 60
    song60.random = Int64(arc4random_uniform(1000))
    song60.book = songBooksArray[0]
    song60.number = 42
    song60.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/away-in-a-manger?lang=eng"
    song60.title = "Away in a Manger"
    song60.topic = "Birth of our Savior"
    song60.selected = false
    song60.favorite = false
    song60.sortingIndex = 0
    song60.alphabet = String(describing: song1.title![(song1.title!.startIndex)])
    
    let song61 = Song(context: context)
    song61.order = 61
    song61.random = Int64(arc4random_uniform(1000))
    song61.book = songBooksArray[0]
    song61.number = 47
    song61.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/sleep-little-jesus?lang=eng"
    song61.title = "Sleep, Little Jesus"
    song61.topic = "Birth of our Savior"
    song61.selected = false
    song61.favorite = false
    song61.sortingIndex = 0
    song61.alphabet = String(describing: song61.title![(song61.title!.startIndex)])
    
    let song62 = Song(context: context)
    song62.order = 62
    song62.random = Int64(arc4random_uniform(1000))
    song62.book = songBooksArray[0]
    song62.number = 55
    song62.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/jesus-once-was-a-little-child?lang=eng"
    song62.title = "Jesus Once Was a Little Child"
    song62.topic = "Jesus Christ"
    song62.selected = false
    song62.favorite = false
    song62.sortingIndex = 0
    song62.alphabet = String(describing: song62.title![(song62.title!.startIndex)])
    
    let song63 = Song(context: context)
    song63.order = 63
    song63.random = Int64(arc4random_uniform(1000))
    song63.book = songBooksArray[0]
    song63.number = 57
    song63.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/tell-me-the-stories-of-jesus?lang=eng"
    song63.title = "Tell Me the Stories of Jesus"
    song63.topic = "Jesus Christ"
    song63.selected = false
    song63.favorite = false
    song63.sortingIndex = 0
    song63.alphabet = String(describing: song63.title![(song63.title!.startIndex)])
    
    let song64 = Song(context: context)
    song64.order = 64
    song64.random = Int64(arc4random_uniform(1000))
    song64.book = songBooksArray[0]
    song64.number = 60
    song64.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/jesus-wants-me-for-a-sunbeam?lang=eng"
    song64.title = "Jesus Wants Me for a Sunbeam"
    song64.topic = "Jesus Christ"
    song64.selected = false
    song64.favorite = false
    song64.sortingIndex = 0
    song64.alphabet = String(describing: song64.title![(song64.title!.startIndex)])
    
    let song65 = Song(context: context)
    song65.order = 65
    song65.random = Int64(arc4random_uniform(1000))
    song65.book = songBooksArray[0]
    song65.number = 74
    song65.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/i-feel-my-saviors-love?lang=eng"
    song65.title = "I Feel My Savior’s Love"
    song65.topic = "Christlike Attributes"
    song65.selected = false
    song65.favorite = false
    song65.sortingIndex = 0
    song65.alphabet = String(describing: song65.title![(song65.title!.startIndex)])
    
    let song66 = Song(context: context)
    song66.order = 66
    song66.random = Int64(arc4random_uniform(1000))
    song66.book = songBooksArray[0]
    song66.number = 78
    song66.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/im-trying-to-be-like-jesus?lang=eng"
    song66.title = "I’m Trying to Be like Jesus"
    song66.topic = "Jesus Christ"
    song66.selected = false
    song66.favorite = false
    song66.sortingIndex = 0
    song66.alphabet = String(describing: song66.title![(song66.title!.startIndex)])
    
    let song67 = Song(context: context)
    song67.order = 67
    song67.random = Int64(arc4random_uniform(1000))
    song67.book = songBooksArray[0]
    song67.number = 82
    song67.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/when-he-comes-again?lang=eng"
    song67.title = "When He Comes Again"
    song67.topic = "Jesus Christ"
    song67.selected = false
    song67.favorite = false
    song67.sortingIndex = 0
    song67.alphabet = String(describing: song67.title![(song67.title!.startIndex)])
    
    let song68 = Song(context: context)
    song68.order = 68
    song68.random = Int64(arc4random_uniform(1000))
    song68.book = songBooksArray[0]
    song68.number = 86
    song68.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/the-golden-plates?lang=eng"
    song68.title = "The Golden Plates"
    song68.topic = "Scriptures"
    song68.selected = false
    song68.favorite = false
    song68.sortingIndex = 0
    song68.alphabet = String(describing: song68.title![(song68.title!.startIndex)])
    
    let song69 = Song(context: context)
    song69.order = 69
    song69.random = Int64(arc4random_uniform(1000))
    song69.book = songBooksArray[0]
    song69.number = 95
    song69.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/i-love-to-see-the-temple?lang=eng"
    song69.title = "I Love to See the Temple"
    song69.topic = "Redeem the Dead"
    song69.selected = false
    song69.favorite = true
    song69.sortingIndex = 0
    song69.alphabet = String(describing: song69.title![(song69.title!.startIndex)])
    
    let song70 = Song(context: context)
    song70.order = 70
    song70.random = Int64(arc4random_uniform(1000))
    song70.book = songBooksArray[0]
    song70.number = 96
    song70.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/faith?lang=eng"
    song70.title = "Faith"
    song70.topic = "Principles & Ordinances"
    song70.selected = false
    song70.favorite = false
    song70.sortingIndex = 0
    song70.alphabet = String(describing: song70.title![(song70.title!.startIndex)])
    
    let song71 = Song(context: context)
    song71.order = 71
    song71.random = Int64(arc4random_uniform(1000))
    song71.book = songBooksArray[0]
    song71.number = 98
    song71.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/repentance?lang=eng"
    song71.title = "Repentance"
    song71.topic = "Principles & Ordinances"
    song71.selected = false
    song71.favorite = false
    song71.sortingIndex = 0
    song71.alphabet = String(describing: song71.title![(song71.title!.startIndex)])
    
    let song72 = Song(context: context)
    song72.order = 72
    song72.random = Int64(arc4random_uniform(1000))
    song72.book = songBooksArray[0]
    song72.number = 100
    song72.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/baptism?lang=eng"
    song72.title = "Baptism"
    song72.topic = "Principles & Ordinances"
    song72.selected = false
    song72.favorite = false
    song72.sortingIndex = 0
    song72.alphabet = String(describing: song72.title![(song72.title!.startIndex)])
    
    let song73 = Song(context: context)
    song73.order = 73
    song73.random = Int64(arc4random_uniform(1000))
    song73.book = songBooksArray[0]
    song73.number = 103
    song73.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/when-i-am-baptized?lang=eng"
    song73.title = "When I Am Baptized"
    song73.topic = "Principles & Ordinances"
    song73.selected = false
    song73.favorite = false
    song73.sortingIndex = 0
    song73.alphabet = String(describing: song73.title![(song73.title!.startIndex)])
    
    let song74 = Song(context: context)
    song74.order = 74
    song74.random = Int64(arc4random_uniform(1000))
    song74.book = songBooksArray[0]
    song74.number = 105
    song74.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/the-holy-ghost?lang=eng"
    song74.title = "The Holy Ghost"
    song74.topic = "Principles & Ordinances"
    song74.selected = false
    song74.favorite = false
    song74.sortingIndex = 0
    song74.alphabet = String(describing: song74.title![(song74.title!.startIndex)])
    
    let song75 = Song(context: context)
    song75.order = 75
    song75.random = Int64(arc4random_uniform(1000))
    song75.book = songBooksArray[0]
    song75.number = 109
    song75.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/search-ponder-and-pray?lang=eng"
    song75.title = "Search, Ponder, and Pray"
    song75.topic = "Commandments"
    song75.selected = false
    song75.favorite = false
    song75.sortingIndex = 0
    song75.alphabet = String(describing: song75.title![(song75.title!.startIndex)])
    
    let song76 = Song(context: context)
    song76.order = 76
    song76.random = Int64(arc4random_uniform(1000))
    song76.book = songBooksArray[0]
    song76.number = 110
    song76.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/follow-the-prophet?lang=eng"
    song76.title = "Follow the Prophet"
    song76.topic = "Restoration"
    song76.selected = false
    song76.favorite = false
    song76.sortingIndex = 0
    song76.alphabet = String(describing: song76.title![(song76.title!.startIndex)])
    
    let song77 = Song(context: context)
    song77.order = 77
    song77.random = Int64(arc4random_uniform(1000))
    song77.book = songBooksArray[0]
    song77.number = 112
    song77.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/the-commandments?lang=eng"
    song77.title = "The Commandments"
    song77.topic = "Commandments"
    song77.selected = false
    song77.favorite = false
    song77.sortingIndex = 0
    song77.alphabet = String(describing: song77.title![(song77.title!.startIndex)])
    
    let song78 = Song(context: context)
    song78.order = 78
    song78.random = Int64(arc4random_uniform(1000))
    song78.book = songBooksArray[0]
    song78.number = 118
    song78.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/book-of-mormon-stories?lang=eng"
    song78.title = "Book of Mormon Stories"
    song78.topic = "Scriptures"
    song78.selected = false
    song78.favorite = false
    song78.sortingIndex = 0
    song78.alphabet = String(describing: song78.title![(song78.title!.startIndex)])
    
    let song79 = Song(context: context)
    song79.order = 2
    song79.random = Int64(arc4random_uniform(1000))
    song79.book = songBooksArray[0]
    song79.number = 120
    song79.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/nephis-courage?lang=eng"
    song79.title = "Nephi’s Courage"
    song79.topic = "Christlike Attributes"
    song79.selected = false
    song79.favorite = false
    song79.sortingIndex = 0
    song79.alphabet = String(describing: song79.title![(song79.title!.startIndex)])
    
    let song80 = Song(context: context)
    song80.order = 80
    song80.random = Int64(arc4random_uniform(1000))
    song80.book = songBooksArray[0]
    song80.number = 136
    song80.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/love-one-another?lang=eng"
    song80.title = "Love One Another"
    song80.topic = "Commandments"
    song80.selected = false
    song80.favorite = true
    song80.sortingIndex = 0
    song80.alphabet = String(describing: song80.title![(song80.title!.startIndex)])
    
    let song81 = Song(context: context)
    song81.order = 81
    song81.random = Int64(arc4random_uniform(1000))
    song81.book = songBooksArray[0]
    song81.number = 146
    song81.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/keep-the-commandments?lang=eng"
    song81.title = "Keep the Commandments"
    song81.topic = "Commandments"
    song81.selected = false
    song81.favorite = true
    song81.sortingIndex = 0
    song81.alphabet = String(describing: song81.title![(song81.title!.startIndex)])
    
    let song82 = Song(context: context)
    song82.order = 82
    song82.random = Int64(arc4random_uniform(1000))
    song82.book = songBooksArray[0]
    song82.number = 158
    song82.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/dare-to-do-right?lang=eng"
    song82.title = "Dare to Do Right"
    song82.topic = "Endure to the end"
    song82.selected = false
    song82.favorite = false
    song82.sortingIndex = 0
    song82.alphabet = String(describing: song82.title![(song82.title!.startIndex)])
    
    let song83 = Song(context: context)
    song83.order = 83
    song83.random = Int64(arc4random_uniform(1000))
    song83.book = songBooksArray[0]
    song83.number = 159
    song83.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/stand-for-the-right?lang=eng"
    song83.title = "Stand for the Right"
    song83.topic = "Commandments"
    song83.selected = false
    song83.favorite = false
    song83.sortingIndex = 0
    song83.alphabet = String(describing: song83.title![(song83.title!.startIndex)])
    
    let song84 = Song(context: context)
    song84.order = 84
    song84.random = Int64(arc4random_uniform(1000))
    song84.book = songBooksArray[0]
    song84.number = 160
    song84.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/choose-the-right-way?lang=eng"
    song84.title = "Choose the Right Way"
    song84.topic = "Christlike Attributes"
    song84.selected = false
    song84.favorite = true
    song84.sortingIndex = 0
    song84.alphabet = String(describing: song84.title![(song84.title!.startIndex)])
    
    let song85 = Song(context: context)
    song85.order = 85
    song85.random = Int64(arc4random_uniform(1000))
    song85.book = songBooksArray[0]
    song85.number = 163
    song85.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/i-am-like-a-star?lang=eng"
    song85.title = "I Am Like a Star"
    song85.topic = "Heavenly Father"
    song85.selected = false
    song85.favorite = false
    song85.sortingIndex = 0
    song85.alphabet = String(describing: song85.title![(song85.title!.startIndex)])
    
    let song86 = Song(context: context)
    song86.order = 86
    song86.random = Int64(arc4random_uniform(1000))
    song86.book = songBooksArray[0]
    song86.number = 169
    song86.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/i-hope-they-call-me-on-a-mission?lang=eng"
    song86.title = "I Hope They Call Me on a Mission"
    song86.topic = "Proclaim the Gospel"
    song86.selected = false
    song86.favorite = false
    song86.sortingIndex = 0
    song86.alphabet = String(describing: song86.title![(song86.title!.startIndex)])
    
    let song87 = Song(context: context)
    song87.order = 87
    song87.random = Int64(arc4random_uniform(1000))
    song87.book = songBooksArray[0]
    song87.number = 172
    song87.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/well-bring-the-world-his-truth-army-of-helaman?lang=eng"
    song87.title = "We’ll Bring the World His Truth"
    song87.topic = "Proclaim the Gospel"
    song87.selected = false
    song87.favorite = false
    song87.sortingIndex = 0
    song87.alphabet = String(describing: song87.title![(song87.title!.startIndex)])
    
    let song88 = Song(context: context)
    song88.order = 88
    song88.random = Int64(arc4random_uniform(1000))
    song88.book = songBooksArray[0]
    song88.number = 174
    song88.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/called-to-serve?lang=eng"
    song88.title = "Called to Serve"
    song88.topic = "Proclaim the Gospel"
    song88.selected = false
    song88.favorite = false
    song88.sortingIndex = 0
    song88.alphabet = String(describing: song88.title![(song88.title!.startIndex)])
    
    let song89 = Song(context: context)
    song89.order = 89
    song89.random = Int64(arc4random_uniform(1000))
    song89.book = songBooksArray[0]
    song89.number = 176
    song89.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/tell-me-dear-lord?lang=eng"
    song89.title = "Tell Me, Dear Lord"
    song89.topic = "Heavenly Father"
    song89.selected = false
    song89.favorite = false
    song89.sortingIndex = 0
    song89.alphabet = String(describing: song89.title![(song89.title!.startIndex)])
    
    let song90 = Song(context: context)
    song90.order = 90
    song90.random = Int64(arc4random_uniform(1000))
    song90.book = songBooksArray[0]
    song90.number = 177
    song90.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/teach-me-to-walk-in-the-light?lang=eng"
    song90.title = "Teach Me to Walk in the Light"
    song90.topic = "Christlike Attributes"
    song90.selected = false
    song90.favorite = false
    song90.sortingIndex = 0
    song90.alphabet = String(describing: song90.title![(song90.title!.startIndex)])
    
    let song91 = Song(context: context)
    song91.order = 91
    song91.random = Int64(arc4random_uniform(1000))
    song91.book = songBooksArray[0]
    song91.number = 178
    song91.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/teacher-do-you-love-me?lang=eng"
    song91.title = "Teacher, Do You Love Me?"
    song91.topic = "Christlike Attributes"
    song91.selected = false
    song91.favorite = false
    song91.sortingIndex = 0
    song91.alphabet = String(describing: song91.title![(song91.title!.startIndex)])
    
    let song92 = Song(context: context)
    song92.order = 92
    song92.random = Int64(arc4random_uniform(1000))
    song92.book = songBooksArray[0]
    song92.number = 188
    song92.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/families-can-be-together-forever?lang=eng"
    song92.title = "Families Can Be Together Forever"
    song92.topic = "Plan of Salvation"
    song92.selected = false
    song92.favorite = true
    song92.sortingIndex = 0
    song92.alphabet = String(describing: song92.title![(song92.title!.startIndex)])
    
    let song93 = Song(context: context)
    song93.order = 93
    song93.random = Int64(arc4random_uniform(1000))
    song93.book = songBooksArray[0]
    song93.number = 190
    song93.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/love-is-spoken-here?lang=eng"
    song93.title = "Love Is Spoken Here"
    song93.topic = "Christlike Attributes"
    song93.selected = false
    song93.favorite = true
    song93.sortingIndex = 0
    song93.alphabet = String(describing: song93.title![(song93.title!.startIndex)])
    
    let song94 = Song(context: context)
    song94.order = 94
    song94.random = Int64(arc4random_uniform(1000))
    song94.book = songBooksArray[0]
    song94.number = 204
    song94.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/mother-tell-me-the-story?lang=eng"
    song94.title = "Mother, Tell Me the Story"
    song94.topic = "Jesus Christ"
    song94.selected = false
    song94.favorite = false
    song94.sortingIndex = 0
    song94.alphabet = String(describing: song94.title![(song94.title!.startIndex)])
    
    let song95 = Song(context: context)
    song95.order = 95
    song95.random = Int64(arc4random_uniform(1000))
    song95.book = songBooksArray[0]
    song95.number = 206
    song95.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/dearest-mother-i-love-you?lang=eng"
    song95.title = "Dearest Mother, I Love You"
    song95.topic = "Christlike Attributes"
    song95.selected = false
    song95.favorite = false
    song95.sortingIndex = 0
    song95.alphabet = String(describing: song95.title![(song95.title!.startIndex)])
    
    let song96 = Song(context: context)
    song96.order = 96
    song96.random = Int64(arc4random_uniform(1000))
    song96.book = songBooksArray[0]
    song96.number = 206
    song96.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/mother-dear?lang=eng"
    song96.title = "Mother Dear"
    song96.topic = "Plan of Salvation"
    song96.selected = false
    song96.favorite = false
    song96.sortingIndex = 0
    song96.alphabet = String(describing: song96.title![(song96.title!.startIndex)])
    
    let song97 = Song(context: context)
    song97.order = 97
    song97.random = Int64(arc4random_uniform(1000))
    song97.book = songBooksArray[0]
    song97.number = 236
    song97.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/give-said-the-little-stream?lang=eng"
    song97.title = "Give, Said the Little Stream"
    song97.topic = "Christlike Attributes"
    song97.selected = false
    song97.favorite = false
    song97.sortingIndex = 0
    song97.alphabet = String(describing: song97.title![(song97.title!.startIndex)])
    
    let song98 = Song(context: context)
    song98.order = 98
    song98.random = Int64(arc4random_uniform(1000))
    song98.book = songBooksArray[0]
    song98.number = 266
    song98.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/if-youre-happy?lang=eng"
    song98.title = "If You’re Happy"
    song98.topic = "Christlike Attributes"
    song98.selected = false
    song98.favorite = false
    song98.sortingIndex = 0
    song98.alphabet = String(describing: song98.title![(song98.title!.startIndex)])
    
    let song99 = Song(context: context)
    song99.order = 99
    song99.random = Int64(arc4random_uniform(1000))
    song99.book = songBooksArray[0]
    song99.number = 278
    song99.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/stand-up?lang=eng"
    song99.title = "Stand Up"
    song99.topic = "Christlike Attributes"
    song99.selected = false
    song99.favorite = false
    song99.sortingIndex = 0
    song99.alphabet = String(describing: song99.title![(song99.title!.startIndex)])
    
    let song100 = Song(context: context)
    song100.order = 100
    song100.random = Int64(arc4random_uniform(1000))
    song100.book = songBooksArray[0]
    song100.number = 281
    song100.url = "https://www.churchofjesuschrist.org/music/library/childrens-songbook/the-wise-man-and-the-foolish-man?lang=eng"
    song100.title = "The Wise Man and the Foolish Man"
    song100.topic = "Christlike Attributes"
    song100.selected = false
    song100.favorite = true
    song100.sortingIndex = 0
    song100.alphabet = String(describing: song100.title![(song100.title!.startIndex)])
    
    let song101 = Song(context: context)
    song101.order = 101
    song101.random = Int64(arc4random_uniform(1000))
    song101.book = songBooksArray[2]
    song101.number = 0
    song101.url = "https://www.youtube.com/watch?v=KZ_VlQ8M5EE"
    song101.title = "Gethsemane"
    song101.topic = "Atonement"
    song101.selected = false
    song101.favorite = true
    song101.sortingIndex = 0
    song101.alphabet = String(describing: song101.title![(song101.title!.startIndex)])
    
    let song102 = Song(context: context)
    song102.order = 102
    song102.random = Int64(arc4random_uniform(1000))
    song102.book = songBooksArray[2]
    song102.number = 0
    song102.url = "https://www.youtube.com/watch?v=nomxXk6Q1rk"
    song102.title = "Glorious"
    song102.topic = "Plan of Salvation"
    song102.selected = false
    song102.favorite = true
    song102.sortingIndex = 0
    song102.alphabet = String(describing: song102.title![(song102.title!.startIndex)])
    
    let song103 = Song(context: context)
    song103.order = 103
    song103.random = Int64(arc4random_uniform(1000))
    song103.book = songBooksArray[2]
    song103.number = 0
    song103.url = "https://www.youtube.com/watch?v=fc4aptFGpRg"
    song103.title = "If You Could Hie to Kolob"
    song103.topic = "Plan of Salvation"
    song103.selected = false
    song103.favorite = false
    song103.sortingIndex = 0
    song103.alphabet = String(describing: song103.title![(song103.title!.startIndex)])
    
    let song104 = Song(context: context)
    song104.order = 104
    song104.random = Int64(arc4random_uniform(1000))
    song104.book = songBooksArray[2]
    song104.number = 0
    song104.url = "https://www.youtube.com/playlist?list=PLzM4iKMyZBGM2zy6nHvZ9uAUM2PPNRtZl"
    song104.title = "Vocal Point"
    song104.topic = "Spiritual"
    song104.selected = false
    song104.favorite = false
    song104.sortingIndex = 0
    song104.alphabet = String(describing: song104.title![(song104.title!.startIndex)])
    
    let song105 = Song(context: context)
    song105.order = 105
    song105.random = Int64(arc4random_uniform(1000))
    song105.book = songBooksArray[2]
    song105.number = 0
    song105.url = "https://www.youtube.com/playlist?list=PLxKIAPWA4GegdsofSzjD__73Lkz0uqNkv"
    song105.title = "BYU Noteworthy"
    song105.topic = "Spiritual"
    song105.selected = false
    song105.favorite = false
    song105.sortingIndex = 0
    song105.alphabet = String(describing: song105.title![(song105.title!.startIndex)])
    
    let song106 = Song(context: context)
    song106.order = 106
    song106.random = Int64(arc4random_uniform(1000))
    song106.book = songBooksArray[2]
    song106.number = 0
    song106.url = "https://www.youtube.com/playlist?list=PLAYgY8SPtEWHYdx-L9Oj8kr1uNu3qlfZS"
    song106.title = "Mormon Channel"
    song106.topic = "Spiritual"
    song106.selected = false
    song106.favorite = true
    song106.sortingIndex = 0
    song106.alphabet = String(describing: song106.title![(song106.title!.startIndex)])
    
    let song107 = Song(context: context)
    song107.order = 107
    song107.random = Int64(arc4random_uniform(1000))
    song107.book = songBooksArray[2]
    song107.number = 0
    song107.url = "https://www.youtube.com/playlist?list=PLe0BvbTylcNOLByU0dnGJCW4u2YWYiC_Y"
    song107.title = "LDS Youth"
    song107.topic = "Spiritual"
    song107.selected = false
    song107.favorite = true
    song107.sortingIndex = 0
    song107.alphabet = String(describing: song107.title![(song107.title!.startIndex)])
    
    let song108 = Song(context: context)
    song108.order = 108
    song108.random = Int64(arc4random_uniform(1000))
    song108.book = songBooksArray[2]
    song108.number = 0
    song108.url = "https://www.youtube.com/watch?v=R46J-GjbRWA"
    song108.title = "Peace in Christ"
    song108.topic = "Spiritual"
    song108.selected = false
    song108.favorite = true
    song108.sortingIndex = 0
    song108.alphabet = String(describing: song108.title![(song108.title!.startIndex)])
    
    ad.saveContext()
}
