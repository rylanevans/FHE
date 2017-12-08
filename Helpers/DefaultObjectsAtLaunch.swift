//
//  DefaultObjectsAtLaunch.swift
//  FHE
//
//  Created by Rylan Evans on 11/15/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func checkIfLauncedBefore() {
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    
    if launchedBefore == true {
        print("Not first launch.")
        addToTickToCounter()
        getTasks()
        getAttendingMembers()
    } else {
        print("First launch, setting UserDefault.")
        beginTickCounter()
        generateFamilyMembers()
        generateTasks()
        generateSongs()
        UserDefaults.standard.set(true, forKey: "launchedBefore")
    }
}

func addToTickToCounter() {
    let fetchRequest: NSFetchRequest<Counter> = Counter.fetchRequest()
    
    do {
        counterArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
    
    if counter.launched > 0 {
        counter.launched += 1
        ad.saveContext()
    }
}

func beginTickCounter(){
    let counter = Counter(context: context)
    counter.launched = 1
    ad.saveContext()
    
    let fetchRequest: NSFetchRequest<Counter> = Counter.fetchRequest()
    
    do {
        counterArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func generateFamilyMembers() {
    let memberAuto = Member(context: context)
    memberAuto.name = "Auto-Assign"
    memberAuto.age = 0
    memberAuto.attending = true
    memberAuto.order = 0
    memberAuto.photo = #imageLiteral(resourceName: "Missing Profile") as UIImage
    memberAuto.random = Int64(arc4random_uniform(100))
    
    let memberDad = Member(context: context)
    memberDad.name = "Dad"
    memberDad.age = 38
    memberDad.attending = true
    memberDad.order = 1
    memberDad.photo = #imageLiteral(resourceName: "Dad") as UIImage
    memberDad.random = Int64(arc4random_uniform(100))
    
    let memberMom = Member(context: context)
    memberMom.name = "Mom"
    memberMom.age = 36
    memberMom.attending = true
    memberMom.order = 2
    memberMom.photo = #imageLiteral(resourceName: "Mom") as UIImage
    memberMom.random = Int64(arc4random_uniform(100))
    
    let memberLilly = Member(context: context)
    memberLilly.name = "Lilly"
    memberLilly.age = 12
    memberLilly.attending = true
    memberLilly.order = 3
    memberLilly.photo = #imageLiteral(resourceName: "Lilly") as UIImage
    memberLilly.random = Int64(arc4random_uniform(100))
    
    let memberAnisten = Member(context: context)
    memberAnisten.name = "Anisten"
    memberAnisten.age = 10
    memberAnisten.attending = true
    memberAnisten.order = 4
    memberAnisten.photo = #imageLiteral(resourceName: "Anisten") as UIImage
    memberAnisten.random = Int64(arc4random_uniform(100))
    
    let memberReed = Member(context: context)
    memberReed.name = "Reed"
    memberReed.age = 8
    memberReed.attending = true
    memberReed.order = 5
    memberReed.photo = #imageLiteral(resourceName: "Reed") as UIImage
    memberReed.random = Int64(arc4random_uniform(100))
    
    let memberClaire = Member(context: context)
    memberClaire.name = "Claire"
    memberClaire.age = 5
    memberClaire.attending = true
    memberClaire.order = 6
    memberClaire.photo = #imageLiteral(resourceName: "Claire") as UIImage
    memberClaire.random = Int64(arc4random_uniform(100))
    
    let memberPapa = Member(context: context)
    memberPapa.name = "Papa"
    memberPapa.age = 60
    memberPapa.attending = false
    memberPapa.order = 7
    memberPapa.photo = #imageLiteral(resourceName: "Papa") as UIImage
    memberPapa.random = Int64(arc4random_uniform(100))
    
    let memberGrammy = Member(context: context)
    memberGrammy.name = "Grammy"
    memberGrammy.age = 55
    memberGrammy.attending = false
    memberGrammy.order = 8
    memberGrammy.photo = #imageLiteral(resourceName: "Grammy") as UIImage
    memberGrammy.random = Int64(arc4random_uniform(100))
    
    let memberGuest = Member(context: context)
    memberGuest.name = "Guest"
    memberGuest.age = 100
    memberGuest.attending = false
    memberGuest.order = 9
    memberGuest.photo = #imageLiteral(resourceName: "Missing Profile") as UIImage
    memberGuest.random = Int64(arc4random_uniform(100))
    
    ad.saveContext()
}

func generateTasks() {
    getAttendingMembers()
    let taskOpenPrayer = Task(context: context)
    taskOpenPrayer.assigned = false
    let assigneetaskOpenPrayer = membersArray[0]
    taskOpenPrayer.assignment = assigneetaskOpenPrayer
    taskOpenPrayer.defaultNumber = 1
    taskOpenPrayer.enabled = true
    taskOpenPrayer.name = "Opening Prayer"
    taskOpenPrayer.order = Int64(arc4random_uniform(100))
    taskOpenPrayer.segment = 1
    taskOpenPrayer.image = #imageLiteral(resourceName: "Prayer")
    
    let taskSongs = Task(context: context)
    taskSongs.assigned = false
    let assigneetaskSongs = membersArray[1]
    taskSongs.assignment = assigneetaskSongs
    taskSongs.defaultNumber = 2
    taskSongs.enabled = true
    taskSongs.name = "Song"
    taskSongs.order = Int64(arc4random_uniform(100))
    taskSongs.segment = 1
    taskSongs.image = #imageLiteral(resourceName: "Song")
    
    let taskRule = Task(context: context)
    taskRule.assigned = false
    let assigneetaskRule = membersArray[0]
    taskRule.assignment = assigneetaskRule
    taskRule.defaultNumber = 3
    taskRule.enabled = false
    taskRule.name = "Rule"
    taskRule.order = Int64(arc4random_uniform(100))
    taskRule.segment = 1
    taskRule.image = #imageLiteral(resourceName: "Rule")
    
    let taskScripture = Task(context: context)
    taskScripture.assigned = false
    let assigneetaskScripture = membersArray[2]
    taskScripture.assignment = assigneetaskScripture
    taskScripture.defaultNumber = 4
    taskScripture.enabled = true
    taskScripture.name = "Scripture"
    taskScripture.order = Int64(arc4random_uniform(100))
    taskScripture.segment = 1
    taskScripture.image = #imageLiteral(resourceName: "Scripture")
    
    let taskCalendar = Task(context: context)
    taskCalendar.assigned = false
    let assigneetaskCalendar = membersArray[0]
    taskCalendar.assignment = assigneetaskCalendar
    taskCalendar.defaultNumber = 5
    taskCalendar.enabled = false
    taskCalendar.name = "Calendar"
    taskCalendar.order = Int64(arc4random_uniform(100))
    taskCalendar.segment = 1
    taskCalendar.image = #imageLiteral(resourceName: "Calendar")
    
    let taskTestimony = Task(context: context)
    taskTestimony.assigned = false
    let assigneetaskTestimony = membersArray[0]
    taskTestimony.assignment = assigneetaskTestimony
    taskTestimony.defaultNumber = 6
    taskTestimony.enabled = false
    taskTestimony.name = "Testimony"
    taskTestimony.order = Int64(arc4random_uniform(100))
    taskTestimony.segment = 1
    taskTestimony.image = #imageLiteral(resourceName: "Testimony")
    
    let taskSpotlight = Task(context: context)
    taskSpotlight.assigned = false
    let assigneetaskSpotlight = membersArray[0]
    taskSpotlight.assignment = assigneetaskSpotlight
    taskSpotlight.defaultNumber = 7
    taskSpotlight.enabled = false
    taskSpotlight.name = "Spotlight"
    taskSpotlight.order = Int64(arc4random_uniform(100))
    taskSpotlight.segment = 1
    taskSpotlight.image = #imageLiteral(resourceName: "Spotlight")
    
    let taskMisc = Task(context: context)
    taskMisc.assigned = false
    let assigneetaskMisc = membersArray[0]
    taskMisc.assignment = assigneetaskMisc
    taskMisc.defaultNumber = 8
    taskMisc.enabled = false
    taskMisc.name = "Misc"
    taskMisc.order = Int64(arc4random_uniform(100))
    taskMisc.segment = 1
    taskMisc.image = #imageLiteral(resourceName: "Misc")
    
    let taskThought = Task(context: context)
    taskThought.assigned = false
    let assigneetaskThought = membersArray[0]
    taskThought.assignment = assigneetaskThought
    taskThought.defaultNumber = 9
    taskThought.enabled = false
    taskThought.name = "Thought"
    taskThought.order = Int64(arc4random_uniform(100))
    taskThought.segment = 1
    taskThought.image = #imageLiteral(resourceName: "Thought")
    
    let taskLesson = Task(context: context)
    taskLesson.assigned = false
    let assigneetaskLesson = membersArray[3]
    taskLesson.assignment = assigneetaskLesson
    taskLesson.defaultNumber = 10
    taskLesson.enabled = true
    taskLesson.name = "Lesson"
    taskLesson.order = Int64(arc4random_uniform(100))
    taskLesson.segment = 1
    taskLesson.image = #imageLiteral(resourceName: "Lesson")
    
    let taskCouncil = Task(context: context)
    taskCouncil.assigned = false
    let assigneetaskCouncil = membersArray[0]
    taskCouncil.assignment = assigneetaskCouncil
    taskCouncil.defaultNumber = 11
    taskCouncil.enabled = false
    taskCouncil.name = "Council"
    taskCouncil.order = Int64(arc4random_uniform(100))
    taskCouncil.segment = 1
    taskCouncil.image = #imageLiteral(resourceName: "Council")
    
    let taskGame = Task(context: context)
    taskGame.assigned = false
    let assigneetaskGame = membersArray[4]
    taskGame.assignment = assigneetaskGame
    taskGame.defaultNumber = 12
    taskGame.enabled = true
    taskGame.name = "Activity"
    taskGame.order = Int64(arc4random_uniform(100))
    taskGame.segment = 1
    taskGame.image = #imageLiteral(resourceName: "Game")
    
    let taskClosePrayer = Task(context: context)
    taskClosePrayer.assigned = false
    let assigneetaskClosePrayer = membersArray[5]
    taskClosePrayer.assignment = assigneetaskClosePrayer
    taskClosePrayer.defaultNumber = 13
    taskClosePrayer.enabled = true
    taskClosePrayer.name = "Closing Prayer"
    taskClosePrayer.order = Int64(arc4random_uniform(100))
    taskClosePrayer.segment = 1
    taskClosePrayer.image = #imageLiteral(resourceName: "Prayer")
    
    let taskTreat = Task(context: context)
    taskTreat.assigned = false
    let assigneetaskTreat = membersArray[0]
    taskTreat.assignment = assigneetaskTreat
    taskTreat.defaultNumber = 14
    taskTreat.enabled = true
    taskTreat.name = "Treat"
    taskTreat.order = Int64(arc4random_uniform(100))
    taskTreat.segment = 1
    taskTreat.image = #imageLiteral(resourceName: "Treat")
    
    ad.saveContext()
}

func generatePray() {
    getTasks()
    let prayer = Prayer(context: context)
    prayer.title = "Steps to prayer"
    prayer.detail = "1. Address Heavenly Father/n2. Share Gratitude/n3. Ask for needs/n4. Close in Jesus Christ's name"
    prayer.selected = true
    prayer.selectedOne = selectedPrayer
}

func generateSongs() {
    getTasks()
    let song1 = Song(context: context)
    song1.order = 1
    song1.random = Int64(arc4random_uniform(100))
    song1.book = songBooksArray[1]
    song1.number = 2
    song1.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
    song1.title = "The Spirit of God"
    song1.topic = "Holy Ghost"
    song1.selected = false
    song1.favorite = false
    song1.sortingIndex = 0
    
    let song2 = Song(context: context)
    song2.order = 2
    song2.random = Int64(arc4random_uniform(1000))
    song2.book = songBooksArray[1]
    song2.number = 19
    song2.url = "https://www.lds.org/music/library/hymns/we-thank-thee-o-god-for-a-prophet?lang=eng"
    song2.title = "We Thank Thee, O God, for a Prophet"
    song2.topic = "Restoration"
    song2.selected = false
    song2.favorite = false
    song2.sortingIndex = 0
    
    let song3 = Song(context: context)
    song3.order = 3
    song3.random = Int64(arc4random_uniform(1000))
    song3.book = songBooksArray[1]
    song3.number = 27
    song3.url = "https://www.lds.org/music/library/hymns/praise-to-the-man?lang=eng"
    song3.title = "Praise to the Man"
    song3.topic = "Restoration"
    song3.selected = false
    song3.favorite = false
    song3.sortingIndex = 0
    
    let song4 = Song(context: context)
    song4.order = 4
    song4.random = Int64(arc4random_uniform(1000))
    song4.book = songBooksArray[1]
    song4.number = 29
    song4.url = "https://www.lds.org/music/library/hymns/a-poor-wayfaring-man-of-grief?lang=eng"
    song4.title = "A Poor Wayfaring Man of Grief"
    song4.topic = "Care for the Poor & Needy"
    song4.selected = false
    song4.favorite = false
    song4.sortingIndex = 0
    
    let song5 = Song(context: context)
    song5.order = 5
    song5.random = Int64(arc4random_uniform(1000))
    song5.book = songBooksArray[1]
    song5.number = 85
    song5.url = "https://www.lds.org/music/library/hymns/how-firm-a-foundation?lang=eng"
    song5.title = "How Firm a Foundation"
    song5.topic = "Atonement"
    song5.selected = false
    song5.favorite = false
    song5.sortingIndex = 0
    
    let song6 = Song(context: context)
    song6.order = 6
    song6.random = Int64(arc4random_uniform(1000))
    song6.book = songBooksArray[1]
    song6.number = 89
    song6.url = "https://www.lds.org/music/library/hymns/the-lord-is-my-light?lang=eng"
    song6.title = "The Lord Is My Light"
    song6.topic = "Jesus Christ"
    song6.selected = false
    song6.favorite = false
    song6.sortingIndex = 0
    
    let song7 = Song(context: context)
    song7.order = 7
    song7.random = Int64(arc4random_uniform(1000))
    song7.book = songBooksArray[1]
    song7.number = 92
    song7.url = "https://www.lds.org/music/library/hymns/for-the-beauty-of-the-earth?lang=eng"
    song7.title = "For the Beauty of the Earth"
    song7.topic = "Plan of Salvation"
    song7.selected = false
    song7.favorite = false
    song7.sortingIndex = 0
    
    let song8 = Song(context: context)
    song8.order = 8
    song8.random = Int64(arc4random_uniform(1000))
    song8.book = songBooksArray[1]
    song8.number = 98
    song8.url = "https://www.lds.org/music/library/hymns/i-need-thee-every-hour?lang=eng"
    song8.title = "I Need Thee Every Hour"
    song8.topic = "Jesus Christ"
    song8.selected = false
    song8.favorite = true
    song8.sortingIndex = 0
    
    let song9 = Song(context: context)
    song9.order = 9
    song9.random = Int64(arc4random_uniform(1000))
    song9.book = songBooksArray[1]
    song9.number = 100
    song9.url = "https://www.lds.org/music/library/hymns/nearer-my-god-to-thee?lang=eng"
    song9.title = "Nearer, My God, to Thee"
    song9.topic = "Heavenly Father"
    song9.selected = false
    song9.favorite = true
    song9.sortingIndex = 0
    
    let song10 = Song(context: context)
    song10.order = 10
    song10.random = Int64(arc4random_uniform(1000))
    song10.book = songBooksArray[1]
    song10.number = 103
    song10.url = "https://www.lds.org/music/library/hymns/precious-savior-dear-redeemer?lang=eng"
    song10.title = "Precious Savior, Dear Redeemer"
    song10.topic = "Jesus Christ"
    song10.selected = false
    song10.favorite = false
    song10.sortingIndex = 0
    
    let song11 = Song(context: context)
    song11.order = 11
    song11.random = Int64(arc4random_uniform(1000))
    song11.book = songBooksArray[1]
    song11.number = 106
    song11.url = "https://www.lds.org/music/library/hymns/god-speed-the-right?lang=eng"
    song11.title = "God Speed the Right"
    song11.topic = "Heavenly Father"
    song11.selected = false
    song11.favorite = false
    song11.sortingIndex = 0
    
    let song12 = Song(context: context)
    song12.order = 12
    song12.random = Int64(arc4random_uniform(1000))
    song12.book = songBooksArray[1]
    song12.number = 108
    song12.url = "https://www.lds.org/music/library/hymns/the-lord-is-my-shepherd?lang=eng"
    song12.title = "The Lord Is My Shepherd"
    song12.topic = "Jesus Christ"
    song12.selected = false
    song12.favorite = false
    song12.sortingIndex = 0
    
    let song13 = Song(context: context)
    song13.order = 13
    song13.random = Int64(arc4random_uniform(1000))
    song13.book = songBooksArray[1]
    song13.number = 113
    song13.url = "https://www.lds.org/music/library/hymns/our-saviors-love?lang=eng"
    song13.title = "Our Savior’s Love"
    song13.topic = "Christlike Attributes"
    song13.selected = false
    song13.favorite = false
    song13.sortingIndex = 0
    
    let song14 = Song(context: context)
    song14.order = 14
    song14.random = Int64(arc4random_uniform(1000))
    song14.book = songBooksArray[1]
    song14.number = 116
    song14.url = "https://www.lds.org/music/library/hymns/come-follow-me?lang=eng"
    song14.title = "Come, Follow Me"
    song14.topic = "Commandments"
    song14.selected = false
    song14.favorite = false
    song14.sortingIndex = 0
    
    let song15 = Song(context: context)
    song15.order = 15
    song15.random = Int64(arc4random_uniform(1000))
    song15.book = songBooksArray[1]
    song15.number = 130
    song15.url = "https://www.lds.org/music/library/hymns/be-thou-humble?lang=eng"
    song15.title = "Be Thou Humble"
    song15.topic = "Christlike Attributes"
    song15.selected = false
    song15.favorite = false
    song15.sortingIndex = 0
    
    let song16 = Song(context: context)
    song16.order = 16
    song16.random = Int64(arc4random_uniform(1000))
    song16.book = songBooksArray[1]
    song16.number = 131
    song16.url = "https://www.lds.org/music/library/hymns/more-holiness-give-me?lang=eng"
    song16.title = "More Holiness Give Me"
    song16.topic = "Christlike Attributes"
    song16.selected = false
    song16.favorite = false
    song16.sortingIndex = 0
    
    let song17 = Song(context: context)
    song17.order = 17
    song17.random = Int64(arc4random_uniform(1000))
    song17.book = songBooksArray[1]
    song17.number = 133
    song17.url = "https://www.lds.org/music/library/hymns/father-in-heaven?lang=eng"
    song17.title = "Father in Heaven"
    song17.topic = "Heavenly Father"
    song17.selected = false
    song17.favorite = false
    song17.sortingIndex = 0
    
    let song18 = Song(context: context)
    song18.order = 18
    song18.random = Int64(arc4random_uniform(1000))
    song18.book = songBooksArray[1]
    song18.number = 134
    song18.url = "https://www.lds.org/music/library/hymns/i-believe-in-christ?lang=eng"
    song18.title = "I Believe in Christ"
    song18.topic = "Jesus Christ"
    song18.selected = false
    song18.favorite = false
    song18.sortingIndex = 0
    
    let song19 = Song(context: context)
    song19.order = 19
    song19.random = Int64(arc4random_uniform(1000))
    song19.book = songBooksArray[1]
    song19.number = 136
    song19.url = "https://www.lds.org/music/library/hymns/i-know-that-my-redeemer-lives?lang=eng"
    song19.title = "I Know That My Redeemer Lives"
    song19.topic = "Jesus Christ"
    song19.selected = false
    song19.favorite = false
    song19.sortingIndex = 0
    
    let song20 = Song(context: context)
    song20.order = 20
    song20.random = Int64(arc4random_uniform(1000))
    song20.book = songBooksArray[1]
    song20.number = 137
    song20.url = "https://www.lds.org/music/library/hymns/testimony?lang=eng"
    song20.title = "Testimony"
    song20.topic = "Christlike Attributes"
    song20.selected = false
    song20.favorite = false
    song20.sortingIndex = 0
    
    let song21 = Song(context: context)
    song21.order = 21
    song21.random = Int64(arc4random_uniform(1000))
    song21.book = songBooksArray[1]
    song21.number = 140
    song21.url = "https://www.lds.org/music/library/hymns/did-you-think-to-pray?lang=eng"
    song21.title = "Did You Think to Pray?"
    song21.topic = "Commandments"
    song21.selected = false
    song21.favorite = false
    song21.sortingIndex = 0
    
    let song22 = Song(context: context)
    song22.order = 22
    song22.random = Int64(arc4random_uniform(1000))
    song22.book = songBooksArray[1]
    song22.number = 142
    song22.url = "https://www.lds.org/music/library/hymns/sweet-hour-of-prayer?lang=eng"
    song22.title = "Sweet Hour of Prayer"
    song22.topic = "Commandments"
    song22.selected = false
    song22.favorite = false
    song22.sortingIndex = 0
    
    let song23 = Song(context: context)
    song23.order = 23
    song23.random = Int64(arc4random_uniform(1000))
    song23.book = songBooksArray[1]
    song23.number = 152
    song23.url = "https://www.lds.org/music/library/hymns/god-be-with-you-till-we-meet-again?lang=eng"
    song23.title = "God Be with You Till We Meet Again"
    song23.topic = "Plan of Salvation"
    song23.selected = false
    song23.favorite = false
    song23.sortingIndex = 0
    
    let song24 = Song(context: context)
    song24.order = 24
    song24.random = Int64(arc4random_uniform(1000))
    song24.book = songBooksArray[1]
    song24.number = 165
    song24.url = "https://www.lds.org/music/library/hymns/abide-with-me-tis-eventide?lang=eng"
    song24.title = "Abide with Me; ’Tis Eventide"
    song24.topic = "Jesus Christ"
    song24.selected = false
    song24.favorite = false
    song24.sortingIndex = 0
    
    let song25 = Song(context: context)
    song25.order = 25
    song25.random = Int64(arc4random_uniform(1000))
    song25.book = songBooksArray[1]
    song25.number = 170
    song25.url = "https://www.lds.org/music/library/hymns/god-our-father-hear-us-pray?lang=eng"
    song25.title = "God, Our Father, Hear Us Pray"
    song25.topic = "Heavenly Father"
    song25.selected = false
    song25.favorite = false
    song25.sortingIndex = 0
    
    let song26 = Song(context: context)
    song26.order = 26
    song26.random = Int64(arc4random_uniform(1000))
    song26.book = songBooksArray[1]
    song26.number = 193
    song26.url = "https://www.lds.org/music/library/hymns/i-stand-all-amazed?lang=eng"
    song26.title = "I Stand All Amazed"
    song26.topic = "Heavenly Father"
    song26.selected = false
    song26.favorite = false
    song26.sortingIndex = 0
    
    let song27 = Song(context: context)
    song27.order = 27
    song27.random = Int64(arc4random_uniform(1000))
    song27.book = songBooksArray[1]
    song27.number = 194
    song27.url = "https://www.lds.org/music/library/hymns/there-is-a-green-hill-far-away?lang=eng"
    song27.title = "There Is a Green Hill Far Away"
    song27.topic = "Atonement"
    song27.selected = false
    song27.favorite = false
    song27.sortingIndex = 0
    
    let song28 = Song(context: context)
    song28.order = 28
    song28.random = Int64(arc4random_uniform(1000))
    song28.book = songBooksArray[1]
    song28.number = 199
    song28.url = "https://www.lds.org/music/library/hymns/he-is-risen?lang=eng"
    song28.title = "He Is Risen!"
    song28.topic = "Resurrection"
    song28.selected = false
    song28.favorite = false
    song28.sortingIndex = 0
    
    let song29 = Song(context: context)
    song29.order = 29
    song29.random = Int64(arc4random_uniform(1000))
    song29.book = songBooksArray[1]
    song29.number = 203
    song29.url = "https://www.lds.org/music/library/hymns/angels-we-have-heard-on-high?lang=eng"
    song29.title = "Angels We Have Heard on High"
    song29.topic = "Birth of our Savior"
    song29.selected = false
    song29.favorite = false
    song29.sortingIndex = 0
    
    let song30 = Song(context: context)
    song30.order = 30
    song30.random = Int64(arc4random_uniform(1000))
    song30.book = songBooksArray[1]
    song30.number = 204
    song30.url = "https://www.lds.org/music/library/hymns/silent-night?lang=eng"
    song30.title = "Silent Night"
    song30.topic = "Birth of our Savior"
    song30.selected = false
    song30.favorite = false
    song30.sortingIndex = 0
    
    let song31 = Song(context: context)
    song31.order = 31
    song31.random = Int64(arc4random_uniform(1000))
    song31.book = songBooksArray[1]
    song31.number = 209
    song31.url = "https://www.lds.org/music/library/hymns/hark-the-herald-angels-sing?lang=eng"
    song31.title = "Hark! The Herald Angels Sing"
    song31.topic = "Birth of our Savior"
    song31.selected = false
    song31.favorite = false
    song31.sortingIndex = 0
    
    let song32 = Song(context: context)
    song32.order = 32
    song32.random = Int64(arc4random_uniform(1000))
    song32.book = songBooksArray[1]
    song32.number = 213
    song32.url = "https://www.lds.org/music/library/hymns/the-first-noel?lang=eng"
    song32.title = "The First Noel"
    song32.topic = "Birth of our Savior"
    song32.selected = false
    song32.favorite = false
    song32.sortingIndex = 0
    
    let song33 = Song(context: context)
    song33.order = 33
    song33.random = Int64(arc4random_uniform(1000))
    song33.book = songBooksArray[1]
    song33.number = 223
    song33.url = "https://www.lds.org/music/library/hymns/have-i-done-any-good?lang=eng"
    song33.title = "Have I Done Any Good?"
    song33.topic = "Care for the Poor & Needy"
    song33.selected = false
    song33.favorite = false
    song33.sortingIndex = 0
    
    let song34 = Song(context: context)
    song34.order = 34
    song34.random = Int64(arc4random_uniform(1000))
    song34.book = songBooksArray[1]
    song34.number = 227
    song34.url = "https://www.lds.org/music/library/hymns/there-is-sunshine-in-my-soul-today?lang=eng"
    song34.title = "There Is Sunshine in My Soul Today"
    song34.topic = "Holy Ghost"
    song34.selected = false
    song34.favorite = false
    song34.sortingIndex = 0
    
    let song35 = Song(context: context)
    song35.order = 35
    song35.random = Int64(arc4random_uniform(1000))
    song35.book = songBooksArray[1]
    song35.number = 239
    song35.url = "https://www.lds.org/music/library/hymns/choose-the-right?lang=eng"
    song35.title = "Choose the Right"
    song35.topic = "Commandments"
    song35.selected = false
    song35.favorite = true
    song35.sortingIndex = 0
    
    let song36 = Song(context: context)
    song36.order = 36
    song36.random = Int64(arc4random_uniform(1000))
    song36.book = songBooksArray[1]
    song36.number = 243
    song36.url = "https://www.lds.org/music/library/hymns/let-us-all-press-on?lang=eng"
    song36.title = "Let Us All Press On"
    song36.topic = "Endure to the end"
    song36.selected = false
    song36.favorite = false
    song36.sortingIndex = 0
    
    let song37 = Song(context: context)
    song37.order = 37
    song37.random = Int64(arc4random_uniform(1000))
    song37.book = songBooksArray[1]
    song37.number = 246
    song37.url = "https://www.lds.org/music/library/hymns/onward-christian-soldiers?lang=eng"
    song37.title = "Onward, Christian Soldiers"
    song37.topic = "Perfect the Saints"
    song37.selected = false
    song37.favorite = false
    song37.sortingIndex = 0
    
    let song38 = Song(context: context)
    song38.order = 38
    song38.random = Int64(arc4random_uniform(1000))
    song38.book = songBooksArray[1]
    song38.number = 249
    song38.url = "https://www.lds.org/music/library/hymns/called-to-serve?lang=eng"
    song38.title = "Called to Serve"
    song38.topic = "Proclaim the Gospel"
    song38.selected = false
    song38.favorite = false
    song38.sortingIndex = 0
    
    let song39 = Song(context: context)
    song39.order = 39
    song39.random = Int64(arc4random_uniform(1000))
    song39.book = songBooksArray[1]
    song39.number = 250
    song39.url = "https://www.lds.org/music/library/hymns/we-are-all-enlisted?lang=eng"
    song39.title = "We Are All Enlisted"
    song39.topic = "Perfect the Saints"
    song39.selected = false
    song39.favorite = false
    song39.sortingIndex = 0
    
    let song40 = Song(context: context)
    song40.order = 40
    song40.random = Int64(arc4random_uniform(1000))
    song40.book = songBooksArray[1]
    song40.number = 252
    song40.url = "https://www.lds.org/music/library/hymns/put-your-shoulder-to-the-wheel?lang=eng"
    song40.title = "Put Your Shoulder to the Wheel"
    song40.topic = "Endure to the end"
    song40.selected = false
    song40.favorite = false
    song40.sortingIndex = 0
    
    let song41 = Song(context: context)
    song41.order = 41
    song41.random = Int64(arc4random_uniform(1000))
    song41.book = songBooksArray[1]
    song41.number = 255
    song41.url = "https://www.lds.org/music/library/hymns/carry-on?lang=eng"
    song41.title = "Carry On"
    song41.topic = "Endure to the end"
    song41.selected = false
    song41.favorite = false
    song41.sortingIndex = 0
    
    let song42 = Song(context: context)
    song42.order = 42
    song42.random = Int64(arc4random_uniform(1000))
    song42.book = songBooksArray[1]
    song42.number = 259
    song42.url = "https://www.lds.org/music/library/hymns/hope-of-israel?lang=eng"
    song42.title = "Hope of Israel"
    song42.topic = "Perfect the Saints"
    song42.selected = false
    song42.favorite = false
    song42.sortingIndex = 0
    
    let song43 = Song(context: context)
    song43.order = 43
    song43.random = Int64(arc4random_uniform(1000))
    song43.book = songBooksArray[1]
    song43.number = 260
    song43.url = "https://www.lds.org/music/library/hymns/whos-on-the-lords-side?lang=eng"
    song43.title = "Who’s on the Lord’s Side?"
    song43.topic = "Perfect the Saints"
    song43.selected = false
    song43.favorite = false
    song43.sortingIndex = 0
    
    let song51 = Song(context: context)
    song51.order = 51
    song51.random = Int64(arc4random_uniform(100))
    song51.book = songBooksArray[0]
    song51.number = 2
    song51.url = "https://www.lds.org/music/library/childrens-songbook/i-am-a-child-of-god?lang=eng"
    song51.title = "I Am a Child of God"
    song51.topic = "Heavenly Father"
    song51.selected = false
    song51.favorite = true
    song51.sortingIndex = 0
    
    let song52 = Song(context: context)
    song52.order = 52
    song52.random = Int64(arc4random_uniform(1000))
    song52.book = songBooksArray[0]
    song52.number = 4
    song52.url = "https://www.lds.org/music/library/childrens-songbook/i-lived-in-heaven?lang=eng"
    song52.title = "I Lived in Heaven"
    song52.topic = "Plan of Salvation"
    song52.selected = false
    song52.favorite = false
    song52.sortingIndex = 0
    
    let song53 = Song(context: context)
    song53.order = 53
    song53.random = Int64(arc4random_uniform(1000))
    song53.book = songBooksArray[0]
    song53.number = 5
    song53.url = "https://www.lds.org/music/library/childrens-songbook/i-know-my-father-lives?lang=eng"
    song53.title = "I Know My Father Lives"
    song53.topic = "Heavenly Father"
    song53.selected = false
    song53.favorite = false
    song53.sortingIndex = 0
    
    let song54 = Song(context: context)
    song54.order = 54
    song54.random = Int64(arc4random_uniform(1000))
    song54.book = songBooksArray[0]
    song54.number = 7
    song54.url = "https://www.lds.org/music/library/childrens-songbook/i-thank-thee-dear-father?lang=eng"
    song54.title = "I Thank Thee, Dear Father"
    song54.topic = "Heavenly Father"
    song54.selected = false
    song54.favorite = false
    song54.sortingIndex = 0
    
    let song55 = Song(context: context)
    song55.order = 55
    song55.random = Int64(arc4random_uniform(1000))
    song55.book = songBooksArray[0]
    song55.number = 11
    song55.url = "https://www.lds.org/music/library/childrens-songbook/im-thankful-to-be-me?lang=eng"
    song55.title = "I’m Thankful to Be Me"
    song55.topic = "Christlike Attributes"
    song55.selected = false
    song55.favorite = false
    song55.sortingIndex = 0
    
    let song56 = Song(context: context)
    song56.order = 56
    song56.random = Int64(arc4random_uniform(1000))
    song56.book = songBooksArray[0]
    song56.number = 12
    song56.url = "https://www.lds.org/music/library/childrens-songbook/a-childs-prayer?lang=eng"
    song56.title = "A Child’s Prayer"
    song56.topic = "Heavenly Father"
    song56.selected = true
    song56.favorite = true
    song56.selectedOne = selectedSong
    song56.sortingIndex = 0
    
    let song57 = Song(context: context)
    song57.order = 57
    song57.random = Int64(arc4random_uniform(1000))
    song57.book = songBooksArray[0]
    song57.number = 16
    song57.url = "https://www.lds.org/music/library/childrens-songbook/children-all-over-the-world?lang=eng"
    song57.title = "Children All Over the World"
    song57.topic = "Plan of Salvation"
    song57.selected = false
    song57.favorite = false
    song57.sortingIndex = 0
    
    let song58 = Song(context: context)
    song58.order = 58
    song58.random = Int64(arc4random_uniform(1000))
    song58.book = songBooksArray[0]
    song58.number = 26
    song58.url = "https://www.lds.org/music/library/childrens-songbook/reverently-quietly?lang=eng"
    song58.title = "Reverently, Quietly"
    song58.topic = "Christlike Attributes"
    song58.selected = false
    song58.favorite = false
    song58.sortingIndex = 0
    
    let song59 = Song(context: context)
    song59.order = 59
    song59.random = Int64(arc4random_uniform(1000))
    song59.book = songBooksArray[0]
    song59.number = 37
    song59.url = "https://www.lds.org/music/library/childrens-songbook/stars-were-gleaming?lang=eng"
    song59.title = "Stars Were Gleaming"
    song59.topic = "Birth of our Savior"
    song59.selected = false
    song59.favorite = false
    song59.sortingIndex = 0
    
    let song60 = Song(context: context)
    song60.order = 60
    song60.random = Int64(arc4random_uniform(1000))
    song60.book = songBooksArray[0]
    song60.number = 42
    song60.url = "https://www.lds.org/music/library/childrens-songbook/away-in-a-manger?lang=eng"
    song60.title = "Away in a Manger"
    song60.topic = "Birth of our Savior"
    song60.selected = false
    song60.favorite = false
    song60.sortingIndex = 0
    
    let song61 = Song(context: context)
    song61.order = 61
    song61.random = Int64(arc4random_uniform(1000))
    song61.book = songBooksArray[0]
    song61.number = 47
    song61.url = "https://www.lds.org/music/library/childrens-songbook/sleep-little-jesus?lang=eng"
    song61.title = "Sleep, Little Jesus"
    song61.topic = "Birth of our Savior"
    song61.selected = false
    song61.favorite = false
    song61.sortingIndex = 0
    
    let song62 = Song(context: context)
    song62.order = 62
    song62.random = Int64(arc4random_uniform(1000))
    song62.book = songBooksArray[0]
    song62.number = 55
    song62.url = "https://www.lds.org/music/library/childrens-songbook/jesus-once-was-a-little-child?lang=eng"
    song62.title = "Jesus Once Was a Little Child"
    song62.topic = "Jesus Christ"
    song62.selected = false
    song62.favorite = false
    song62.sortingIndex = 0
    
    let song63 = Song(context: context)
    song63.order = 63
    song63.random = Int64(arc4random_uniform(1000))
    song63.book = songBooksArray[0]
    song63.number = 57
    song63.url = "https://www.lds.org/music/library/childrens-songbook/tell-me-the-stories-of-jesus?lang=eng"
    song63.title = "Tell Me the Stories of Jesus"
    song63.topic = "Jesus Christ"
    song63.selected = false
    song63.favorite = false
    song63.sortingIndex = 0
    
    let song64 = Song(context: context)
    song64.order = 64
    song64.random = Int64(arc4random_uniform(1000))
    song64.book = songBooksArray[0]
    song64.number = 60
    song64.url = "https://www.lds.org/music/library/childrens-songbook/jesus-wants-me-for-a-sunbeam?lang=eng"
    song64.title = "Jesus Wants Me for a Sunbeam"
    song64.topic = "Jesus Christ"
    song64.selected = false
    song64.favorite = false
    song64.sortingIndex = 0
    
    let song65 = Song(context: context)
    song65.order = 65
    song65.random = Int64(arc4random_uniform(1000))
    song65.book = songBooksArray[0]
    song65.number = 74
    song65.url = "https://www.lds.org/music/library/childrens-songbook/i-feel-my-saviors-love?lang=eng"
    song65.title = "I Feel My Savior’s Love"
    song65.topic = "Christlike Attributes"
    song65.selected = false
    song65.favorite = false
    song65.sortingIndex = 0
    
    let song66 = Song(context: context)
    song66.order = 66
    song66.random = Int64(arc4random_uniform(1000))
    song66.book = songBooksArray[0]
    song66.number = 78
    song66.url = "https://www.lds.org/music/library/childrens-songbook/im-trying-to-be-like-jesus?lang=eng"
    song66.title = "I’m Trying to Be like Jesus"
    song66.topic = "Jesus Christ"
    song66.selected = false
    song66.favorite = false
    song66.sortingIndex = 0
    
    let song67 = Song(context: context)
    song67.order = 67
    song67.random = Int64(arc4random_uniform(1000))
    song67.book = songBooksArray[0]
    song67.number = 82
    song67.url = "https://www.lds.org/music/library/childrens-songbook/when-he-comes-again?lang=eng"
    song67.title = "When He Comes Again"
    song67.topic = "Jesus Christ"
    song67.selected = false
    song67.favorite = false
    song67.sortingIndex = 0
    
    let song68 = Song(context: context)
    song68.order = 68
    song68.random = Int64(arc4random_uniform(1000))
    song68.book = songBooksArray[0]
    song68.number = 86
    song68.url = "https://www.lds.org/music/library/childrens-songbook/the-golden-plates?lang=eng"
    song68.title = "The Golden Plates"
    song68.topic = "Scriptures"
    song68.selected = false
    song68.favorite = false
    song68.sortingIndex = 0
    
    let song69 = Song(context: context)
    song69.order = 69
    song69.random = Int64(arc4random_uniform(1000))
    song69.book = songBooksArray[0]
    song69.number = 95
    song69.url = "https://www.lds.org/music/library/childrens-songbook/i-love-to-see-the-temple?lang=eng"
    song69.title = "I Love to See the Temple"
    song69.topic = "Redeem the Dead"
    song69.selected = false
    song69.favorite = true
    song69.sortingIndex = 0
    
    let song70 = Song(context: context)
    song70.order = 70
    song70.random = Int64(arc4random_uniform(1000))
    song70.book = songBooksArray[0]
    song70.number = 96
    song70.url = "https://www.lds.org/music/library/childrens-songbook/faith?lang=eng"
    song70.title = "Faith"
    song70.topic = "Principles & Ordinances"
    song70.selected = false
    song70.favorite = false
    song70.sortingIndex = 0
    
    let song71 = Song(context: context)
    song71.order = 71
    song71.random = Int64(arc4random_uniform(1000))
    song71.book = songBooksArray[0]
    song71.number = 98
    song71.url = "https://www.lds.org/music/library/childrens-songbook/repentance?lang=eng"
    song71.title = "Repentance"
    song71.topic = "Principles & Ordinances"
    song71.selected = false
    song71.favorite = false
    song71.sortingIndex = 0
    
    let song72 = Song(context: context)
    song72.order = 72
    song72.random = Int64(arc4random_uniform(1000))
    song72.book = songBooksArray[0]
    song72.number = 100
    song72.url = "https://www.lds.org/music/library/childrens-songbook/baptism?lang=eng"
    song72.title = "Baptism"
    song72.topic = "Principles & Ordinances"
    song72.selected = false
    song72.favorite = false
    song72.sortingIndex = 0
    
    let song73 = Song(context: context)
    song73.order = 73
    song73.random = Int64(arc4random_uniform(1000))
    song73.book = songBooksArray[0]
    song73.number = 103
    song73.url = "https://www.lds.org/music/library/childrens-songbook/when-i-am-baptized?lang=eng"
    song73.title = "When I Am Baptized"
    song73.topic = "Principles & Ordinances"
    song73.selected = false
    song73.favorite = false
    song73.sortingIndex = 0
    
    let song74 = Song(context: context)
    song74.order = 74
    song74.random = Int64(arc4random_uniform(1000))
    song74.book = songBooksArray[0]
    song74.number = 105
    song74.url = "https://www.lds.org/music/library/childrens-songbook/the-holy-ghost?lang=eng"
    song74.title = "The Holy Ghost"
    song74.topic = "Principles & Ordinances"
    song74.selected = false
    song74.favorite = false
    song74.sortingIndex = 0
    
    let song75 = Song(context: context)
    song75.order = 75
    song75.random = Int64(arc4random_uniform(1000))
    song75.book = songBooksArray[0]
    song75.number = 109
    song75.url = "https://www.lds.org/music/library/childrens-songbook/search-ponder-and-pray?lang=eng"
    song75.title = "Search, Ponder, and Pray"
    song75.topic = "Commandments"
    song75.selected = false
    song75.favorite = false
    song75.sortingIndex = 0
    
    let song76 = Song(context: context)
    song76.order = 76
    song76.random = Int64(arc4random_uniform(1000))
    song76.book = songBooksArray[0]
    song76.number = 110
    song76.url = "https://www.lds.org/music/library/childrens-songbook/follow-the-prophet?lang=eng"
    song76.title = "Follow the Prophet"
    song76.topic = "Restoration"
    song76.selected = false
    song76.favorite = false
    song76.sortingIndex = 0
    
    let song77 = Song(context: context)
    song77.order = 77
    song77.random = Int64(arc4random_uniform(1000))
    song77.book = songBooksArray[0]
    song77.number = 112
    song77.url = "https://www.lds.org/music/library/childrens-songbook/the-commandments?lang=eng"
    song77.title = "The Commandments"
    song77.topic = "Commandments"
    song77.selected = false
    song77.favorite = false
    song77.sortingIndex = 0
    
    let song78 = Song(context: context)
    song78.order = 78
    song78.random = Int64(arc4random_uniform(1000))
    song78.book = songBooksArray[0]
    song78.number = 118
    song78.url = "https://www.lds.org/music/library/childrens-songbook/book-of-mormon-stories?lang=eng"
    song78.title = "Book of Mormon Stories"
    song78.topic = "Scriptures"
    song78.selected = false
    song78.favorite = false
    song78.sortingIndex = 0
    
    let song79 = Song(context: context)
    song79.order = 2
    song79.random = Int64(arc4random_uniform(1000))
    song79.book = songBooksArray[0]
    song79.number = 120
    song79.url = "https://www.lds.org/music/library/childrens-songbook/nephis-courage?lang=eng"
    song79.title = "Nephi’s Courage"
    song79.topic = "Christlike Attributes"
    song79.selected = false
    song79.favorite = false
    song79.sortingIndex = 0
    
    let song80 = Song(context: context)
    song80.order = 80
    song80.random = Int64(arc4random_uniform(1000))
    song80.book = songBooksArray[0]
    song80.number = 136
    song80.url = "https://www.lds.org/music/library/childrens-songbook/love-one-another?lang=eng"
    song80.title = "Love One Another"
    song80.topic = "Commandments"
    song80.selected = false
    song80.favorite = true
    song80.sortingIndex = 0
    
    let song81 = Song(context: context)
    song81.order = 81
    song81.random = Int64(arc4random_uniform(1000))
    song81.book = songBooksArray[0]
    song81.number = 146
    song81.url = "https://www.lds.org/music/library/childrens-songbook/keep-the-commandments?lang=eng"
    song81.title = "Keep the Commandments"
    song81.topic = "Commandments"
    song81.selected = false
    song81.favorite = true
    song81.sortingIndex = 0
    
    let song82 = Song(context: context)
    song82.order = 82
    song82.random = Int64(arc4random_uniform(1000))
    song82.book = songBooksArray[0]
    song82.number = 158
    song82.url = "https://www.lds.org/music/library/childrens-songbook/dare-to-do-right?lang=eng"
    song82.title = "Dare to Do Right"
    song82.topic = "Endure to the end"
    song82.selected = false
    song82.favorite = false
    song82.sortingIndex = 0
    
    let song83 = Song(context: context)
    song83.order = 83
    song83.random = Int64(arc4random_uniform(1000))
    song83.book = songBooksArray[0]
    song83.number = 159
    song83.url = "https://www.lds.org/music/library/childrens-songbook/stand-for-the-right?lang=eng"
    song83.title = "Stand for the Right"
    song83.topic = "Commandments"
    song83.selected = false
    song83.favorite = false
    song83.sortingIndex = 0
    
    let song84 = Song(context: context)
    song84.order = 84
    song84.random = Int64(arc4random_uniform(1000))
    song84.book = songBooksArray[0]
    song84.number = 160
    song84.url = "https://www.lds.org/music/library/childrens-songbook/choose-the-right-way?lang=eng"
    song84.title = "Choose the Right Way"
    song84.topic = "Christlike Attributes"
    song84.selected = false
    song84.favorite = true
    song84.sortingIndex = 0
    
    let song85 = Song(context: context)
    song85.order = 85
    song85.random = Int64(arc4random_uniform(1000))
    song85.book = songBooksArray[0]
    song85.number = 163
    song85.url = "https://www.lds.org/music/library/childrens-songbook/i-am-like-a-star?lang=eng"
    song85.title = "I Am like a Star"
    song85.topic = "Heavenly Father"
    song85.selected = false
    song85.favorite = false
    song85.sortingIndex = 0
    
    let song86 = Song(context: context)
    song86.order = 86
    song86.random = Int64(arc4random_uniform(1000))
    song86.book = songBooksArray[0]
    song86.number = 169
    song86.url = "https://www.lds.org/music/library/childrens-songbook/i-hope-they-call-me-on-a-mission?lang=eng"
    song86.title = "I Hope They Call Me on a Mission"
    song86.topic = "Proclaim the Gospel"
    song86.selected = false
    song86.favorite = false
    song86.sortingIndex = 0
    
    let song87 = Song(context: context)
    song87.order = 87
    song87.random = Int64(arc4random_uniform(1000))
    song87.book = songBooksArray[0]
    song87.number = 172
    song87.url = "https://www.lds.org/music/library/childrens-songbook/well-bring-the-world-his-truth-army-of-helaman?lang=eng"
    song87.title = "We’ll Bring the World His Truth"
    song87.topic = "Proclaim the Gospel"
    song87.selected = false
    song87.favorite = false
    song87.sortingIndex = 0
    
    let song88 = Song(context: context)
    song88.order = 88
    song88.random = Int64(arc4random_uniform(1000))
    song88.book = songBooksArray[0]
    song88.number = 174
    song88.url = "https://www.lds.org/music/library/childrens-songbook/called-to-serve?lang=eng"
    song88.title = "Called to Serve"
    song88.topic = "Proclaim the Gospel"
    song88.selected = false
    song88.favorite = false
    song88.sortingIndex = 0
    
    let song89 = Song(context: context)
    song89.order = 89
    song89.random = Int64(arc4random_uniform(1000))
    song89.book = songBooksArray[0]
    song89.number = 176
    song89.url = "https://www.lds.org/music/library/childrens-songbook/tell-me-dear-lord?lang=eng"
    song89.title = "Tell Me, Dear Lord"
    song89.topic = "Heavenly Father"
    song89.selected = false
    song89.favorite = false
    song89.sortingIndex = 0
    
    let song90 = Song(context: context)
    song90.order = 90
    song90.random = Int64(arc4random_uniform(1000))
    song90.book = songBooksArray[0]
    song90.number = 177
    song90.url = "https://www.lds.org/music/library/childrens-songbook/teach-me-to-walk-in-the-light?lang=eng"
    song90.title = "Teach Me to Walk in the Light"
    song90.topic = "Christlike Attributes"
    song90.selected = false
    song90.favorite = false
    song90.sortingIndex = 0
    
    let song91 = Song(context: context)
    song91.order = 91
    song91.random = Int64(arc4random_uniform(1000))
    song91.book = songBooksArray[0]
    song91.number = 178
    song91.url = "https://www.lds.org/music/library/childrens-songbook/teacher-do-you-love-me?lang=eng"
    song91.title = "Teacher, Do You Love Me?"
    song91.topic = "Christlike Attributes"
    song91.selected = false
    song91.favorite = false
    song91.sortingIndex = 0
    
    let song92 = Song(context: context)
    song92.order = 92
    song92.random = Int64(arc4random_uniform(1000))
    song92.book = songBooksArray[0]
    song92.number = 188
    song92.url = "https://www.lds.org/music/library/childrens-songbook/families-can-be-together-forever?lang=eng"
    song92.title = "Families Can Be Together Forever"
    song92.topic = "Plan of Salvation"
    song92.selected = false
    song92.favorite = true
    song92.sortingIndex = 0
    
    let song93 = Song(context: context)
    song93.order = 93
    song93.random = Int64(arc4random_uniform(1000))
    song93.book = songBooksArray[0]
    song93.number = 190
    song93.url = "https://www.lds.org/music/library/childrens-songbook/love-is-spoken-here?lang=eng"
    song93.title = "Love Is Spoken Here"
    song93.topic = "Christlike Attributes"
    song93.selected = false
    song93.favorite = true
    song93.sortingIndex = 0
    
    let song94 = Song(context: context)
    song94.order = 94
    song94.random = Int64(arc4random_uniform(1000))
    song94.book = songBooksArray[0]
    song94.number = 204
    song94.url = "https://www.lds.org/music/library/childrens-songbook/mother-tell-me-the-story?lang=eng"
    song94.title = "Mother, Tell Me the Story"
    song94.topic = "Jesus Christ"
    song94.selected = false
    song94.favorite = false
    song94.sortingIndex = 0
    
    let song95 = Song(context: context)
    song95.order = 95
    song95.random = Int64(arc4random_uniform(1000))
    song95.book = songBooksArray[0]
    song95.number = 206
    song95.url = "https://www.lds.org/music/library/childrens-songbook/dearest-mother-i-love-you?lang=eng"
    song95.title = "Dearest Mother, I Love You"
    song95.topic = "Christlike Attributes"
    song95.selected = false
    song95.favorite = false
    song95.sortingIndex = 0
    
    let song96 = Song(context: context)
    song96.order = 96
    song96.random = Int64(arc4random_uniform(1000))
    song96.book = songBooksArray[0]
    song96.number = 206
    song96.url = "https://www.lds.org/music/library/childrens-songbook/mother-dear?lang=eng"
    song96.title = "Mother Dear"
    song96.topic = "Plan of Salvation"
    song96.selected = false
    song96.favorite = false
    song96.sortingIndex = 0
    
    let song97 = Song(context: context)
    song97.order = 97
    song97.random = Int64(arc4random_uniform(1000))
    song97.book = songBooksArray[0]
    song97.number = 236
    song97.url = "https://www.lds.org/music/library/childrens-songbook/give-said-the-little-stream?lang=eng"
    song97.title = "Give, Said the Little Stream"
    song97.topic = "Christlike Attributes"
    song97.selected = false
    song97.favorite = false
    song97.sortingIndex = 0
    
    let song98 = Song(context: context)
    song98.order = 98
    song98.random = Int64(arc4random_uniform(1000))
    song98.book = songBooksArray[0]
    song98.number = 266
    song98.url = "https://www.lds.org/music/library/childrens-songbook/if-youre-happy?lang=eng"
    song98.title = "If You’re Happy"
    song98.topic = "Christlike Attributes"
    song98.selected = false
    song98.favorite = false
    song98.sortingIndex = 0
    
    let song99 = Song(context: context)
    song99.order = 99
    song99.random = Int64(arc4random_uniform(1000))
    song99.book = songBooksArray[0]
    song99.number = 278
    song99.url = "https://www.lds.org/music/library/childrens-songbook/stand-up?lang=eng"
    song99.title = "Stand Up"
    song99.topic = "Christlike Attributes"
    song99.selected = false
    song99.favorite = false
    song99.sortingIndex = 0
    
    let song100 = Song(context: context)
    song100.order = 100
    song100.random = Int64(arc4random_uniform(1000))
    song100.book = songBooksArray[0]
    song100.number = 281
    song100.url = "https://www.lds.org/music/library/childrens-songbook/the-wise-man-and-the-foolish-man?lang=eng"
    song100.title = "The Wise Man and the Foolish Man"
    song100.topic = "Christlike Attributes"
    song100.selected = false
    song100.favorite = true
    song100.sortingIndex = 0
    
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
    
    let song102 = Song(context: context)
    song102.order = 102
    song102.random = Int64(arc4random_uniform(1000))
    song102.book = songBooksArray[2]
    song102.number = 0
    song102.url = "https://www.youtube.com/watch?v=nomxXk6Q1rk"
    song102.title = "Glourious"
    song102.topic = "Plan of Salvation"
    song102.selected = false
    song102.favorite = true
    song102.sortingIndex = 0
    
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
    
    let song104 = Song(context: context)
    song104.order = 104
    song104.random = Int64(arc4random_uniform(1000))
    song104.book = songBooksArray[2]
    song104.number = 0
    song104.url = "https://www.youtube.com/playlist?list=PLzM4iKMyZBGM2zy6nHvZ9uAUM2PPNRtZl"
    song104.title = "Vocal Point"
    song104.topic = "Perfect the Saints"
    song104.selected = false
    song104.favorite = false
    song104.sortingIndex = 0
    
    let song105 = Song(context: context)
    song105.order = 105
    song105.random = Int64(arc4random_uniform(1000))
    song105.book = songBooksArray[2]
    song105.number = 0
    song105.url = "https://www.youtube.com/playlist?list=PLxKIAPWA4GegdsofSzjD__73Lkz0uqNkv"
    song105.title = "BYU Noteworthy"
    song105.topic = "Perfect the Saints"
    song105.selected = false
    song105.favorite = false
    song105.sortingIndex = 0
    
    let song106 = Song(context: context)
    song106.order = 106
    song106.random = Int64(arc4random_uniform(1000))
    song106.book = songBooksArray[2]
    song106.number = 0
    song106.url = "https://www.youtube.com/playlist?list=PLyvBLXLjvLew6tNlGJMm_LxZ6pFtOyTSJ"
    song106.title = "Elenyi"
    song106.topic = "Perfect the Saints"
    song106.selected = false
    song106.favorite = false
    song106.sortingIndex = 0
    
    ad.saveContext()
}

func generateRules() {
    getTasks()
    let rule1 = Rule(context: context)
    rule1.title = "Media"
    rule1.detail = "“The media's the most powerful entity on earth. They have the power to make the innocent guilty and to make the guilty innocent, and that's power. Because they control the minds of the masses.”\n- Malcolm X"
    rule1.url = "https://drive.google.com/file/d/1U6DIUWVNML50SgX4p6mdkBrrKcXpdGIE/view"
    rule1.order = 1
    rule1.random = Int64(arc4random_uniform(1000))
    rule1.selected = true
    rule1.sortingIndex = 0
    rule1.selectedOne = selectedRule
    
    let rule2 = Rule(context: context)
    rule2.title = "Respect Others"
    rule2.detail = "We believe in the golden rule.\n“Do unto others as you would have them do unto you.“\n- Matt. 7:12"
    rule2.url = "https://drive.google.com/file/d/1zuUzKcEdZS7ZjZh5mKhQWWFPPw77_AaV/view"
    rule2.order = 2
    rule2.random = Int64(arc4random_uniform(1000))
    rule2.selected = false
    rule2.sortingIndex = 0
    
    let rule3 = Rule(context: context)
    rule3.title = "Respect Belongings"
    rule3.detail = "As you get older you start to see who was raised properly. So many people lack basic respect."
    rule3.url = "https://drive.google.com/file/d/1BbDSMAKExvlt2o_NoyN81lbD4imwlW5I/view"
    rule3.order = 3
    rule3.random = Int64(arc4random_uniform(1000))
    rule3.selected = false
    rule3.sortingIndex = 0
    
    let rule4 = Rule(context: context)
    rule4.title = "Table Manners"
    rule4.detail = "“I profoundly believe it takes a lot of ignorance to become a moral slob.“\n- William Buckley Jr."
    rule4.url = "https://drive.google.com/file/d/1nwcCCDRogdtmRvmdXAcfYBZFBDcaUgFt/view"
    rule4.order = 4
    rule4.random = Int64(arc4random_uniform(1000))
    rule4.selected = false
    rule4.sortingIndex = 0
    
    let rule5 = Rule(context: context)
    rule5.title = "Morning Routine"
    rule5.detail = "Yesterday is gone. Tomorrow is a mystery. Today is a blessing!"
    rule5.url = "https://drive.google.com/file/d/1US9Zd604Ldqekde1eoQJbwQQji3LDqJM/view"
    rule5.order = 7
    rule5.random = Int64(arc4random_uniform(1000))
    rule5.selected = false
    rule5.sortingIndex = 0
    
    let rule6 = Rule(context: context)
    rule6.title = "After School Routine"
    rule6.detail = "Never stop learning, because life never stops teaching."
    rule6.url = "https://drive.google.com/file/d/1Nb1AUCeZCMt8Em6f2LVSIzTJt776aLQl/view"
    rule6.order = 5
    rule6.random = Int64(arc4random_uniform(1000))
    rule6.selected = false
    rule6.sortingIndex = 0
    
    let rule7 = Rule(context: context)
    rule7.title = "Bedtime Routine"
    rule7.detail = "Go to be with dreams. Wake up with plans."
    rule7.url = "https://drive.google.com/file/d/1VhCDrnKvr_w4nv3tvZQnmXJMtAJzOphd/view"
    rule7.order = 6
    rule7.random = Int64(arc4random_uniform(1000))
    rule7.selected = false
    rule7.sortingIndex = 0
    
    let rule8 = Rule(context: context)
    rule8.title = "House Chores"
    rule8.detail = "“May we ever choose the harder right instead of the easier wrong.“\n- Thomas S. Monson"
    rule8.url = "https://drive.google.com/file/d/1dkwWTrKC88OoZwZ5KOlK-b3TY63gsZDa/view"
    rule8.order = 8
    rule8.random = Int64(arc4random_uniform(1000))
    rule8.selected = false
    rule8.sortingIndex = 0
    
    let rule9 = Rule(context: context)
    rule9.title = "FHE & HT Expectations"
    rule9.detail = "Human behavior flows from three main sources: desire (spirit), emotion (body), knowledge (mind)."
    rule9.url = "https://drive.google.com/file/d/1xJay1xQw_Yaq8mgcGPe4An-p6NC2PsQl/view"
    rule9.order = 9
    rule9.random = Int64(arc4random_uniform(1000))
    rule9.selected = false
    rule9.sortingIndex = 0
    
    let rule10 = Rule(context: context)
    rule10.title = "Church Guidelines"
    rule10.detail = "Feed your faith and your fears will starve to death."
    rule10.url = "https://drive.google.com/file/d/11aT0cKTF2IG9DqIXEpv2m7C6suddK-zE/view"
    rule10.order = 10
    rule10.random = Int64(arc4random_uniform(1000))
    rule10.selected = false
    rule10.sortingIndex = 0
    
    let rule11 = Rule(context: context)
    rule11.title = "Sunday Behavior"
    rule11.detail = "“Living in the moment brings you a sense of reverance for all of life's blessings.“\n- Oprah Winfrey"
    rule11.url = "https://drive.google.com/file/d/1BPMKRTIbwZEqgXvK9CmUMjinBgKLrV2d/view"
    rule11.order = 10
    rule11.random = Int64(arc4random_uniform(1000))
    rule11.selected = false
    rule11.sortingIndex = 0
    
    ad.saveContext()
}

func generateScripture() {
    getTasks()
    let scripture1 = Scripture(context: context)
    scripture1.topic = topicsArray[0]
    scripture1.volume = "Book of Mormon"
    scripture1.book = "1 Nephi"
    scripture1.chapter = "3"
    scripture1.verse = "7"
    scripture1.title = "The Lord prepares a way"
    scripture1.favorite = true
    scripture1.order = 1
    scripture1.random = Int64(arc4random_uniform(1000))
    scripture1.selected = true
    scripture1.sortingIndex = 0
    scripture1.selectedOne = selectedScripture
    
    let scripture2 = Scripture(context: context)
    scripture2.topic = topicsArray[0]
    scripture2.volume = "Book of Mormon"
    scripture2.book = "2 Nephi"
    scripture2.chapter = "2"
    scripture2.verse = "22-25"
    scripture2.title = "Adam fell that men might be."
    scripture2.favorite = false
    scripture2.order = 2
    scripture2.random = Int64(arc4random_uniform(1000))
    scripture2.selected = false
    scripture2.sortingIndex = 0
    
    ad.saveContext()
}

func generateCalendar() {
    getTasks()
    let calendar = Calendar(context: context)
    calendar.selectedOne = selectedCalendar
    calendar.title = "Planning Meeting"
    calendar.detail = "Upcoming events:\n\n1. Activities\n2. Birthdays / Holidays\n3. Traveling / Vacations\n4. Family dinners"
    calendar.selected = true
    
    ad.saveContext()
}

func generateTestimony() {
    getTasks()
    let testimony = Testimony(context: context)
    testimony.selectedOne = selectedTestimony
    testimony.title = "I have a testimony that..."
    testimony.detail = "1. Heavenly Father lives and loves His children. I am a child of God.\n2. Jesus Christ lives, that He is the Son of God, and that He carried out the infinite Atonement.\n3. Joseph Smith is the prophet of God who was called to restore the Gospel.\n4. The Church of Jesus Christ of Latter-day Saints is the Savior's true Church on the earth.\n5. The Church is led by a living prophet today.\n6. The Book of Mormon is another testiment of Jesus Christ.\n7. A testimony is a spiritual witness given by the Holy Ghost.\n8. A testimony grows to include all principles of the Gospel."
    testimony.selected = true
    
    ad.saveContext()
}

func generateSpotlight() {
    getTasks()
    let spotlight = Spotlight(context: context)
    spotlight.selectedOne = selectedSpotlight
    spotlight.title = "Affirmations"
    spotlight.detail = "I noticed something you did in one of the following ways of life:\n\n1. Emotional\n2. Financial\n3. Intellectual\n4. Social\n5. Occupational\n6. Physical\n7. Environmental\n8. Spiritual"
    spotlight.selected = true
    
    ad.saveContext()
}

func generateMisc() {
    getTasks()
    let misc = Misc(context: context)
    misc.selectedOne = selectedMisc
    misc.title = "Tell me something I don't know..."
    misc.detail = "While knowledge is orderly and cumulative, information is random and miscellaneous."
    misc.url = "https://www.mormonchannel.org/watch/series/mormon-channel-studio/mormon-channel-studio-nashville-tribute-band"
    misc.selected = true
    
    ad.saveContext()
}

func generateThoughts() {
    getTasks()
    let thought1 = Thought(context: context)
    thought1.selectedOne = selectedThought
    thought1.topic = dimensionsArray[0]
    thought1.title = "Emotional"
    thought1.detail = "Meditation"
    thought1.url = "https://www.mormonchannel.org/"
    thought1.order = 1
    thought1.favorite = true
    thought1.random = Int64(arc4random_uniform(1000))
    thought1.selected = true
    thought1.sortingIndex = 0
    
    let thought2 = Thought(context: context)
    thought2.topic = dimensionsArray[1]
    thought2.title = "Financial"
    thought2.detail = "Baby Steps"
    thought2.url = "https://www.mormonchannel.org/"
    thought2.order = 2
    thought2.favorite = false
    thought2.random = Int64(arc4random_uniform(1000))
    thought2.selected = false
    thought2.sortingIndex = 0
    
    let thought3 = Thought(context: context)
    thought3.topic = dimensionsArray[2]
    thought3.title = "Intellectual"
    thought3.detail = "Education"
    thought3.url = "https://www.mormonchannel.org/"
    thought3.order = 3
    thought3.favorite = false
    thought3.random = Int64(arc4random_uniform(1000))
    thought3.selected = false
    thought3.sortingIndex = 0
    
    let thought4 = Thought(context: context)
    thought4.topic = dimensionsArray[3]
    thought4.title = "Social"
    thought4.detail = "Networking"
    thought4.url = "https://www.mormonchannel.org/"
    thought4.order = 4
    thought4.favorite = false
    thought4.random = Int64(arc4random_uniform(1000))
    thought4.selected = false
    thought4.sortingIndex = 0
    
    let thought5 = Thought(context: context)
    thought5.topic = dimensionsArray[4]
    thought5.title = "Occupational"
    thought5.detail = "Work doesn't define you."
    thought5.url = "https://www.mormonchannel.org/"
    thought5.order = 5
    thought5.favorite = false
    thought5.random = Int64(arc4random_uniform(1000))
    thought5.selected = false
    thought5.sortingIndex = 0
    
    let thought6 = Thought(context: context)
    thought6.topic = dimensionsArray[5]
    thought6.title = "Physical"
    thought6.detail = "Input and Output"
    thought6.url = "https://www.mormonchannel.org/"
    thought6.order = 6
    thought6.favorite = false
    thought6.random = Int64(arc4random_uniform(1000))
    thought6.selected = false
    thought6.sortingIndex = 0
    
    let thought7 = Thought(context: context)
    thought7.topic = dimensionsArray[6]
    thought7.title = "Environmental"
    thought7.detail = "You can change your environment."
    thought7.url = "https://www.mormonchannel.org/"
    thought7.order = 7
    thought7.favorite = false
    thought7.random = Int64(arc4random_uniform(1000))
    thought7.selected = false
    thought7.sortingIndex = 0
    
    let thought8 = Thought(context: context)
    thought8.topic = dimensionsArray[7]
    thought8.title = "Spiritual"
    thought8.detail = ""
    thought8.url = ""
    thought8.order = 8
    thought8.favorite = false
    thought8.random = Int64(arc4random_uniform(1000))
    thought8.selected = false
    thought8.sortingIndex = 0
    
    ad.saveContext()
}

func generateLessons() {
    getTasks()
    let lesson1 = Lesson(context: context)
    lesson1.selectedOne = selectedLesson
    lesson1.topic = topicsArray[0]
    lesson1.title = "FHE Playlist"
    lesson1.detail = "A collection of my personal favorite and spiritual videos. Pick one from the play list."
    lesson1.url = "https://www.youtube.com/playlist?list=PLbuu8VeGQ5CN5XZeSk8cUkHUpqKHaKYwP"
    lesson1.youTubeVideo = false
    lesson1.order = 1
    lesson1.favorite = true
    lesson1.random = Int64(arc4random_uniform(1000))
    lesson1.selected = true
    lesson1.sortingIndex = 0
    
    let lesson2 = Lesson(context: context)
    lesson2.topic = topicsArray[0]
    lesson2.title = ""
    lesson2.detail = ""
    lesson2.url = ""
    lesson2.youTubeVideo = true
    lesson2.order = 2
    lesson2.favorite = false
    lesson2.random = Int64(arc4random_uniform(1000))
    lesson2.selected = false
    lesson2.sortingIndex = 0
    
    ad.saveContext()
}

func generateCouncils() {
    getTasks()
    let council = Council(context: context)
    council.selectedOne = selectedCouncil
    council.title = "Family Council Meeting"
    council.detail = "“If people don't weigh in, they can't buy in.“\n- Patrick Lencioni"
    council.url = "https://www.lds.org/blog/bc/images/family-councils-cheat-sheet.pdf"
    council.selected = true
    
    ad.saveContext()
}

func generateGames() {
    getTasks()
    let game1 = Game(context: context)
    game1.category = categoryArray[0]
    game1.title = "Surprise!"
    game1.url = "https://drive.google.com/file/d/1vdnjN6aNW4iRC1ljf79MBELI2-eW0BHe/view"
    game1.favorite = true
    game1.order = 1
    game1.random = Int64(arc4random_uniform(1000))
    game1.selected = false
    game1.sortingIndex = 0
    
    let game2 = Game(context: context)
    game2.selectedOne = selectedGame
    game2.category = categoryArray[1]
    game2.title = "Button, Button, Who's Got the Button?"
    game2.url = "http://www.fungameskidsplay.com/buttonbuttongame.htm"
    game2.favorite = true
    game2.order = 2
    game2.random = Int64(arc4random_uniform(1000))
    game2.selected = true
    game2.sortingIndex = 0
    
    let game5 = Game(context: context)
    game5.category = categoryArray[4]
    game5.title = "Capture the Flag"
    game5.url = "http://www.fungameskidsplay.com/capturetheflaggame.htm"
    game5.favorite = false
    game5.order = 5
    game5.random = Int64(arc4random_uniform(1000))
    game5.selected = false
    game5.sortingIndex = 0
    
    let game6 = Game(context: context)
    game6.category = categoryArray[4]
    game6.title = "Dodgeball"
    game6.url = "http://www.fungameskidsplay.com/dodgeballgame.htm"
    game6.favorite = false
    game6.order = 6
    game6.random = Int64(arc4random_uniform(1000))
    game6.selected = false
    game6.sortingIndex = 0
    
    let game7 = Game(context: context)
    game7.category = categoryArray[1]
    game7.title = "Follow the Leader"
    game7.url = "http://www.fungameskidsplay.com/followtheleadergame.htm"
    game7.favorite = false
    game7.order = 7
    game7.random = Int64(arc4random_uniform(1000))
    game7.selected = false
    game7.sortingIndex = 0
    
    let game8 = Game(context: context)
    game8.category = categoryArray[1]
    game8.title = "Red Rover"
    game8.url = "http://www.fungameskidsplay.com/redrovergame.htm"
    game8.favorite = false
    game8.order = 8
    game8.random = Int64(arc4random_uniform(1000))
    game8.selected = false
    game8.sortingIndex = 0
    
    let game11 = Game(context: context)
    game11.category = categoryArray[1]
    game11.title = "Hide and Seek"
    game11.url = "http://www.fungameskidsplay.com/hideandseekgame.htm"
    game11.favorite = true
    game11.order = 11
    game11.random = Int64(arc4random_uniform(1000))
    game11.selected = false
    game11.sortingIndex = 0
    
    let game12 = Game(context: context)
    game12.category = categoryArray[1]
    game12.title = "Hopscotch"
    game12.url = "http://www.fungameskidsplay.com/hopscotchgame.htm"
    game12.favorite = false
    game12.order = 12
    game12.random = Int64(arc4random_uniform(1000))
    game12.selected = false
    game12.sortingIndex = 0
    
    let game13 = Game(context: context)
    game13.category = categoryArray[1]
    game13.title = "H.O.R.S.E."
    game13.url = "http://www.fungameskidsplay.com/horsegame.htm"
    game13.favorite = false
    game13.order = 13
    game13.random = Int64(arc4random_uniform(1000))
    game13.selected = false
    game13.sortingIndex = 0
    
    let game14 = Game(context: context)
    game14.category = categoryArray[1]
    game14.title = "Hot Potato"
    game14.url = "http://www.fungameskidsplay.com/hotpotatogame.htm"
    game14.favorite = false
    game14.order = 14
    game14.random = Int64(arc4random_uniform(1000))
    game14.selected = false
    game14.sortingIndex = 0
    
    let game15 = Game(context: context)
    game15.category = categoryArray[1]
    game15.title = "Hula Hoop"
    game15.url = "http://www.fungameskidsplay.com/hulahoopgame.htm"
    game15.favorite = false
    game15.order = 15
    game15.random = Int64(arc4random_uniform(1000))
    game15.selected = false
    game15.sortingIndex = 0
    
    let game16 = Game(context: context)
    game16.category = categoryArray[1]
    game16.title = "Jacks"
    game16.url = "http://www.fungameskidsplay.com/jacksgame.htm"
    game16.favorite = false
    game16.order = 16
    game16.random = Int64(arc4random_uniform(1000))
    game16.selected = false
    game16.sortingIndex = 0
    
    let game17 = Game(context: context)
    game17.category = categoryArray[1]
    game17.title = "Juggle Circle"
    game17.url = "http://www.fungameskidsplay.com/jugglecirclegame.htm"
    game17.favorite = false
    game17.order = 17
    game17.random = Int64(arc4random_uniform(1000))
    game17.selected = false
    game17.sortingIndex = 0
    
    let game18 = Game(context: context)
    game18.category = categoryArray[1]
    game18.title = "Jump Rope"
    game18.url = "http://www.fungameskidsplay.com/jump-rope-rhymes.htm"
    game18.favorite = false
    game18.order = 18
    game18.random = Int64(arc4random_uniform(1000))
    game18.selected = false
    game18.sortingIndex = 0
    
    let game19 = Game(context: context)
    game19.category = categoryArray[4]
    game19.title = "Kickball"
    game19.url = "http://www.fungameskidsplay.com/kickballgame.htm"
    game19.favorite = false
    game19.order = 19
    game19.random = Int64(arc4random_uniform(1000))
    game19.selected = false
    game19.sortingIndex = 0
    
    let game20 = Game(context: context)
    game20.category = categoryArray[4]
    game20.title = "Kick the Can"
    game20.url = "http://www.fungameskidsplay.com/kickthecangame.htm"
    game20.favorite = false
    game20.order = 20
    game20.random = Int64(arc4random_uniform(1000))
    game20.selected = false
    game20.sortingIndex = 0
    
    let game21 = Game(context: context)
    game21.category = categoryArray[1]
    game21.title = "Limbo"
    game21.url = "http://www.fungameskidsplay.com/limbogame.htm"
    game21.favorite = true
    game21.order = 21
    game21.random = Int64(arc4random_uniform(1000))
    game21.selected = false
    game21.sortingIndex = 0
    
    let game22 = Game(context: context)
    game22.category = categoryArray[1]
    game22.title = "Marbles"
    game22.url = "http://www.fungameskidsplay.com/marblesgame.htm"
    game22.favorite = false
    game22.order = 22
    game22.random = Int64(arc4random_uniform(1000))
    game22.selected = false
    game22.sortingIndex = 0
    
    let game23 = Game(context: context)
    game23.category = categoryArray[1]
    game23.title = "Monkey in the Middle"
    game23.url = "http://www.fungameskidsplay.com/monkeyinthemiddle.htm"
    game23.favorite = false
    game23.order = 23
    game23.random = Int64(arc4random_uniform(1000))
    game23.selected = false
    game23.sortingIndex = 0
    
    let game24 = Game(context: context)
    game24.category = categoryArray[1]
    game24.title = "Playground Shark"
    game24.url = "http://www.fungameskidsplay.com/playgroundsharkgame.htm"
    game24.favorite = false
    game24.order = 24
    game24.random = Int64(arc4random_uniform(1000))
    game24.selected = false
    game24.sortingIndex = 0
    
    let game25 = Game(context: context)
    game25.category = categoryArray[1]
    game25.title = "Mother May I?"
    game25.url = "http://www.fungameskidsplay.com/mothermayigame.htm"
    game25.favorite = false
    game25.order = 25
    game25.random = Int64(arc4random_uniform(1000))
    game25.selected = false
    game25.sortingIndex = 0
    
    let game26 = Game(context: context)
    game26.category = categoryArray[1]
    game26.title = "Red Light Green Light"
    game26.url = "http://www.fungameskidsplay.com/redlightgreenlightgame.htm"
    game26.favorite = false
    game26.order = 26
    game26.random = Int64(arc4random_uniform(1000))
    game26.selected = false
    game26.sortingIndex = 0
    
    let game27 = Game(context: context)
    game27.category = categoryArray[1]
    game27.title = "Relay Race"
    game27.url = "http://www.fungameskidsplay.com/relayracegames.htm"
    game27.favorite = false
    game27.order = 27
    game27.random = Int64(arc4random_uniform(1000))
    game27.selected = false
    game27.sortingIndex = 0
    
    let game28 = Game(context: context)
    game28.category = categoryArray[1]
    game28.title = "Tag"
    game28.url = "http://www.fungameskidsplay.com/taggames.htm"
    game28.favorite = true
    game28.order = 28
    game28.random = Int64(arc4random_uniform(1000))
    game28.selected = false
    game28.sortingIndex = 0
    
    let game29 = Game(context: context)
    game29.category = categoryArray[1]
    game29.title = "I Spy"
    game29.url = "http://www.fungameskidsplay.com/travelgames.htm"
    game29.favorite = false
    game29.order = 29
    game29.random = Int64(arc4random_uniform(1000))
    game29.selected = false
    game29.sortingIndex = 0
    
    let game30 = Game(context: context)
    game30.category = categoryArray[0]
    game30.title = "You're It!"
    game30.url = "http://www.fungameskidsplay.com/youreit.htm"
    game30.favorite = false
    game30.order = 30
    game30.random = Int64(arc4random_uniform(1000))
    game30.selected = false
    game30.sortingIndex = 0
    
    let game31 = Game(context: context)
    game31.category = categoryArray[1]
    game31.title = "5 Little Monkeys Swinging In The Tree"
    game31.url = "https://www.youtube.com/watch?v=sy0Zr_UrFp0"
    game31.favorite = false
    game31.order = 31
    game31.random = Int64(arc4random_uniform(1000))
    game31.selected = false
    game31.sortingIndex = 0
    
    let game32 = Game(context: context)
    game32.category = categoryArray[4]
    game32.title = "Basketball"
    game32.url = "https://www.wikihow.com/Play-Basketball"
    game32.favorite = false
    game32.order = 32
    game32.random = Int64(arc4random_uniform(1000))
    game32.selected = false
    game32.sortingIndex = 0
    
    let game33 = Game(context: context)
    game33.category = categoryArray[4]
    game33.title = "Soccer"
    game33.url = "https://www.wikihow.com/Play-Soccer"
    game33.favorite = false
    game33.order = 33
    game33.random = Int64(arc4random_uniform(1000))
    game33.selected = false
    game33.sortingIndex = 0
    
    let game34 = Game(context: context)
    game34.category = categoryArray[6]
    game34.title = "Kite Flying"
    game34.url = "https://www.wikihow.com/Fly-a-Stunt-Kite"
    game34.favorite = false
    game34.order = 34
    game34.random = Int64(arc4random_uniform(1000))
    game34.selected = false
    game34.sortingIndex = 0
    
    let game35 = Game(context: context)
    game35.category = categoryArray[6]
    game35.title = "Hiking"
    game35.url = "https://www.wikihow.com/Hike"
    game35.favorite = false
    game35.order = 35
    game35.random = Int64(arc4random_uniform(1000))
    game35.selected = false
    game35.sortingIndex = 0
    
    let game36 = Game(context: context)
    game36.category = categoryArray[5]
    game36.title = "Luminaria"
    game36.url = "https://thanksgivingpoint.org/events/luminaria/"
    game36.favorite = false
    game36.order = 36
    game36.random = Int64(arc4random_uniform(1000))
    game36.selected = false
    game36.sortingIndex = 0
    
    let game37 = Game(context: context)
    game37.category = categoryArray[6]
    game37.title = "Lemonade Stand"
    game37.url = "https://www.wikihow.com/Run-a-Lemonade-Stand"
    game37.favorite = false
    game37.order = 37
    game37.random = Int64(arc4random_uniform(1000))
    game37.selected = false
    game37.sortingIndex = 0
    
    let game38 = Game(context: context)
    game38.category = categoryArray[6]
    game38.title = "Build A Snowman"
    game38.url = "https://www.wikihow.com/Make-a-Snowman"
    game38.favorite = false
    game38.order = 38
    game38.random = Int64(arc4random_uniform(1000))
    game38.selected = false
    game38.sortingIndex = 0
    
    let game39 = Game(context: context)
    game39.category = categoryArray[9]
    game39.title = "Picture Collage"
    game39.url = "https://www.wikihow.com/Make-a-Collage"
    game39.favorite = false
    game39.order = 39
    game39.random = Int64(arc4random_uniform(1000))
    game39.selected = false
    game39.sortingIndex = 0
    
    let game40 = Game(context: context)
    game40.category = categoryArray[5]
    game40.title = "Zoo"
    game40.url = "https://www.tripadvisor.com/Attractions"
    game40.favorite = false
    game40.order = 40
    game40.random = Int64(arc4random_uniform(1000))
    game40.selected = false
    game40.sortingIndex = 0
    
    let game41 = Game(context: context)
    game41.category = categoryArray[5]
    game41.title = "Local Event"
    game41.url = "https://www.tripadvisor.com/Attractions"
    game41.favorite = false
    game41.order = 41
    game41.random = Int64(arc4random_uniform(1000))
    game41.selected = false
    game41.sortingIndex = 0
    
    let game42 = Game(context: context)
    game42.category = categoryArray[1]
    game42.title = "Blanket Fort"
    game42.url = "https://www.wikihow.com/Make-a-Blanket-Fort"
    game42.favorite = true
    game42.order = 42
    game42.random = Int64(arc4random_uniform(1000))
    game42.selected = false
    game42.sortingIndex = 0
    
    let game43 = Game(context: context)
    game43.category = categoryArray[7]
    game43.title = "Genealogy"
    game43.url = "https://www.familysearch.org/"
    game43.favorite = false
    game43.order = 43
    game43.random = Int64(arc4random_uniform(1000))
    game43.selected = false
    game43.sortingIndex = 0
    
    let game44 = Game(context: context)
    game44.category = categoryArray[5]
    game44.title = "Family Photos"
    game44.url = "https://www.wikihow.com/Accessorize-Your-Home-With-Family-Photos"
    game44.favorite = false
    game44.order = 44
    game44.random = Int64(arc4random_uniform(1000))
    game44.selected = false
    game44.sortingIndex = 0
    
    let game45 = Game(context: context)
    game45.category = categoryArray[7]
    game45.title = "Clean House"
    game45.url = "https://www.wikihow.com/Clean-a-House"
    game45.favorite = false
    game45.order = 45
    game45.random = Int64(arc4random_uniform(1000))
    game45.selected = false
    game45.sortingIndex = 0
    
    let game46 = Game(context: context)
    game46.category = categoryArray[7]
    game46.title = "Visit Someone in Need"
    game46.url = "https://www.wikihow.com/Prepare-Yourself-for-Visiting-Someone-in-Hospital"
    game46.favorite = false
    game46.order = 46
    game46.random = Int64(arc4random_uniform(1000))
    game46.selected = false
    game46.sortingIndex = 0
    
    let game47 = Game(context: context)
    game47.category = categoryArray[6]
    game47.title = "Sledding"
    game47.url = "https://www.wikihow.com/Go-Sledding"
    game47.favorite = false
    game47.order = 47
    game47.random = Int64(arc4random_uniform(1000))
    game47.selected = false
    game47.sortingIndex = 0
    
    let game48 = Game(context: context)
    game48.category = categoryArray[9]
    game48.title = "Draw / Color"
    game48.url = "https://www.wikihow.com/Draw"
    game48.favorite = false
    game48.order = 48
    game48.random = Int64(arc4random_uniform(1000))
    game48.selected = false
    game48.sortingIndex = 0
    
    let game49 = Game(context: context)
    game49.category = categoryArray[0]
    game49.title = "Tell Stories"
    game49.url = "https://www.wikihow.com/Tell-a-Story"
    game49.favorite = false
    game49.order = 49
    game49.random = Int64(arc4random_uniform(1000))
    game49.selected = false
    game49.sortingIndex = 0
    
    let game50 = Game(context: context)
    game50.category = categoryArray[4]
    game50.title = "Baseball"
    game50.url = "https://www.wikihow.com/Play-Baseball"
    game50.favorite = false
    game50.order = 50
    game50.random = Int64(arc4random_uniform(1000))
    game50.selected = false
    game50.sortingIndex = 0
    
    let game51 = Game(context: context)
    game51.category = categoryArray[4]
    game51.title = "Ultimate Frisbee"
    game51.url = "https://www.wikihow.com/Play-Ultimate-Frisbee"
    game51.favorite = false
    game51.order = 51
    game51.random = Int64(arc4random_uniform(1000))
    game51.selected = false
    game51.sortingIndex = 0
    
    let game52 = Game(context: context)
    game52.category = categoryArray[4]
    game52.title = "Football"
    game52.url = "https://www.wikihow.com/Play-American-Football"
    game52.favorite = false
    game52.order = 52
    game52.random = Int64(arc4random_uniform(1000))
    game52.selected = false
    game52.sortingIndex = 0
    
    let game53 = Game(context: context)
    game53.category = categoryArray[6]
    game53.title = "Biking"
    game53.url = "https://www.wikihow.com/Ride-a-Bicycle"
    game53.favorite = false
    game53.order = 53
    game53.random = Int64(arc4random_uniform(1000))
    game53.selected = false
    game53.sortingIndex = 0
    
    let game54 = Game(context: context)
    game54.category = categoryArray[0]
    game54.title = "Play Musical Instrument(s) and/or Sing"
    game54.url = "https://www.wikihow.com/Make-a-Simple-Musical-Instrument"
    game54.favorite = false
    game54.order = 54
    game54.random = Int64(arc4random_uniform(1000))
    game54.selected = false
    game54.sortingIndex = 0
    
    let game55 = Game(context: context)
    game55.category = categoryArray[6]
    game55.title = "Rollerblade or Skate"
    game55.url = "https://www.wikihow.com/Rollerblade"
    game55.favorite = false
    game55.order = 55
    game55.random = Int64(arc4random_uniform(1000))
    game55.selected = false
    game55.sortingIndex = 0
    
    let game56 = Game(context: context)
    game56.category = categoryArray[9]
    game56.title = "Paint"
    game56.url = "https://www.wikihow.com/Make-Non-Toxic-Paint-for-Kids"
    game56.favorite = false
    game56.order = 56
    game56.random = Int64(arc4random_uniform(1000))
    game56.selected = false
    game56.sortingIndex = 0
    
    let game57 = Game(context: context)
    game57.category = categoryArray[7]
    game57.title = "72 Hour Kit"
    game57.url = "https://www.wikihow.com/Build-Your-Own-Emergency-Disaster-Kit"
    game57.favorite = false
    game57.order = 57
    game57.random = Int64(arc4random_uniform(1000))
    game57.selected = false
    game57.sortingIndex = 0
    
    let game58 = Game(context: context)
    game58.category = categoryArray[7]
    game58.title = "Yard Work / Gardening / Planting"
    game58.url = "https://www.wikihow.com/Garden"
    game58.favorite = false
    game58.order = 58
    game58.random = Int64(arc4random_uniform(1000))
    game58.selected = false
    game58.sortingIndex = 0
    
    let game59 = Game(context: context)
    game59.category = categoryArray[6]
    game59.title = "Swimming"
    game59.url = "https://www.wikihow.com/Swim"
    game59.favorite = false
    game59.order = 59
    game59.random = Int64(arc4random_uniform(1000))
    game59.selected = false
    game59.sortingIndex = 0
    
    let game60 = Game(context: context)
    game60.category = categoryArray[6]
    game60.title = "Bird Watching"
    game60.url = "https://www.wikihow.com/Bird-Watch"
    game60.favorite = false
    game60.order = 60
    game60.random = Int64(arc4random_uniform(1000))
    game60.selected = false
    game60.sortingIndex = 0
    
    let game61 = Game(context: context)
    game61.category = categoryArray[6]
    game61.title = "Walk"
    game61.url = "https://www.wikihow.com/Walk"
    game61.favorite = false
    game61.order = 61
    game61.random = Int64(arc4random_uniform(1000))
    game61.selected = false
    game61.sortingIndex = 0
    
    let game62 = Game(context: context)
    game62.category = categoryArray[6]
    game62.title = "Pick Berries / Fruit"
    game62.url = "https://www.wikihow.com/Freeze-Blackberries"
    game62.favorite = false
    game62.order = 62
    game62.random = Int64(arc4random_uniform(1000))
    game62.selected = false
    game62.sortingIndex = 0
    
    let game63 = Game(context: context)
    game63.category = categoryArray[8]
    game63.title = "Can Food"
    game63.url = "https://www.wikihow.com/Can-Food"
    game63.favorite = false
    game63.order = 63
    game63.random = Int64(arc4random_uniform(1000))
    game63.selected = false
    game63.sortingIndex = 0
    
    let game64 = Game(context: context)
    game64.category = categoryArray[8]
    game64.title = "Make Desert"
    game64.url = "https://www.wikihow.com/Category:Desserts-and-Sweets"
    game64.favorite = false
    game64.order = 64
    game64.random = Int64(arc4random_uniform(1000))
    game64.selected = false
    game64.sortingIndex = 0
    
    let game65 = Game(context: context)
    game65.category = categoryArray[8]
    game65.title = "Make Dinner"
    game65.url = "https://www.wikihow.com/Make-a-Good-Meal-for-Your-Family-(for-Kids)"
    game65.favorite = false
    game65.order = 65
    game65.random = Int64(arc4random_uniform(1000))
    game65.selected = false
    game65.sortingIndex = 0
    
    let game66 = Game(context: context)
    game66.category = categoryArray[7]
    game66.title = "Share Treats With Someone"
    game66.url = "https://www.wikihow.com/Category:Desserts-and-Sweets"
    game66.favorite = false
    game66.order = 66
    game66.random = Int64(arc4random_uniform(1000))
    game66.selected = false
    game66.sortingIndex = 0
    
    let game67 = Game(context: context)
    game67.category = categoryArray[10]
    game67.title = "Write / Journal"
    game67.url = "https://www.wikihow.com/Write"
    game67.favorite = false
    game67.order = 67
    game67.random = Int64(arc4random_uniform(1000))
    game67.selected = false
    game67.sortingIndex = 0
    
    let game68 = Game(context: context)
    game68.category = categoryArray[5]
    game68.title = "Museum"
    game68.url = "https://www.tripadvisor.com/Attractions"
    game68.favorite = false
    game68.order = 68
    game68.random = Int64(arc4random_uniform(1000))
    game68.selected = false
    game68.sortingIndex = 0
    
    let game69 = Game(context: context)
    game69.category = categoryArray[5]
    game69.title = "Aquarium"
    game69.url = "https://www.tripadvisor.com/Attractions"
    game69.favorite = false
    game69.order = 69
    game69.random = Int64(arc4random_uniform(1000))
    game69.selected = false
    game69.sortingIndex = 0
    
    let game70 = Game(context: context)
    game70.category = categoryArray[3]
    game70.title = "Poker"
    game70.url = "https://www.wikihow.com/Deal-Poker"
    game70.favorite = false
    game70.order = 70
    game70.random = Int64(arc4random_uniform(1000))
    game70.selected = false
    game70.sortingIndex = 0
    
    let game71 = Game(context: context)
    game71.category = categoryArray[3]
    game71.title = "War"
    game71.url = "https://www.wikihow.com/Play-War-(Card-Game)"
    game71.favorite = false
    game71.order = 71
    game71.random = Int64(arc4random_uniform(1000))
    game71.selected = false
    game71.sortingIndex = 0
    
    let game72 = Game(context: context)
    game72.category = categoryArray[3]
    game72.title = "Go-Fish"
    game72.url = "https://www.wikihow.com/Play-Go-Fish-with-Any-Cards"
    game72.favorite = false
    game72.order = 72
    game72.random = Int64(arc4random_uniform(1000))
    game72.selected = false
    game72.sortingIndex = 0
    
    let game73 = Game(context: context)
    game73.category = categoryArray[3]
    game73.title = "Hearts"
    game73.url = "https://www.wikihow.com/Play-Hearts"
    game73.favorite = false
    game73.order = 73
    game73.random = Int64(arc4random_uniform(1000))
    game73.selected = false
    game73.sortingIndex = 0
    
    let game74 = Game(context: context)
    game74.category = categoryArray[3]
    game74.title = "Spades"
    game74.url = "https://www.wikihow.com/Play-Spades"
    game74.favorite = true
    game74.order = 74
    game74.random = Int64(arc4random_uniform(1000))
    game74.selected = false
    game74.sortingIndex = 0
    
    let game75 = Game(context: context)
    game75.category = categoryArray[3]
    game75.title = "Five-Card Draw"
    game75.url = "https://drive.google.com/file/d/1hV7xkGPC8slw6dlWRNlHqbLznyxm9W4q/view"
    game75.favorite = true
    game75.order = 75
    game75.random = Int64(arc4random_uniform(1000))
    game75.selected = false
    game75.sortingIndex = 0
    
    let game76 = Game(context: context)
    game76.category = categoryArray[3]
    game76.title = "21 - Blackjack"
    game76.url = "https://www.wikihow.com/Play-Blackjack"
    game76.favorite = true
    game76.order = 76
    game76.random = Int64(arc4random_uniform(1000))
    game76.selected = false
    game76.sortingIndex = 0
    
    let game77 = Game(context: context)
    game77.category = categoryArray[3]
    game77.title = "Texas hold'em"
    game77.url = "https://www.wikihow.com/Shuffle-and-Deal-Texas-Holdem"
    game77.favorite = true
    game77.order = 77
    game77.random = Int64(arc4random_uniform(1000))
    game77.selected = false
    game77.sortingIndex = 0
    
    let game78 = Game(context: context)
    game78.category = categoryArray[2]
    game78.title = "Snakes and Ladders"
    game78.url = "http://amzn.to/2ejq9rD"
    game78.favorite = true
    game78.order = 78
    game78.random = Int64(arc4random_uniform(1000))
    game78.selected = false
    game78.sortingIndex = 0
    
    let game79 = Game(context: context)
    game79.category = categoryArray[2]
    game79.title = "Candyland"
    game79.url = "http://amzn.to/2ejmEBs"
    game79.favorite = true
    game79.order = 79
    game79.random = Int64(arc4random_uniform(1000))
    game79.selected = false
    game79.sortingIndex = 0
    
    let game80 = Game(context: context)
    game80.category = categoryArray[2]
    game80.title = "Yahtzee!"
    game80.url = "http://amzn.to/2e7cXGT"
    game80.favorite = true
    game80.order = 80
    game80.random = Int64(arc4random_uniform(1000))
    game80.selected = false
    game80.sortingIndex = 0
    
    let game81 = Game(context: context)
    game81.category = categoryArray[3]
    game81.title = "Uno"
    game81.url = "http://amzn.to/2e8QQlS"
    game81.favorite = true
    game81.order = 81
    game81.random = Int64(arc4random_uniform(1000))
    game81.selected = false
    game81.sortingIndex = 0
    
    let game82 = Game(context: context)
    game82.category = categoryArray[2]
    game82.title = "Sorry!"
    game82.url = "http://amzn.to/2euN2r4"
    game82.favorite = false
    game82.order = 82
    game82.random = Int64(arc4random_uniform(1000))
    game82.selected = false
    game82.sortingIndex = 0
    
    let game83 = Game(context: context)
    game83.category = categoryArray[2]
    game83.title = "Pictionary"
    game83.url = "http://amzn.to/2etoKfL"
    game83.favorite = false
    game83.order = 83
    game83.random = Int64(arc4random_uniform(1000))
    game83.selected = false
    game83.sortingIndex = 0
    
    let game84 = Game(context: context)
    game84.category = categoryArray[2]
    game84.title = "Dominoes"
    game84.url = "http://amzn.to/2emDz5n"
    game84.favorite = false
    game84.order = 84
    game84.random = Int64(arc4random_uniform(1000))
    game84.selected = false
    game84.sortingIndex = 0
    
    let game85 = Game(context: context)
    game85.category = categoryArray[2]
    game85.title = "The Game of Life"
    game85.url = "http://amzn.to/2dP9U3a"
    game85.favorite = false
    game85.order = 85
    game85.random = Int64(arc4random_uniform(1000))
    game85.selected = false
    game85.sortingIndex = 0
    
    let game86 = Game(context: context)
    game86.category = categoryArray[2]
    game86.title = "Trivial Pursuit"
    game86.url = "http://amzn.to/2eSFkKa"
    game86.favorite = false
    game86.order = 86
    game86.random = Int64(arc4random_uniform(1000))
    game86.selected = false
    game86.sortingIndex = 0
    
    let game87 = Game(context: context)
    game87.category = categoryArray[2]
    game87.title = "Taboo"
    game87.url = "http://amzn.to/2e92vRI"
    game87.favorite = false
    game87.order = 87
    game87.random = Int64(arc4random_uniform(1000))
    game87.selected = false
    game87.sortingIndex = 0
    
    let game88 = Game(context: context)
    game88.category = categoryArray[2]
    game88.title = "Ticket to Ride"
    game88.url = "http://amzn.to/2e2hE3F"
    game88.favorite = false
    game88.order = 88
    game88.random = Int64(arc4random_uniform(1000))
    game88.selected = false
    game88.sortingIndex = 0
    
    let game89 = Game(context: context)
    game89.category = categoryArray[2]
    game89.title = "Canasta"
    game89.url = "http://amzn.to/2ev2Nyh"
    game89.favorite = false
    game89.order = 89
    game89.random = Int64(arc4random_uniform(1000))
    game89.selected = false
    game89.sortingIndex = 0
    
    let game90 = Game(context: context)
    game90.category = categoryArray[2]
    game90.title = "Clue"
    game90.url = "http://amzn.to/2ev2kfs"
    game90.favorite = false
    game90.order = 90
    game90.random = Int64(arc4random_uniform(1000))
    game90.selected = false
    game90.sortingIndex = 0
    
    let game91 = Game(context: context)
    game91.category = categoryArray[2]
    game91.title = "Scrabble"
    game91.url = "http://amzn.to/2etEAab"
    game91.favorite = false
    game91.order = 91
    game91.random = Int64(arc4random_uniform(1000))
    game91.selected = false
    game91.sortingIndex = 0
    
    let game92 = Game(context: context)
    game92.category = categoryArray[2]
    game92.title = "Apples to Apples"
    game92.url = "http://amzn.to/2ev21B4"
    game92.favorite = false
    game92.order = 92
    game92.random = Int64(arc4random_uniform(1000))
    game92.selected = false
    game92.sortingIndex = 0
    
    let game93 = Game(context: context)
    game93.category = categoryArray[2]
    game93.title = "Settlers of Cataan"
    game93.url = "http://amzn.to/2etFPWW"
    game93.favorite = false
    game93.order = 93
    game93.random = Int64(arc4random_uniform(1000))
    game93.selected = false
    game93.sortingIndex = 0
    
    let game94 = Game(context: context)
    game94.category = categoryArray[2]
    game94.title = "Risk"
    game94.url = "http://amzn.to/2e96Lkc"
    game94.favorite = false
    game94.order = 94
    game94.random = Int64(arc4random_uniform(1000))
    game94.selected = false
    game94.sortingIndex = 0
    
    let game95 = Game(context: context)
    game95.category = categoryArray[3]
    game95.title = "Bridge"
    game95.url = "https://www.wikihow.com/Play-Bridge"
    game95.favorite = false
    game95.order = 95
    game95.random = Int64(arc4random_uniform(1000))
    game95.selected = false
    game95.sortingIndex = 0
    
    let game96 = Game(context: context)
    game96.category = categoryArray[1]
    game96.title = "Mafia"
    game96.url = "https://www.wikihow.com/Play-Mafia"
    game96.favorite = false
    game96.order = 96
    game96.random = Int64(arc4random_uniform(1000))
    game96.selected = false
    game96.sortingIndex = 0
    
    let game97 = Game(context: context)
    game97.category = categoryArray[2]
    game97.title = "Monopoly"
    game97.url = "http://amzn.to/2eSRov7"
    game97.favorite = false
    game97.order = 97
    game97.random = Int64(arc4random_uniform(1000))
    game97.selected = false
    game97.sortingIndex = 0
    
    let game98 = Game(context: context)
    game98.category = categoryArray[3]
    game98.title = "Farkle"
    game98.url = "https://www.wikihow.com/Play-Farkle"
    game98.favorite = true
    game98.order = 98
    game98.random = Int64(arc4random_uniform(1000))
    game98.selected = false
    game98.sortingIndex = 0
    
    let game99 = Game(context: context)
    game99.category = categoryArray[3]
    game99.title = "Phase 10"
    game99.url = "https://www.amazon.com/Phase-Card-Game-Styles-Vary/dp/B004MU9V8Q/ref=sr_1_2?s=toys-and-games&ie=UTF8&qid=1512765083&sr=1-2&keywords=phase+10"
    game99.favorite = false
    game99.order = 99
    game99.random = Int64(arc4random_uniform(1000))
    game99.selected = false
    game99.sortingIndex = 0
    
    let game100 = Game(context: context)
    game100.category = categoryArray[3]
    game100.title = "Skip-Bo"
    game100.url = "https://www.amazon.com/Mattel-42050-SKIP-Card-Game/dp/B0000205XI/ref=sr_1_4?s=toys-and-games&ie=UTF8&qid=1512765192&sr=1-4&keywords=skip+bo"
    game100.favorite = false
    game100.order = 100
    game100.random = Int64(arc4random_uniform(1000))
    game100.selected = false
    game100.sortingIndex = 0
    
    let game101 = Game(context: context)
    game101.category = categoryArray[6]
    game101.title = "Family Exercise"
    game101.url = "https://www.wikihow.com/Exercise-Together-As-a-Family"
    game101.favorite = false
    game101.order = 101
    game101.random = Int64(arc4random_uniform(1000))
    game101.selected = false
    game101.sortingIndex = 0
    
    let game102 = Game(context: context)
    game102.category = categoryArray[10]
    game102.title = "Meditation"
    game102.url = "https://www.wikihow.com/Meditate-for-Beginners"
    game102.favorite = true
    game102.order = 102
    game102.random = Int64(arc4random_uniform(1000))
    game102.selected = false
    game102.sortingIndex = 0
    
    let game103 = Game(context: context)
    game103.category = categoryArray[10]
    game103.title = "Yoga"
    game103.url = "https://www.wikihow.com/Do-Yoga-for-Absolute-Beginners"
    game103.favorite = true
    game103.order = 103
    game103.random = Int64(arc4random_uniform(1000))
    game103.selected = false
    game103.sortingIndex = 0
    
    let game104 = Game(context: context)
    game104.category = categoryArray[9]
    game104.title = "Make Christmas Ornaments"
    game104.url = "https://www.wikihow.com/Make-a-Christmas-Tree-Ornament"
    game104.favorite = false
    game104.order = 104
    game104.random = Int64(arc4random_uniform(1000))
    game104.selected = false
    game104.sortingIndex = 0
    
    let game105 = Game(context: context)
    game105.category = categoryArray[7]
    game105.title = "Service Project"
    game105.url = "https://www.justserve.org/"
    game105.favorite = false
    game105.order = 105
    game105.random = Int64(arc4random_uniform(1000))
    game105.selected = false
    game105.sortingIndex = 0
    
    let game106 = Game(context: context)
    game106.category = categoryArray[6]
    game106.title = "Fishing"
    game106.url = "https://www.wikihow.com/Fish"
    game106.favorite = false
    game106.order = 106
    game106.random = Int64(arc4random_uniform(1000))
    game106.selected = false
    game106.sortingIndex = 0
    
    let game107 = Game(context: context)
    game107.category = categoryArray[0]
    game107.title = "Take Photographs"
    game107.url = "https://www.wikihow.com/Take-Better-Photographs"
    game107.favorite = false
    game107.order = 107
    game107.random = Int64(arc4random_uniform(1000))
    game107.selected = false
    game107.sortingIndex = 0
    
    let game108 = Game(context: context)
    game108.category = categoryArray[1]
    game108.title = "Role-Playing / Dress-Up"
    game108.url = "https://www.wikihow.com/Roleplay"
    game108.favorite = false
    game108.order = 108
    game108.random = Int64(arc4random_uniform(1000))
    game108.selected = false
    game108.sortingIndex = 0
    
    let game109 = Game(context: context)
    game109.category = categoryArray[2]
    game109.title = "Chess / Checkers"
    game109.url = "https://www.wikihow.com/Play-Chess"
    game109.favorite = false
    game109.order = 109
    game109.random = Int64(arc4random_uniform(1000))
    game109.selected = false
    game109.sortingIndex = 0
    
    let game110 = Game(context: context)
    game110.category = categoryArray[1]
    game110.title = "Charades"
    game110.url = "https://www.wikihow.com/Play-Charades"
    game110.favorite = true
    game110.order = 110
    game110.random = Int64(arc4random_uniform(1000))
    game110.selected = false
    game110.sortingIndex = 0
    
    let game111 = Game(context: context)
    game111.category = categoryArray[1]
    game111.title = "Murder Mystery"
    game111.url = "https://www.wikihow.com/Host-a-Murder-Mystery-Party"
    game111.favorite = false
    game111.order = 111
    game111.random = Int64(arc4random_uniform(1000))
    game111.selected = false
    game111.sortingIndex = 0
    
    let game112 = Game(context: context)
    game112.category = categoryArray[7]
    game112.title = "Car Wash"
    game112.url = "https://www.wikihow.com/Wash-a-Car-by-Hand"
    game112.favorite = false
    game112.order = 112
    game112.random = Int64(arc4random_uniform(1000))
    game112.selected = false
    game112.sortingIndex = 0
    
    let game113 = Game(context: context)
    game113.category = categoryArray[1]
    game113.title = "Movie Night"
    game113.url = "https://www.rottentomatoes.com/"
    game113.favorite = false
    game113.order = 113
    game113.random = Int64(arc4random_uniform(1000))
    game113.selected = false
    game113.sortingIndex = 0
    
    let game114 = Game(context: context)
    game114.category = categoryArray[6]
    game114.title = "Golf / Miniature Golf"
    game114.url = "https://www.wikihow.com/Learn-to-Play-Golf"
    game114.favorite = false
    game114.order = 114
    game114.random = Int64(arc4random_uniform(1000))
    game114.selected = false
    game114.sortingIndex = 0
    
    let game115 = Game(context: context)
    game115.category = categoryArray[5]
    game115.title = "Shopping"
    game115.url = "https://www.wikihow.com/Grocery-Shop-With-Kids"
    game115.favorite = false
    game115.order = 115
    game115.random = Int64(arc4random_uniform(1000))
    game115.selected = false
    game115.sortingIndex = 0
    
    let game116 = Game(context: context)
    game116.category = categoryArray[1]
    game116.title = "Puzzle"
    game116.url = "https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=puzzles"
    game116.favorite = false
    game116.order = 116
    game116.random = Int64(arc4random_uniform(1000))
    game116.selected = false
    game116.sortingIndex = 0
    
    let game117 = Game(context: context)
    game117.category = categoryArray[10]
    game117.title = "Stretch"
    game117.url = "https://www.wikihow.com/Stretch"
    game117.favorite = false
    game117.order = 117
    game117.random = Int64(arc4random_uniform(1000))
    game117.selected = false
    game117.sortingIndex = 0
    
    ad.saveContext()
}

func generateTreats() {
    getTasks()
    let treat1 = Treat(context: context)
    treat1.selectedOne = selectedTreat
    treat1.category = treatsArray[0]
    treat1.title = "Surprise!"
    treat1.url = "https://drive.google.com/file/d/1vdnjN6aNW4iRC1ljf79MBELI2-eW0BHe/view"
    treat1.favorite = true
    treat1.order = 1
    treat1.random = Int64(arc4random_uniform(1000))
    treat1.selected = false
    treat1.sortingIndex = 0
    
    let treat2 = Treat(context: context)
    treat2.category = treatsArray[1]
    treat2.title = "Chocolate Chip Cookies"
    treat2.url = "https://pin.it/digy53rpktcbza"
    treat2.favorite = true
    treat2.order = 2
    treat2.random = Int64(arc4random_uniform(1000))
    treat2.selected = true
    treat2.sortingIndex = 0
    
    let treat3 = Treat(context: context)
    treat3.category = treatsArray[0]
    treat3.title = "S'mores"
    treat3.url = "https://pin.it/k2wn4tvrckyfh4"
    treat3.favorite = true
    treat3.order = 3
    treat3.random = Int64(arc4random_uniform(1000))
    treat3.selected = false
    treat3.sortingIndex = 0
    
    let treat4 = Treat(context: context)
    treat4.category = treatsArray[2]
    treat4.title = "Brownies"
    treat4.url = "https://pin.it/lrk44ktgy5juab"
    treat4.favorite = true
    treat4.order = 4
    treat4.random = Int64(arc4random_uniform(1000))
    treat4.selected = false
    treat4.sortingIndex = 0
    
    let treat5 = Treat(context: context)
    treat5.category = treatsArray[3]
    treat5.title = "Chocolate Cake"
    treat5.url = "https://pin.it/flg2akxci43cu3"
    treat5.favorite = false
    treat5.order = 5
    treat5.random = Int64(arc4random_uniform(1000))
    treat5.selected = false
    treat5.sortingIndex = 0
    
    let treat6 = Treat(context: context)
    treat6.category = treatsArray[3]
    treat6.title = "Cookies & Cream Cupcakes"
    treat6.url = "https://pin.it/g2rouxg72kxakd"
    treat6.favorite = false
    treat6.order = 6
    treat6.random = Int64(arc4random_uniform(1000))
    treat6.selected = false
    treat6.sortingIndex = 0
    
    let treat7 = Treat(context: context)
    treat7.category = treatsArray[4]
    treat7.title = "Apple Pie"
    treat7.url = "https://pin.it/h3tqjhnddu2zfx"
    treat7.favorite = false
    treat7.order = 7
    treat7.random = Int64(arc4random_uniform(1000))
    treat7.selected = false
    treat7.sortingIndex = 0
    
    let treat8 = Treat(context: context)
    treat8.category = treatsArray[5]
    treat8.title = "Strawberry Ice Cream"
    treat8.url = "https://pin.it/4j3vfkisqwevkh"
    treat8.favorite = false
    treat8.order = 8
    treat8.random = Int64(arc4random_uniform(1000))
    treat8.selected = false
    treat8.sortingIndex = 0
    
    let treat9 = Treat(context: context)
    treat9.category = treatsArray[6]
    treat9.title = "Strawberry Coconut Shake"
    treat9.url = "https://pin.it/gn5hg2zde2cws5"
    treat9.favorite = false
    treat9.order = 9
    treat9.random = Int64(arc4random_uniform(1000))
    treat9.selected = false
    treat9.sortingIndex = 0
    
    let treat10 = Treat(context: context)
    treat10.category = treatsArray[7]
    treat10.title = "Popsicles"
    treat10.url = "https://pin.it/52rngnfkjyh56l"
    treat10.favorite = false
    treat10.order = 10
    treat10.random = Int64(arc4random_uniform(1000))
    treat10.selected = false
    treat10.sortingIndex = 0
    
    let treat11 = Treat(context: context)
    treat11.category = treatsArray[8]
    treat11.title = "Chocolate Pudding"
    treat11.url = "https://pin.it/ohboixv2afu3xf"
    treat11.favorite = false
    treat11.order = 11
    treat11.random = Int64(arc4random_uniform(1000))
    treat11.selected = false
    treat11.sortingIndex = 0
    
    let treat12 = Treat(context: context)
    treat12.category = treatsArray[9]
    treat12.title = "Butterfinders"
    treat12.url = "https://pin.it/3ikto7zqomaxtl"
    treat12.favorite = false
    treat12.order = 12
    treat12.random = Int64(arc4random_uniform(1000))
    treat12.selected = false
    treat12.sortingIndex = 0
    
    let treat13 = Treat(context: context)
    treat13.category = treatsArray[10]
    treat13.title = "Popcorn"
    treat13.url = "https://pin.it/ucx26xitl5tpvt"
    treat13.favorite = true
    treat13.order = 13
    treat13.random = Int64(arc4random_uniform(1000))
    treat13.selected = false
    treat13.sortingIndex = 0
    
    ad.saveContext()
}

