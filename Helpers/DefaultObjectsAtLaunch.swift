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
        getAllTasks()
        addToOpenedCounter()
        getMembersAttending()
        getEnabledTasks()
        getTaskPrayer()
        getTaskSong()
        getTaskRule()
        getTaskScripture()
        getTaskCalendar()
        getTaskTestimony()
        getTaskSpotlight()
        getTaskThought()
        getTaskQuote()
        getTaskLessons()
        getTaskCouncil()
        getTaskGame()
        getTaskTreat()
        getSongs()
    } else {
        print("First launch, setting UserDefault.")
        beginOpenedCounter()
        generateFamilyMembers()
        generateTasks()
        generatePray()
        generateSongs()
        generateRules()
        generateScripture()
        generateCalendar()
        generateTestimony()
        generateSpotlight()
        generateThought()
        generateQuotes()
        generateLessons()
        generateCouncils()
        generateGames()
        generateTreats()
        getAllTasks()
        getMembersAttending()
        getEnabledTasks()
        getTaskPrayer()
        getTaskSong()
        getTaskRule()
        getTaskScripture()
        getTaskCalendar()
        getTaskTestimony()
        getTaskSpotlight()
        getTaskThought()
        getTaskQuote()
        getTaskLessons()
        getTaskCouncil()
        getTaskGame()
        getTaskTreat()
        getSongs()
        UserDefaults.standard.set(true, forKey: "launchedBefore")
    }
}

func addToOpenedCounter() {
    let fetchRequest: NSFetchRequest<Counter> = Counter.fetchRequest()

    do {
        counterArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
    
    if counter.launched > 0 {
        counter.launched += 1
        
        if counter.launched % 4 == 0 {
            counter.tipGiven = false
            ad.saveContext()
        }
        if counter.launched % 4 == 0 {
            counter.shared = false
            ad.saveContext()
        }
        if counter.launched % 4 == 0 {
            counter.feedbackGiven = false
            ad.saveContext()
        }
        
        counter.hideFeedbackRequest = false
        counter.hideSharedRequest = false
        counter.hideAboutMe = false
        ad.saveContext()
        print("\(counter.launched)")
    }
}

func beginOpenedCounter(){
    let counter = Counter(context: context)
    counter.launched = 1
    counter.hideAboutMe = false
    counter.hideSharedRequest = false
    counter.hideFeedbackRequest = false
    
    counter.feedbackGiven = false
    counter.shared = false
    counter.tipGiven = false
    
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
    getMembersAttending()
    let taskOpenPrayer = Task(context: context)
    taskOpenPrayer.assigned = false
    let assigneetaskOpenPrayer = membersAttendingArray[0]
    taskOpenPrayer.assignment = assigneetaskOpenPrayer
    taskOpenPrayer.defaultNumber = 1
    taskOpenPrayer.enabled = true
    taskOpenPrayer.name = "Opening Prayer"
    taskOpenPrayer.order = Int64(arc4random_uniform(100))
    taskOpenPrayer.segment = 0
    taskOpenPrayer.image = #imageLiteral(resourceName: "Prayer")
    
    let taskSongs = Task(context: context)
    taskSongs.assigned = false
    let assigneetaskSongs = membersAttendingArray[1]
    taskSongs.assignment = assigneetaskSongs
    taskSongs.defaultNumber = 2
    taskSongs.enabled = true
    taskSongs.name = "Song"
    taskSongs.order = Int64(arc4random_uniform(100))
    taskSongs.segment = 0
    taskSongs.image = #imageLiteral(resourceName: "Song")
    
    let taskRule = Task(context: context)
    taskRule.assigned = false
    let assigneetaskRule = membersAttendingArray[0]
    taskRule.assignment = assigneetaskRule
    taskRule.defaultNumber = 3
    taskRule.enabled = false
    taskRule.name = "Rule"
    taskRule.order = Int64(arc4random_uniform(100))
    taskRule.segment = 0
    taskRule.image = #imageLiteral(resourceName: "Rule")
    
    let taskScripture = Task(context: context)
    taskScripture.assigned = false
    let assigneetaskScripture = membersAttendingArray[2]
    taskScripture.assignment = assigneetaskScripture
    taskScripture.defaultNumber = 4
    taskScripture.enabled = true
    taskScripture.name = "Scripture"
    taskScripture.order = Int64(arc4random_uniform(100))
    taskScripture.segment = 0
    taskScripture.image = #imageLiteral(resourceName: "Scripture")
    
    let taskCalendar = Task(context: context)
    taskCalendar.assigned = false
    let assigneetaskCalendar = membersAttendingArray[0]
    taskCalendar.assignment = assigneetaskCalendar
    taskCalendar.defaultNumber = 5
    taskCalendar.enabled = false
    taskCalendar.name = "Calendar"
    taskCalendar.order = Int64(arc4random_uniform(100))
    taskCalendar.segment = 0
    taskCalendar.image = #imageLiteral(resourceName: "Calendar")
    
    let taskTestimony = Task(context: context)
    taskTestimony.assigned = false
    let assigneetaskTestimony = membersAttendingArray[0]
    taskTestimony.assignment = assigneetaskTestimony
    taskTestimony.defaultNumber = 6
    taskTestimony.enabled = false
    taskTestimony.name = "Testimony"
    taskTestimony.order = Int64(arc4random_uniform(100))
    taskTestimony.segment = 0
    taskTestimony.image = #imageLiteral(resourceName: "Favorite")
    
    let taskSpotlight = Task(context: context)
    taskSpotlight.assigned = false
    let assigneetaskSpotlight = membersAttendingArray[0]
    taskSpotlight.assignment = assigneetaskSpotlight
    taskSpotlight.defaultNumber = 7
    taskSpotlight.enabled = false
    taskSpotlight.name = "Spotlight"
    taskSpotlight.order = Int64(arc4random_uniform(100))
    taskSpotlight.segment = 0
    taskSpotlight.image = #imageLiteral(resourceName: "Spotlight")
    
    let taskThought = Task(context: context)
    taskThought.assigned = false
    let assigneetaskThought = membersAttendingArray[0]
    taskThought.assignment = assigneetaskThought
    taskThought.defaultNumber = 8
    taskThought.enabled = false
    taskThought.name = "Thought"
    taskThought.order = Int64(arc4random_uniform(100))
    taskThought.segment = 0
    taskThought.image = #imageLiteral(resourceName: "Thought")
    
    let taskQuote = Task(context: context)
    taskQuote.assigned = false
    let assigneetaskQuote = membersAttendingArray[0]
    taskQuote.assignment = assigneetaskQuote
    taskQuote.defaultNumber = 9
    taskQuote.enabled = false
    taskQuote.name = "Quote"
    taskQuote.order = Int64(arc4random_uniform(100))
    taskQuote.segment = 0
    taskQuote.image = #imageLiteral(resourceName: "Quote")
    
    let taskLesson = Task(context: context)
    taskLesson.assigned = false
    let assigneetaskLesson = membersAttendingArray[3]
    taskLesson.assignment = assigneetaskLesson
    taskLesson.defaultNumber = 10
    taskLesson.enabled = true
    taskLesson.name = "Lesson"
    taskLesson.order = Int64(arc4random_uniform(100))
    taskLesson.segment = 0
    taskLesson.image = #imageLiteral(resourceName: "Lesson")
    
    let taskCouncil = Task(context: context)
    taskCouncil.assigned = false
    let assigneetaskCouncil = membersAttendingArray[0]
    taskCouncil.assignment = assigneetaskCouncil
    taskCouncil.defaultNumber = 11
    taskCouncil.enabled = false
    taskCouncil.name = "Council"
    taskCouncil.order = Int64(arc4random_uniform(100))
    taskCouncil.segment = 0
    taskCouncil.image = #imageLiteral(resourceName: "Council")
    
    let taskGame = Task(context: context)
    taskGame.assigned = false
    let assigneetaskGame = membersAttendingArray[4]
    taskGame.assignment = assigneetaskGame
    taskGame.defaultNumber = 12
    taskGame.enabled = true
    taskGame.name = "Activity"
    taskGame.order = Int64(arc4random_uniform(100))
    taskGame.segment = 0
    taskGame.image = #imageLiteral(resourceName: "Game")
    
    let taskClosePrayer = Task(context: context)
    taskClosePrayer.assigned = false
    let assigneetaskClosePrayer = membersAttendingArray[5]
    taskClosePrayer.assignment = assigneetaskClosePrayer
    taskClosePrayer.defaultNumber = 13
    taskClosePrayer.enabled = true
    taskClosePrayer.name = "Closing Prayer"
    taskClosePrayer.order = Int64(arc4random_uniform(100))
    taskClosePrayer.segment = 0
    taskClosePrayer.image = #imageLiteral(resourceName: "Prayer")
    
    let taskTreat = Task(context: context)
    taskTreat.assigned = false
    let assigneetaskTreat = membersAttendingArray[0]
    taskTreat.assignment = assigneetaskTreat
    taskTreat.defaultNumber = 14
    taskTreat.enabled = true
    taskTreat.name = "Treat"
    taskTreat.order = Int64(arc4random_uniform(100))
    taskTreat.segment = 0
    taskTreat.image = #imageLiteral(resourceName: "Treat")
    
    ad.saveContext()
}

func generatePray() {
    getAllTasks()
    let prayer = Prayer(context: context)
    prayer.title = "Steps To Prayer"
    prayer.detail = "1. Address Heavenly Father\n2. Share Gratitude\n3. Ask for needs\n4. Close in Jesus Christ's name"
    prayer.selected = true
    prayer.selectedOne = taskPrayer
    
    ad.saveContext()
}

func generateSongs() {
    getAllTasks()
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
    song56.selectedOne = taskSong
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
    song85.title = "I Am Like a Star"
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
    song104.topic = "Spiritual"
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
    song105.topic = "Spiritual"
    song105.selected = false
    song105.favorite = false
    song105.sortingIndex = 0
    
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
    
    ad.saveContext()
}

func generateRules() {
    getAllTasks()
    let rule1 = Rule(context: context)
    rule1.title = "Media"
    rule1.detail = "“The media's the most powerful entity on earth. They have the power to make the innocent guilty and to make the guilty innocent, and that's power. Because they control the minds of the masses.”\n\n- Malcolm X"
    rule1.url = "https://drive.google.com/open?id=1U6DIUWVNML50SgX4p6mdkBrrKcXpdGIE"
    rule1.order = 1
    rule1.random = Int64(arc4random_uniform(1000))
    rule1.selected = true
    rule1.sortingIndex = 0
    rule1.selectedOne = taskRule
    
    let rule2 = Rule(context: context)
    rule2.title = "Respect Others"
    rule2.detail = "We believe in the golden rule.\n“Do unto others as you would have them do unto you.”\n\n- Matt. 7:12"
    rule2.url = "https://drive.google.com/open?id=1zuUzKcEdZS7ZjZh5mKhQWWFPPw77_AaV"
    rule2.order = 2
    rule2.random = Int64(arc4random_uniform(1000))
    rule2.selected = false
    rule2.sortingIndex = 0
    
    let rule3 = Rule(context: context)
    rule3.title = "Respect Belongings"
    rule3.detail = "As you get older you start to see who was raised properly. So many people lack basic respect."
    rule3.url = "https://drive.google.com/open?id=1BbDSMAKExvlt2o_NoyN81lbD4imwlW5I"
    rule3.order = 3
    rule3.random = Int64(arc4random_uniform(1000))
    rule3.selected = false
    rule3.sortingIndex = 0
    
    let rule4 = Rule(context: context)
    rule4.title = "Table Manners"
    rule4.detail = "“I profoundly believe it takes a lot of ignorance to become a moral slob.”\n\n- William Buckley Jr."
    rule4.url = "https://drive.google.com/open?id=1nwcCCDRogdtmRvmdXAcfYBZFBDcaUgFt"
    rule4.order = 4
    rule4.random = Int64(arc4random_uniform(1000))
    rule4.selected = false
    rule4.sortingIndex = 0
    
    let rule5 = Rule(context: context)
    rule5.title = "Morning Routine"
    rule5.detail = "Yesterday is gone. Tomorrow is a mystery. Today is a blessing!"
    rule5.url = "https://drive.google.com/open?id=1US9Zd604Ldqekde1eoQJbwQQji3LDqJM"
    rule5.order = 7
    rule5.random = Int64(arc4random_uniform(1000))
    rule5.selected = false
    rule5.sortingIndex = 0
    
    let rule6 = Rule(context: context)
    rule6.title = "After School Routine"
    rule6.detail = "Never stop learning, because life never stops teaching."
    rule6.url = "https://drive.google.com/open?id=1Nb1AUCeZCMt8Em6f2LVSIzTJt776aLQl"
    rule6.order = 5
    rule6.random = Int64(arc4random_uniform(1000))
    rule6.selected = false
    rule6.sortingIndex = 0
    
    let rule7 = Rule(context: context)
    rule7.title = "Bedtime Routine"
    rule7.detail = "Go to be with dreams. Wake up with plans."
    rule7.url = "https://drive.google.com/open?id=1VhCDrnKvr_w4nv3tvZQnmXJMtAJzOphd"
    rule7.order = 6
    rule7.random = Int64(arc4random_uniform(1000))
    rule7.selected = false
    rule7.sortingIndex = 0
    
    let rule8 = Rule(context: context)
    rule8.title = "House Chores"
    rule8.detail = "“May we ever choose the harder right instead of the easier wrong.”\n\n- Thomas S. Monson"
    rule8.url = "https://drive.google.com/open?id=1dkwWTrKC88OoZwZ5KOlK-b3TY63gsZDa"
    rule8.order = 8
    rule8.random = Int64(arc4random_uniform(1000))
    rule8.selected = false
    rule8.sortingIndex = 0
    
    let rule9 = Rule(context: context)
    rule9.title = "FHE & HT Expectations"
    rule9.detail = "Human behavior flows from three main sources: desire (spirit), emotion (body), knowledge (mind)."
    rule9.url = "https://drive.google.com/open?id=1xJay1xQw_Yaq8mgcGPe4An-p6NC2PsQl"
    rule9.order = 9
    rule9.random = Int64(arc4random_uniform(1000))
    rule9.selected = false
    rule9.sortingIndex = 0
    
    let rule10 = Rule(context: context)
    rule10.title = "Church Guidelines"
    rule10.detail = "Feed your faith and your fears will starve to death."
    rule10.url = "https://drive.google.com/open?id=11aT0cKTF2IG9DqIXEpv2m7C6suddK-zE"
    rule10.order = 10
    rule10.random = Int64(arc4random_uniform(1000))
    rule10.selected = false
    rule10.sortingIndex = 0
    
    let rule11 = Rule(context: context)
    rule11.title = "Sunday Behavior"
    rule11.detail = "“Living in the moment brings you a sense of reverance for all of life's blessings.”\n\n- Oprah Winfrey"
    rule11.url = "https://drive.google.com/open?id=1BPMKRTIbwZEqgXvK9CmUMjinBgKLrV2d"
    rule11.order = 10
    rule11.random = Int64(arc4random_uniform(1000))
    rule11.selected = false
    rule11.sortingIndex = 0
    
    ad.saveContext()
}

func generateScripture() {
    getAllTasks()
    let scripture1 = Scripture(context: context)
    scripture1.topic = lessonTopicsArray[0]
    scripture1.volume = "bofm"
    scripture1.book = "1-ne"
    scripture1.chapter = "3"
    scripture1.verse = "7"
    scripture1.title = "The Lord Prepares A Way"
    scripture1.favorite = true
    scripture1.order = 1
    scripture1.random = Int64(arc4random_uniform(1000))
    scripture1.selected = true
    scripture1.sortingIndex = 0
    scripture1.selectedOne = taskScripture
    
    let scripture2 = Scripture(context: context)
    scripture2.topic = lessonTopicsArray[0]
    scripture2.volume = "bofm"
    scripture2.book = "2-ne"
    scripture2.chapter = "2"
    scripture2.verse = "22-25"
    scripture2.title = "Adam Fell That Men Might Be"
    scripture2.favorite = false
    scripture2.order = 2
    scripture2.random = Int64(arc4random_uniform(1000))
    scripture2.selected = false
    scripture2.sortingIndex = 0
    
    ad.saveContext()
}

func generateCalendar() {
    getAllTasks()
    let calendar = Calendar(context: context)
    calendar.selectedOne = taskCalendar
    calendar.title = "Planning Meeting"
    calendar.detail = "Upcoming events:\n\n1. Activities\n2. Birthdays / Holidays\n3. Traveling / Vacations\n4. Family dinners"
    calendar.selected = true
    
    ad.saveContext()
}

func generateTestimony() {
    getAllTasks()
    let testimony = Testimony(context: context)
    testimony.selectedOne = taskTestimony
    testimony.title = "I have a testimony that..."
    testimony.detail = "1. Heavenly Father lives and loves His children. I am a child of God.\n2. Jesus Christ lives, that He is the Son of God, and that He carried out the infinite Atonement.\n3. Joseph Smith is the prophet of God who was called to restore the Gospel.\n4. The Church of Jesus Christ of Latter-day Saints is the Savior's true Church on the earth.\n5. The Church is led by a living prophet today.\n6. The Book of Mormon is another testiment of Jesus Christ.\n7. A testimony is a spiritual witness given by the Holy Ghost.\n8. A testimony grows to include all principles of the Gospel."
    testimony.selected = true
    
    ad.saveContext()
}

func generateSpotlight() {
    getAllTasks()
    let spotlight = Spotlight(context: context)
    spotlight.selectedOne = taskSpotlight
    spotlight.title = "Affirmations"
    spotlight.detail = "We've noticed something you did in one of the following ways of life:\n\n1. Emotional\n2. Financial\n3. Intellectual\n4. Social\n5. Occupational\n6. Physical\n7. Environmental\n8. Spiritual"
    spotlight.selected = true
    
    ad.saveContext()
}

func generateThought() {
    getAllTasks()
    let thought = Thought(context: context)
    thought.selectedOne = taskThought
    thought.title = "Tell me something I don't know..."
    thought.detail = "While knowledge is orderly and cumulative, information is random and miscellaneous."
    thought.url = "https://www.mormonchannel.org/watch/series/mormon-channel-studio/mormon-channel-studio-nashville-tribute-band"
    thought.selected = true
    
    ad.saveContext()
}

func generateQuotes() {
    getAllTasks()
    let quote1 = Quote(context: context)
    quote1.selectedOne = taskQuote
    quote1.title = "Christlike"
    quote1.detail = "“If thoughts make us who we are and we are to be like Christ then we must think Christlike thoughts.”\n\n- Ezra Taft Benson"
    quote1.url = "https://www.lds.org/ensign/1984/04/think-on-christ?lang=eng"
    quote1.order = 1
    quote1.favorite = false
    quote1.random = Int64(arc4random_uniform(1000))
    quote1.selected = true
    quote1.sortingIndex = 0
    
    let quote2 = Quote(context: context)
    quote2.title = "Faith vs. Fear"
    quote2.detail = "“Live by Faith and not by Fear.”\n\n- Quentin L. Cook"
    quote2.url = "https://www.lds.org/general-conference/2007/10/live-by-faith-and-not-by-fear?lang=eng"
    quote2.order = 2
    quote2.favorite = false
    quote2.random = Int64(arc4random_uniform(1000))
    quote2.selected = false
    quote2.sortingIndex = 0
    
    let quote3 = Quote(context: context)
    quote3.title = "A Pattern in All Things"
    quote3.detail = "“God gives us difficulties to bring out the best in us.”\n\n- Marvin J. Ashton"
    quote3.url = "https://www.lds.org/general-conference/1990/10/a-pattern-in-all-things?lang=eng"
    quote3.order = 3
    quote3.favorite = false
    quote3.random = Int64(arc4random_uniform(1000))
    quote3.selected = false
    quote3.sortingIndex = 0
    
    let quote4 = Quote(context: context)
    quote4.title = "An Attitude of Gratitude"
    quote4.detail = "“Refuse to remain in the realm of negative thought and cultivate within our hearts an attitude of gratitude.”\n\n- Thomas S. Monson"
    quote4.url = "https://www.lds.org/general-conference/1992/04/an-attitude-of-gratitude?lang=eng"
    quote4.order = 4
    quote4.favorite = true
    quote4.random = Int64(arc4random_uniform(1000))
    quote4.selected = false
    quote4.sortingIndex = 0
    
    let quote5 = Quote(context: context)
    quote5.title = "Prayer"
    quote5.detail = "“If Life Gets Too Hard To Stand, Kneel.”\n\n- Gordon B. Hinckley"
    quote5.url = "https://www.lds.org/general-conference/1996/10/women-of-the-church?lang=eng"
    quote5.order = 5
    quote5.favorite = true
    quote5.random = Int64(arc4random_uniform(1000))
    quote5.selected = false
    quote5.sortingIndex = 0
    
    let quote6 = Quote(context: context)
    quote6.title = "Live Up to Your Inheritance"
    quote6.detail = "“You have not failed until you quit trying.”\n\n- Gordon B. Hinckley"
    quote6.url = "https://www.lds.org/general-conference/1983/10/live-up-to-your-inheritance?lang=eng"
    quote6.order = 6
    quote6.favorite = false
    quote6.random = Int64(arc4random_uniform(1000))
    quote6.selected = false
    quote6.sortingIndex = 0
    
    let quote7 = Quote(context: context)
    quote7.title = "Come, Join with Us"
    quote7.detail = "“First doubt your doubts before you doubt your faith.”\n\n- Dieter F. Uchtdorf"
    quote7.url = "https://www.lds.org/general-conference/2013/10/come-join-with-us?lang=eng"
    quote7.order = 7
    quote7.favorite = true
    quote7.random = Int64(arc4random_uniform(1000))
    quote7.selected = false
    quote7.sortingIndex = 0
    
    let quote8 = Quote(context: context)
    quote8.title = "Choices"
    quote8.detail = "“May we ever choose the harder right instead of the easier wrong.”\n\n- Thomas S. Monson"
    quote8.url = "https://www.lds.org/general-conference/2016/04/choices?lang=eng"
    quote8.order = 8
    quote8.favorite = true
    quote8.random = Int64(arc4random_uniform(1000))
    quote8.selected = false
    quote8.sortingIndex = 0
    
    let quote9 = Quote(context: context)
    quote9.title = "Lest Ye Be Wearied and Faint in Your Minds"
    quote9.detail = "“Faith also includes trust in God’s timing.”\n\n- Neal A. Maxwell"
    quote9.url = "https://www.lds.org/general-conference/1991/04/lest-ye-be-wearied-and-faint-in-your-minds?lang=eng"
    quote9.order = 9
    quote9.favorite = false
    quote9.random = Int64(arc4random_uniform(1000))
    quote9.selected = false
    quote9.sortingIndex = 0
    
    let quote10 = Quote(context: context)
    quote10.title = "Your Happily Ever After"
    quote10.detail = "“You may feel that no one can understand the depth of your despair, our Savior, Jesus Christ, understands.”\n\n- Dieter F. Uchtdorf"
    quote10.url = "https://www.lds.org/general-conference/2010/04/your-happily-ever-after?lang=eng"
    quote10.order = 10
    quote10.favorite = false
    quote10.random = Int64(arc4random_uniform(1000))
    quote10.selected = false
    quote10.sortingIndex = 0
    
    let quote11 = Quote(context: context)
    quote11.title = "Within the Clasp of Your Arms"
    quote11.detail = "“Keep trying, keep reaching, keep talking, keep praying—but never give up.”\n\n- Jeffrey R. Holland"
    quote11.url = "https://www.lds.org/general-conference/1983/04/within-the-clasp-of-your-arms?lang=eng"
    quote11.order = 11
    quote11.favorite = false
    quote11.random = Int64(arc4random_uniform(1000))
    quote11.selected = false
    quote11.sortingIndex = 0
    
    let quote12 = Quote(context: context)
    quote12.title = "Lord, I Believe"
    quote12.detail = "“Lord, I believe; help thou mine unbelief.”\n\n- Elder Jeffrey R. Holland"
    quote12.url = "https://www.lds.org/general-conference/2013/04/lord-i-believe?lang=eng"
    quote12.order = 12
    quote12.favorite = true
    quote12.random = Int64(arc4random_uniform(1000))
    quote12.selected = false
    quote12.sortingIndex = 0
    
    let quote13 = Quote(context: context)
    quote13.title = "Preserving the Heart’s Mighty Change"
    quote13.detail = "“To endure to the end, we need to be eager to please God and worship Him with fervor.”\n\n- Dale G. Renlund"
    quote13.url = "https://www.lds.org/general-conference/1983/04/within-the-clasp-of-your-arms?lang=eng"
    quote13.order = 13
    quote13.favorite = false
    quote13.random = Int64(arc4random_uniform(1000))
    quote13.selected = false
    quote13.sortingIndex = 0
    
    ad.saveContext()
}

func generateLessons() {
    getAllTasks()
    let lesson2 = Lesson(context: context)
    lesson2.selectedOne = taskLesson
    lesson2.category = "Spiritual"
    lesson2.topic = "Plan of Salvation"
    lesson2.title = "Our Eternal Life"
    lesson2.detail = "Members of The Church of Jesus Christ of Latter-day Saints (Mormons) believe that we are eternal beings, sons and daughters of our Heavenly Father and Jesus Chris is our Savior."
    lesson2.url = "https://www.youtube.com/watch?v=9MiF_HKoFr4"
    lesson2.youTubeVideo = true
    lesson2.order = 2
    lesson2.favorite = true
    lesson2.random = Int64(arc4random_uniform(1000))
    lesson2.selected = true
    lesson2.sortingIndex = 0
    
    let lesson3 = Lesson(context: context)
    lesson3.category = "Temporal"
    lesson3.topic = "Emotional"
    lesson3.title = "Meditation"
    lesson3.detail = "Basic steps on how to meditate."
    lesson3.url = "https://www.wikihow.com/Meditate"
    lesson3.youTubeVideo = false
    lesson3.order = 3
    lesson3.favorite = true
    lesson3.random = Int64(arc4random_uniform(1000))
    lesson3.selected = false
    lesson3.sortingIndex = 0
    
    let lesson4 = Lesson(context: context)
    lesson4.category = "Temporal"
    lesson4.topic = "Financial"
    lesson4.title = "7 Baby Steps to Financial Peace"
    lesson4.detail = "Baby Step 1: $1,000 cash in a beginner emergency fund\nBaby Step 2: Use the debt snowball to pay off all your debt but the house\nBaby Step 3: A fully funded emergency fund of 3 to 6 months of expenses\nBaby Step 4: Invest 15% of your household income into retirement\nBaby Step 5: Start saving for college\nBaby Step 6: Pay off your home early\nBaby Step 7: Build wealth and give generously"
    lesson4.url = "https://www.daveramsey.com/baby-steps/?ectid=30.31.13181&gclid=CjwKCAiA9rjRBRAeEiwA2SV4ZW6QF6enSOGt5f5lC2mFQN8UoKfxSfCT3KWtDt9oT7kIQwzZSfPxCxoCTlUQAvD_BwE"
    lesson4.youTubeVideo = false
    lesson4.order = 4
    lesson4.favorite = false
    lesson4.random = Int64(arc4random_uniform(1000))
    lesson4.selected = false
    lesson4.sortingIndex = 0
    
    let lesson5 = Lesson(context: context)
    lesson5.category = "Temporal"
    lesson5.topic = "Intellectual"
    lesson5.title = "Education Creates Opportunities"
    lesson5.detail = "Education opens the door, while experience gets you through the door."
    lesson5.url = "https://www.youtube.com/watch?v=AMbR-jATgWs"
    lesson5.youTubeVideo = true
    lesson5.order = 5
    lesson5.favorite = false
    lesson5.random = Int64(arc4random_uniform(1000))
    lesson5.selected = false
    lesson5.sortingIndex = 0
    
    let lesson6 = Lesson(context: context)
    lesson6.category = "Temporal"
    lesson6.topic = "Relational/Social"
    lesson6.title = "Connection"
    lesson6.detail = "Brené Brown on Empathy"
    lesson6.url = "https://www.youtube.com/watch?v=1Evwgu369Jw"
    lesson6.youTubeVideo = true
    lesson6.order = 6
    lesson6.favorite = true
    lesson6.random = Int64(arc4random_uniform(1000))
    lesson6.selected = false
    lesson6.sortingIndex = 0
    
    let lesson7 = Lesson(context: context)
    lesson7.category = "Temporal"
    lesson7.topic = "Spiritual"
    lesson7.title = "What Matters Most in Life?"
    lesson7.detail = "Does money, love, work, intelligence, or athleticism define you or make you happy? No.\nLiving in a way that is congruent to your core values not only define you but bring you happiness.\n\n- Rylan Evans"
    lesson7.url = "https://www.youtube.com/watch?v=Lg-wNxJ5XxY&t"
    lesson7.youTubeVideo = true
    lesson7.order = 7
    lesson7.favorite = true
    lesson7.random = Int64(arc4random_uniform(1000))
    lesson7.selected = false
    lesson7.sortingIndex = 0
    
    let lesson8 = Lesson(context: context)
    lesson8.category = "Temporal"
    lesson8.topic = "Physical"
    lesson8.title = "Health"
    lesson8.detail = "Living healthy is mainly controling your input and output. Put simply, it's the food you eat and the excerise you do. The food you input is more impactful."
    lesson8.url = "https://www.youtube.com/watch?v=ztiHRiFXtoc"
    lesson8.youTubeVideo = true
    lesson8.order = 8
    lesson8.favorite = false
    lesson8.random = Int64(arc4random_uniform(1000))
    lesson8.selected = false
    lesson8.sortingIndex = 0
    
    let lesson9 = Lesson(context: context)
    lesson9.category = "Temporal"
    lesson9.topic = "Environmental"
    lesson9.title = "Change Your Environment"
    lesson9.detail = "Environment = the surroundings or conditions in which a person lives or operates.\nChange through changing yourself first."
    lesson9.url = "https://youtu.be/Rhx5MnQj008?t=1m26s"
    lesson9.youTubeVideo = false
    lesson9.order = 9
    lesson9.favorite = false
    lesson9.random = Int64(arc4random_uniform(1000))
    lesson9.selected = false
    lesson9.sortingIndex = 0
    
    let lesson10 = Lesson(context: context)
    lesson10.category = "Spiritual"
    lesson10.topic = "Jesus Christ"
    lesson10.title = "Lord I Believe"
    lesson10.detail = "I am not asking you to pretend to have faith you don't have. I am asking you to be true to the faith you do have.\n\n- Elder Holland"
    lesson10.url = "https://www.lds.org/general-conference/2013/04/lord-i-believe?lang=eng"
    lesson10.youTubeVideo = false
    lesson10.order = 10
    lesson10.favorite = true
    lesson10.random = Int64(arc4random_uniform(1000))
    lesson10.selected = false
    lesson10.sortingIndex = 0
    
    let lesson11 = Lesson(context: context)
    lesson11.category = "Temporal"
    lesson11.topic = "Occupational"
    lesson11.title = "Work vs. Dreams"
    lesson11.detail = "Follow your passion? Never give up on your dreams?\nPassion does not equal ability. Instead, have fun with your passion and follow your opportunities."
    lesson11.url = "https://www.youtube.com/watch?v=CVEuPmVAb8o"
    lesson11.youTubeVideo = true
    lesson11.order = 10
    lesson11.favorite = false
    lesson11.random = Int64(arc4random_uniform(1000))
    lesson11.selected = false
    lesson11.sortingIndex = 0
    
    let lesson12 = Lesson(context: context)
    lesson12.category = "Spiritual"
    lesson12.topic = "Care for the Poor & Needy"
    lesson12.title = "Helping Others"
    lesson12.detail = "In order to serve someone you have to be secure yourself."
    lesson12.url = "https://www.youtube.com/watch?v=6aFXY01VXzg"
    lesson12.youTubeVideo = true
    lesson12.order = 9
    lesson12.favorite = false
    lesson12.random = Int64(arc4random_uniform(1000))
    lesson12.selected = false
    lesson12.sortingIndex = 0
    
    let lesson13 = Lesson(context: context)
    lesson13.category = "Temporal"
    lesson13.topic = "Relational/Social"
    lesson13.title = "Relationships"
    lesson13.detail = "Advice on relationships and how to treat others."
    lesson13.url = "https://www.youtube.com/playlist?list=PLtY1iLdia2RzjB12TXR7OuQYr6CYDS37b"
    lesson13.youTubeVideo = false
    lesson13.order = 9
    lesson13.favorite = false
    lesson13.random = Int64(arc4random_uniform(1000))
    lesson13.selected = false
    lesson13.sortingIndex = 0
    
    let lesson14 = Lesson(context: context)
    lesson14.category = "Temporal"
    lesson14.topic = "Spiritual"
    lesson14.title = "Motivational"
    lesson14.detail = "Inspiration from Prince EA."
    lesson14.url = "https://www.youtube.com/playlist?list=PLtY1iLdia2RygWmqtjHGYm9P3Lz8HHhma"
    lesson14.youTubeVideo = false
    lesson14.order = 9
    lesson14.favorite = false
    lesson14.random = Int64(arc4random_uniform(1000))
    lesson14.selected = false
    lesson14.sortingIndex = 0
    
    let lesson15 = Lesson(context: context)
    lesson15.category = "Temporal"
    lesson15.topic = "Occupational"
    lesson15.title = "A Fisherman"
    lesson15.detail = "The Fisherman vs The Industrialist"
    lesson15.url = "https://www.youtube.com/watch?v=2atNgJ6W4N0"
    lesson15.youTubeVideo = true
    lesson15.order = 9
    lesson15.favorite = false
    lesson15.random = Int64(arc4random_uniform(1000))
    lesson15.selected = false
    lesson15.sortingIndex = 0
    
    let lesson16 = Lesson(context: context)
    lesson16.category = "Temporal"
    lesson16.topic = "Relational/Social"
    lesson16.title = "Race and Humanity"
    lesson16.detail = "What race are you?"
    lesson16.url = "https://www.youtube.com/watch?v=TPPNcmP-9mQ"
    lesson16.youTubeVideo = true
    lesson16.order = 9
    lesson16.favorite = false
    lesson16.random = Int64(arc4random_uniform(1000))
    lesson16.selected = false
    lesson16.sortingIndex = 0
    
    let lesson17 = Lesson(context: context)
    lesson17.category = "Temporal"
    lesson17.topic = "Spiritual"
    lesson17.title = "If There Is No God, Murder Isn't Wrong"
    lesson17.detail = "You may think it's wrong, but how do you know it's wrong?"
    lesson17.url = "https://www.youtube.com/watch?v=yrcQ_PTkVD4"
    lesson17.youTubeVideo = true
    lesson17.order = 9
    lesson17.favorite = true
    lesson17.random = Int64(arc4random_uniform(1000))
    lesson17.selected = false
    lesson17.sortingIndex = 0
    
    let lesson18 = Lesson(context: context)
    lesson18.category = "Spiritual"
    lesson18.topic = "Holy Ghost"
    lesson18.title = "Voice of the Spirit"
    lesson18.detail = "In a world full of noise and many voices, President James E. Faust invites us to listen to and follow the voice of the Spirit, which is calm and quiet and leads to eternal life."
    lesson18.url = "https://www.youtube.com/watch?v=VPbDZnrxBLM&t"
    lesson18.youTubeVideo = true
    lesson18.order = 9
    lesson18.favorite = false
    lesson18.random = Int64(arc4random_uniform(1000))
    lesson18.selected = false
    lesson18.sortingIndex = 0
    
    let lesson19 = Lesson(context: context)
    lesson19.category = lessonCategoryArray[0]
    lesson19.topic = "Spiritual"
    lesson19.title = "Spiritual Whirlwinds"
    lesson19.detail = "Don’t let the whirlwinds drag you down. These are your days—to stand strong as disciples of the Lord Jesus Christ."
    lesson19.url = "https://www.youtube.com/watch?v=DzWXSz9hlxw"
    lesson19.youTubeVideo = true
    lesson19.order = 9
    lesson19.favorite = false
    lesson19.random = Int64(arc4random_uniform(1000))
    lesson19.selected = false
    lesson19.sortingIndex = 0
    
    let lesson20 = Lesson(context: context)
    lesson20.category = lessonCategoryArray[0]
    lesson20.topic = "Heavenly Father"
    lesson20.title = "The Will of God"
    lesson20.detail = "God uses love-inspired correction to guide us to a future we do not or cannot now envision but which He knows is the better way for us."
    lesson20.url = "https://www.youtube.com/watch?v=Rr8xvw0cgw0"
    lesson20.youTubeVideo = true
    lesson20.order = 9
    lesson20.favorite = false
    lesson20.random = Int64(arc4random_uniform(1000))
    lesson20.selected = false
    lesson20.sortingIndex = 0
    
    let lesson21 = Lesson(context: context)
    lesson21.category = "Temporal"
    lesson21.topic = "Emotional"
    lesson21.title = "Is Your Child Getting Enough Vitamin N?"
    lesson21.detail = "If you're a parent, is your child getting enough Vitamin N?"
    lesson21.url = "https://www.youtube.com/watch?v=j3cgUhtRUbE"
    lesson21.youTubeVideo = true
    lesson21.order = 9
    lesson21.favorite = false
    lesson21.random = Int64(arc4random_uniform(1000))
    lesson21.selected = false
    lesson21.sortingIndex = 0
    
    let lesson22 = Lesson(context: context)
    lesson22.category = lessonCategoryArray[0]
    lesson22.topic = "Endure to the end"
    lesson22.title = "Living with Depression"
    lesson22.detail = "“I remember kneeling by my bed and just asking the Savior, 'Where have you been? Why weren’t you there in those moments when I needed you?'”"
    lesson22.url = "https://www.youtube.com/watch?v=7hPZQDeo0Jw"
    lesson22.youTubeVideo = true
    lesson22.order = 9
    lesson22.favorite = false
    lesson22.random = Int64(arc4random_uniform(1000))
    lesson22.selected = false
    lesson22.sortingIndex = 0
    
    let lesson23 = Lesson(context: context)
    lesson23.category = lessonCategoryArray[0]
    lesson23.topic = "Jesus Christ"
    lesson23.title = "The Savior Understands Me"
    lesson23.detail = "Encouragement to members to extend the hand of fellowship to others, regardless of perceived differences."
    lesson23.url = "https://www.youtube.com/watch?v=EUhgBU3coPY"
    lesson23.youTubeVideo = true
    lesson23.order = 9
    lesson23.favorite = true
    lesson23.random = Int64(arc4random_uniform(1000))
    lesson23.selected = false
    lesson23.sortingIndex = 0
    
    let lesson24 = Lesson(context: context)
    lesson24.category = lessonCategoryArray[0]
    lesson24.topic = "Christlike Attributes"
    lesson24.title = "Deep Beauty"
    lesson24.detail = "Sister Elaine S. Dalton tells of how she learned as a young woman what true beauty means. As a young woman, you were born to be a queen."
    lesson24.url = "https://www.youtube.com/watch?v=_Jk4tpPGu_M"
    lesson24.youTubeVideo = true
    lesson24.order = 9
    lesson24.favorite = false
    lesson24.random = Int64(arc4random_uniform(1000))
    lesson24.selected = false
    lesson24.sortingIndex = 0
    
    let lesson25 = Lesson(context: context)
    lesson25.category = lessonCategoryArray[0]
    lesson25.topic = "Atonement"
    lesson25.title = "The Perfect Lie"
    lesson25.detail = "Tiffany saw perfection in her future as a wife, mother, and overachiever. But as checklists grew longer and expectations grew harder to meet, Tiffany felt exhausted and broken."
    lesson25.url = "https://www.youtube.com/watch?v=gIQFLbvuWXc"
    lesson25.youTubeVideo = true
    lesson25.order = 9
    lesson25.favorite = false
    lesson25.random = Int64(arc4random_uniform(1000))
    lesson25.selected = false
    lesson25.sortingIndex = 0
    
    let lesson26 = Lesson(context: context)
    lesson26.category = lessonCategoryArray[0]
    lesson26.topic = "Principles & Ordinances"
    lesson26.title = "Faith - Being an Agent to Act"
    lesson26.detail = "In this new video series, leaders of The Church of Jesus Christ of Latter-day Saints reassure those who may feel unwelcome in the Church that they are loved and needed. They also encourage members to extend the hand of fellowship to others, regardless of perceived differences."
    lesson26.url = "https://www.youtube.com/watch?v=4WIuG9VqG4M"
    lesson26.youTubeVideo = true
    lesson26.order = 9
    lesson26.favorite = false
    lesson26.random = Int64(arc4random_uniform(1000))
    lesson26.selected = false
    lesson26.sortingIndex = 0
    
    let lesson28 = Lesson(context: context)
    lesson28.category = "Temporal"
    lesson28.topic = "Spiritual"
    lesson28.title = "Where Do Good and Evil Come From?"
    lesson28.detail = "If there is a God, why is there so much evil?"
    lesson28.url = "https://www.youtube.com/watch?v=xliyujhwhNM"
    lesson28.youTubeVideo = true
    lesson28.order = 9
    lesson28.favorite = false
    lesson28.random = Int64(arc4random_uniform(1000))
    lesson28.selected = false
    lesson28.sortingIndex = 0
    
    let lesson29 = Lesson(context: context)
    lesson29.category = lessonCategoryArray[0]
    lesson29.topic = "Atonement"
    lesson29.title = "Like a Broken Vessel"
    lesson29.detail = "One in four people in the world will be affected by mental illness at some point in their lives. More than 16 million U.S. adults had at least one major depressive episode in the past year."
    lesson29.url = "https://www.youtube.com/watch?v=IrNqGqy5kbQ"
    lesson29.youTubeVideo = true
    lesson29.order = 9
    lesson29.favorite = true
    lesson29.random = Int64(arc4random_uniform(1000))
    lesson29.selected = false
    lesson29.sortingIndex = 0
    
    let lesson30 = Lesson(context: context)
    lesson30.category = lessonCategoryArray[0]
    lesson30.topic = "Heavenly Father"
    lesson30.title = "Earthly Father, Heavenly Father"
    lesson30.detail = "Men on Earth have the opportunity to become fathers and experience some of the same joys that our Heavenly Father feels for us. Fatherhood is a divine responsibility to be cherished."
    lesson30.url = "https://www.youtube.com/watch?v=R5FxdCgD-qI"
    lesson30.youTubeVideo = true
    lesson30.order = 9
    lesson30.favorite = true
    lesson30.random = Int64(arc4random_uniform(1000))
    lesson30.selected = false
    lesson30.sortingIndex = 0
    
    let lesson31 = Lesson(context: context)
    lesson31.category = "Temporal"
    lesson31.topic = "Environmental"
    lesson31.title = "A Message For All Of Humanity"
    lesson31.detail = "Charlie Chaplin's inspirational final speech in 'The Great Dictator'."
    lesson31.url = "https://www.youtube.com/watch?v=CsgaFKwUA6g"
    lesson31.youTubeVideo = true
    lesson31.order = 9
    lesson31.favorite = true
    lesson31.random = Int64(arc4random_uniform(1000))
    lesson31.selected = false
    lesson31.sortingIndex = 0
    
    let lesson32 = Lesson(context: context)
    lesson32.category = "Temporal"
    lesson32.topic = "Spiritual"
    lesson32.title = "Does God Exist?"
    lesson32.detail = "4 New Arguments - Science tells us that the universe came into being via The Big Bang. But how do you get from energy and matter to a self-aware human being? "
    lesson32.url = "https://www.youtube.com/watch?v=gIorXcloIac"
    lesson32.youTubeVideo = true
    lesson32.order = 9
    lesson32.favorite = false
    lesson32.random = Int64(arc4random_uniform(1000))
    lesson32.selected = false
    lesson32.sortingIndex = 0
    
    let lesson33 = Lesson(context: context)
    lesson33.category = "Temporal"
    lesson33.topic = "Intellectual"
    lesson33.title = "What the Internet is Doing to Our Brains"
    lesson33.detail = "Most of us are on the Internet on a daily basis and whether we like it or not, the Internet is affecting us. It changes how we think, how we work, and it even changes our brains."
    lesson33.url = "https://www.youtube.com/watch?v=cKaWJ72x1rI"
    lesson33.youTubeVideo = true
    lesson33.order = 9
    lesson33.favorite = false
    lesson33.random = Int64(arc4random_uniform(1000))
    lesson33.selected = false
    lesson33.sortingIndex = 0
    
    let lesson34 = Lesson(context: context)
    lesson34.category = "Temporal"
    lesson34.topic = "Emotional"
    lesson34.title = "Addiction"
    lesson34.detail = "What causes addiction? Easy, right? Drugs cause addiction. But maybe it is not that simple."
    lesson34.url = "https://www.youtube.com/watch?v=ao8L-0nSYzg"
    lesson34.youTubeVideo = true
    lesson34.order = 9
    lesson34.favorite = false
    lesson34.random = Int64(arc4random_uniform(1000))
    lesson34.selected = false
    lesson34.sortingIndex = 0
    
    let lesson35 = Lesson(context: context)
    lesson35.category = lessonCategoryArray[0]
    lesson35.topic = "Commandments"
    lesson35.title = "What Should I Do When I See Pornography?"
    lesson35.detail = "Call it what it is.\nTurn it off or turn away.\nTalk to a parent or trusted adult."
    lesson35.url = "https://www.youtube.com/watch?v=UNeYQA3ZeX8"
    lesson35.youTubeVideo = true
    lesson35.order = 9
    lesson35.favorite = false
    lesson35.random = Int64(arc4random_uniform(1000))
    lesson35.selected = false
    lesson35.sortingIndex = 0
    
    let lesson37 = Lesson(context: context)
    lesson37.category = lessonCategoryArray[0]
    lesson37.topic = "Endure to the end"
    lesson37.title = "My New Life"
    lesson37.detail = "Stephanie Nielson, survivor of a near-fatal plane crash, shares her story of a beautiful life centered on faith in Jesus Christ and love of family. "
    lesson37.url = "https://www.youtube.com/watch?v=KHDvxPjsm8E"
    lesson37.youTubeVideo = true
    lesson37.order = 9
    lesson37.favorite = false
    lesson37.random = Int64(arc4random_uniform(1000))
    lesson37.selected = false
    lesson37.sortingIndex = 0
    
    let lesson44 = Lesson(context: context)
    lesson44.category = lessonCategoryArray[0]
    lesson44.topic = "Spiritual"
    lesson44.title = "Enemy Territory"
    lesson44.detail = "President Boyd K. Packer shares an experience in which he was protected during World War II by listening to a prompting from the Spirit and promises youth that they will be protected if they heed the promptings that come from the Holy Ghost."
    lesson44.url = "https://www.youtube.com/watch?v=DasSohiV38o"
    lesson44.youTubeVideo = true
    lesson44.order = 9
    lesson44.favorite = false
    lesson44.random = Int64(arc4random_uniform(1000))
    lesson44.selected = false
    lesson44.sortingIndex = 0
    
    let lesson47 = Lesson(context: context)
    lesson47.category = lessonCategoryArray[0]
    lesson47.topic = "Christlike Attributes"
    lesson47.title = "Dare to Stand Alone"
    lesson47.detail = "President Thomas S. Monson shares an experience he had in the Navy when he had to stand alone and reminds us that we are never alone when we stand with our Father in Heaven."
    lesson47.url = "https://www.youtube.com/watch?v=z_92mKlQOlk"
    lesson47.youTubeVideo = true
    lesson47.order = 9
    lesson47.favorite = false
    lesson47.random = Int64(arc4random_uniform(1000))
    lesson47.selected = false
    lesson47.sortingIndex = 0
    
    let lesson50 = Lesson(context: context)
    lesson50.category = lessonCategoryArray[0]
    lesson50.topic = "Commandments"
    lesson50.title = "Chastity: What Are the Limits?"
    lesson50.detail = "Latter-day Saint teens are counseled to stay sexually pure, but what exactly are the limits? Using teachings of modern prophets, this presentation shows why that's the wrong question to ask, as well as how we can find happiness and peace through staying chaste."
    lesson50.url = "https://www.youtube.com/watch?v=gHJoMvJadBg"
    lesson50.youTubeVideo = true
    lesson50.order = 9
    lesson50.favorite = false
    lesson50.random = Int64(arc4random_uniform(1000))
    lesson50.selected = false
    lesson50.sortingIndex = 0
    
    let lesson51 = Lesson(context: context)
    lesson51.category = lessonCategoryArray[0]
    lesson51.topic = "Plan of Salvation"
    lesson51.title = "Our True Identity"
    lesson51.detail = "President Dieter Uchtdorf retells the story of the ugly duckling and urges us to reflect on who we really are—sons and daughters of a glorious Heavenly Father."
    lesson51.url = "https://www.youtube.com/watch?v=wiiadnMvm20"
    lesson51.youTubeVideo = true
    lesson51.order = 9
    lesson51.favorite = false
    lesson51.random = Int64(arc4random_uniform(1000))
    lesson51.selected = false
    lesson51.sortingIndex = 0
    
    let lesson52 = Lesson(context: context)
    lesson52.category = lessonCategoryArray[0]
    lesson52.topic = "Holy Ghost"
    lesson52.title = "Choose the Light"
    lesson52.detail = "A reckless biker finds himself in a battle against time and the elements when he enters a situation he can’t get out of. He discovers his only option is to choose the light."
    lesson52.url = "https://www.youtube.com/watch?v=4OuOMBQoxdc"
    lesson52.youTubeVideo = true
    lesson52.order = 9
    lesson52.favorite = false
    lesson52.random = Int64(arc4random_uniform(1000))
    lesson52.selected = false
    lesson52.sortingIndex = 0
    
    let lesson53 = Lesson(context: context)
    lesson53.category = lessonCategoryArray[0]
    lesson53.topic = "Endure to the end"
    lesson53.title = "The Journey"
    lesson53.detail = "President Dieter F. Uchtdorf recalls fleeing, as a child, from war-torn East Germany with his mother."
    lesson53.url = "https://www.youtube.com/watch?v=ilNeYhAwiUc"
    lesson53.youTubeVideo = true
    lesson53.order = 9
    lesson53.favorite = false
    lesson53.random = Int64(arc4random_uniform(1000))
    lesson53.selected = false
    lesson53.sortingIndex = 0
    
    let lesson54 = Lesson(context: context)
    lesson54.category = lessonCategoryArray[0]
    lesson54.topic = "Plan of Salvation"
    lesson54.title = "Shower of Heavenly Blessings"
    lesson54.detail = "Have you ever felt that Heavenly Father keeps blessings instead of freely sharing them? In reality, He showers us with blessings constantly and it's up to us to decide how to have them reach us. "
    lesson54.url = "https://www.youtube.com/watch?v=8-vXpnKMtUE"
    lesson54.youTubeVideo = true
    lesson54.order = 9
    lesson54.favorite = false
    lesson54.random = Int64(arc4random_uniform(1000))
    lesson54.selected = false
    lesson54.sortingIndex = 0
    
    let lesson55 = Lesson(context: context)
    lesson55.category = lessonCategoryArray[0]
    lesson55.topic = "Christlike Attributes"
    lesson55.title = "Overcoming Fear Through Faith & Hope In God"
    lesson55.detail = "A Mother's Hope: When President Uchtdorf was a young child, he learned that his mother was a great example of how hope and faith in God and in the Gospel of Jesus Christ can help anyone overcome fear."
    lesson55.url = "https://www.youtube.com/watch?v=9ssHhzi7alI"
    lesson55.youTubeVideo = true
    lesson55.order = 9
    lesson55.favorite = false
    lesson55.random = Int64(arc4random_uniform(1000))
    lesson55.selected = false
    lesson55.sortingIndex = 0
    
    let lesson56 = Lesson(context: context)
    lesson56.category = lessonCategoryArray[0]
    lesson56.topic = "Principles & Ordinances"
    lesson56.title = "Flecks of Gold"
    lesson56.detail = "This compelling story of an 1850s gold prospector illustrates how giving service to others blesses our lives."
    lesson56.url = "https://www.youtube.com/watch?v=fEfg-Z-TOc8"
    lesson56.youTubeVideo = true
    lesson56.order = 9
    lesson56.favorite = false
    lesson56.random = Int64(arc4random_uniform(1000))
    lesson56.selected = false
    lesson56.sortingIndex = 0
    
    let lesson57 = Lesson(context: context)
    lesson57.category = lessonCategoryArray[0]
    lesson57.topic = "Commandments"
    lesson57.title = "Addiction: You Will Be Freed"
    lesson57.detail = "Through the Atonement of Jesus Christ, all can be transformed, cleansed, and freed from addiction."
    lesson57.url = "https://www.youtube.com/watch?v=ry8-YIwnEcU"
    lesson57.youTubeVideo = true
    lesson57.order = 9
    lesson57.favorite = true
    lesson57.random = Int64(arc4random_uniform(1000))
    lesson57.selected = false
    lesson57.sortingIndex = 0
    
    let lesson58 = Lesson(context: context)
    lesson58.category = lessonCategoryArray[0]
    lesson58.topic = "Commandments"
    lesson58.title = "Watch Your Step"
    lesson58.detail = "See how a moment's decision can have far-reaching consequences—for good or bad."
    lesson58.url = "https://www.youtube.com/watch?v=gWQ5dPeixdw"
    lesson58.youTubeVideo = true
    lesson58.order = 9
    lesson58.favorite = false
    lesson58.random = Int64(arc4random_uniform(1000))
    lesson58.selected = false
    lesson58.sortingIndex = 0
    
    let lesson59 = Lesson(context: context)
    lesson59.category = lessonCategoryArray[0]
    lesson59.topic = "Plan of Salvation"
    lesson59.title = "We're Still a Family"
    lesson59.detail = "A young man shares how the Plan of Salvation has helped him to see the blessings that can come through trials."
    lesson59.url = "https://www.youtube.com/watch?v=HYRb4DNf8wc"
    lesson59.youTubeVideo = true
    lesson59.order = 9
    lesson59.favorite = false
    lesson59.random = Int64(arc4random_uniform(1000))
    lesson59.selected = false
    lesson59.sortingIndex = 0
    
    let lesson60 = Lesson(context: context)
    lesson60.category = lessonCategoryArray[0]
    lesson60.topic = "Jesus Christ"
    lesson60.title = "Follow Him"
    lesson60.detail = "If we follow Jesus Christ, we will find new life. If we trust Him, He will show us the way back to God."
    lesson60.url = "https://www.youtube.com/watch?v=Pz00iuorG2Q"
    lesson60.youTubeVideo = true
    lesson60.order = 9
    lesson60.favorite = true
    lesson60.random = Int64(arc4random_uniform(1000))
    lesson60.selected = false
    lesson60.sortingIndex = 0
    
    let lesson64 = Lesson(context: context)
    lesson64.category = "Temporal"
    lesson64.topic = "Spiritual"
    lesson64.title = "Does Science Argue for or against God?"
    lesson64.detail = "Why are we here? Literally. The latest science says we shouldn’t be."
    lesson64.url = "https://www.youtube.com/watch?v=UjGPHF5A6Po"
    lesson64.youTubeVideo = true
    lesson64.order = 9
    lesson64.favorite = false
    lesson64.random = Int64(arc4random_uniform(1000))
    lesson64.selected = false
    lesson64.sortingIndex = 0
    
    let lesson66 = Lesson(context: context)
    lesson66.category = "Temporal"
    lesson66.topic = "Emotional"
    lesson66.title = "The Farmer Story"
    lesson66.detail = "Good, Bad...who knows?"
    lesson66.url = "https://www.youtube.com/watch?v=P3P7f0Zg9wk"
    lesson66.youTubeVideo = true
    lesson66.order = 9
    lesson66.favorite = false
    lesson66.random = Int64(arc4random_uniform(1000))
    lesson66.selected = false
    lesson66.sortingIndex = 0
    
    let lesson67 = Lesson(context: context)
    lesson67.category = "Temporal"
    lesson67.topic = "Relational/Social"
    lesson67.title = "Don't Compare Yourself to Others"
    lesson67.detail = "Have you ever envied someone else's success? Do you sometimes wish you had another person's life? Well, comedian Tom Shillue explains why comparing yourself to other people will put you on the fast track to an unhappy life."
    lesson67.url = "https://www.youtube.com/watch?v=0MPG-aLD-EY"
    lesson67.youTubeVideo = true
    lesson67.order = 9
    lesson67.favorite = false
    lesson67.random = Int64(arc4random_uniform(1000))
    lesson67.selected = false
    lesson67.sortingIndex = 0
    
    let lesson68 = Lesson(context: context)
    lesson68.category = "Temporal"
    lesson68.topic = "Relational/Social"
    lesson68.title = "It's Not About The Nail"
    lesson68.detail = "“Don't try to fix it. I just need you to listen.” Every man has heard these words. And they are the law of the land. No matter what."
    lesson68.url = "https://www.youtube.com/watch?v=-4EDhdAHrOg"
    lesson68.youTubeVideo = true
    lesson68.order = 9
    lesson68.favorite = false
    lesson68.random = Int64(arc4random_uniform(1000))
    lesson68.selected = false
    lesson68.sortingIndex = 0
    
    let lesson69 = Lesson(context: context)
    lesson69.category = lessonCategoryArray[0]
    lesson69.topic = "Jesus Christ"
    lesson69.title = "He Lives"
    lesson69.detail = "Because of the Resurrection, Jesus Christ lives. Because of Him, you can overcome sin and experience everlasting joy."
    lesson69.url = "https://www.youtube.com/watch?v=BZqTRSVA1YA"
    lesson69.youTubeVideo = true
    lesson69.order = 9
    lesson69.favorite = false
    lesson69.random = Int64(arc4random_uniform(1000))
    lesson69.selected = false
    lesson69.sortingIndex = 0
    
    let lesson70 = Lesson(context: context)
    lesson70.category = "Temporal"
    lesson70.topic = "Emotional"
    lesson70.title = "The Anger Eating Monster"
    lesson70.detail = "Depression, anger or anxiety, we all have issues that we struggle with. The key to overcoming any issue is how you deal with it."
    lesson70.url = "https://www.youtube.com/watch?v=4izOVj-SylA"
    lesson70.youTubeVideo = true
    lesson70.order = 9
    lesson70.favorite = false
    lesson70.random = Int64(arc4random_uniform(1000))
    lesson70.selected = false
    lesson70.sortingIndex = 0
    
    let lesson71 = Lesson(context: context)
    lesson71.category = lessonCategoryArray[0]
    lesson71.topic = "Spiritual"
    lesson71.title = "The Music of the Gospel"
    lesson71.detail = "The joy of the dance will be experienced only when we come to hear the music."
    lesson71.url = "https://www.youtube.com/watch?v=ju8S2vswhjY"
    lesson71.youTubeVideo = true
    lesson71.order = 9
    lesson71.favorite = false
    lesson71.random = Int64(arc4random_uniform(1000))
    lesson71.selected = false
    lesson71.sortingIndex = 0
    
    let lesson75 = Lesson(context: context)
    lesson75.category = "Temporal"
    lesson75.topic = "Physical"
    lesson75.title = "A Message From Your Body"
    lesson75.detail = "“Hey you, please take care of me!”"
    lesson75.url = "https://www.youtube.com/watch?v=YEP30_iM-ZI"
    lesson75.youTubeVideo = true
    lesson75.order = 9
    lesson75.favorite = false
    lesson75.random = Int64(arc4random_uniform(1000))
    lesson75.selected = false
    lesson75.sortingIndex = 0
    
    let lesson76 = Lesson(context: context)
    lesson76.category = lessonCategoryArray[0]
    lesson76.topic = "Principles & Ordinances"
    lesson76.title = "Covenants"
    lesson76.detail = "Elder Nelson Talks on making and keeping sacred covenants is a precious doctrine of The Church of Jesus Christ of Latter-day Saints, according to prophets and apostles who lead the Church."
    lesson76.url = "https://www.youtube.com/watch?v=kGR2guh4qVQ"
    lesson76.youTubeVideo = true
    lesson76.order = 9
    lesson76.favorite = false
    lesson76.random = Int64(arc4random_uniform(1000))
    lesson76.selected = false
    lesson76.sortingIndex = 0
    
    let lesson77 = Lesson(context: context)
    lesson77.category = lessonCategoryArray[0]
    lesson77.topic = "Spiritual"
    lesson77.title = "Temple Garment"
    lesson77.detail = "Temple garments are worn by faithful Latter-day Saints as a reminder of sacred beliefs and commitments. Sometimes inaccurately referred to as “Mormon underwear” or “magical underwear.”"
    lesson77.url = "https://www.youtube.com/watch?v=SkTz_NQqKA8"
    lesson77.youTubeVideo = true
    lesson77.order = 9
    lesson77.favorite = true
    lesson77.random = Int64(arc4random_uniform(1000))
    lesson77.selected = false
    lesson77.sortingIndex = 0
    
    let lesson78 = Lesson(context: context)
    lesson78.category = lessonCategoryArray[0]
    lesson78.topic = "Heavenly Father"
    lesson78.title = "The Power of Prayer"
    lesson78.detail = "Prayer is how we reach out to God. And more often than not, prayer lets God reach into our hearts and fill us with His love."
    lesson78.url = "https://www.youtube.com/watch?v=WRhLK0TCmiQ"
    lesson78.youTubeVideo = true
    lesson78.order = 9
    lesson78.favorite = false
    lesson78.random = Int64(arc4random_uniform(1000))
    lesson78.selected = false
    lesson78.sortingIndex = 0
    
    let lesson79 = Lesson(context: context)
    lesson79.category = lessonCategoryArray[0]
    lesson79.topic = "Perfect the Saints"
    lesson79.title = "You Never Know How Much Good You Do"
    lesson79.detail = "How many things did you get checked off your “to- do” list today?"
    lesson79.url = "https://www.youtube.com/watch?v=3n-DOKBffuU"
    lesson79.youTubeVideo = true
    lesson79.order = 9
    lesson79.favorite = true
    lesson79.random = Int64(arc4random_uniform(1000))
    lesson79.selected = false
    lesson79.sortingIndex = 0
    
    let lesson80 = Lesson(context: context)
    lesson80.category = lessonCategoryArray[0]
    lesson80.topic = "Christlike Attributes"
    lesson80.title = "Bearing Our Burdens with Hope"
    lesson80.detail = "Being happy does not always mean being without hardship. Sometimes it means just the opposite."
    lesson80.url = "https://www.youtube.com/watch?v=aoe1-YXuuKU"
    lesson80.youTubeVideo = true
    lesson80.order = 9
    lesson80.favorite = false
    lesson80.random = Int64(arc4random_uniform(1000))
    lesson80.selected = false
    lesson80.sortingIndex = 0
    
    let lesson81 = Lesson(context: context)
    lesson81.category = lessonCategoryArray[0]
    lesson81.topic = "Plan of Salvation"
    lesson81.title = "Am I Good Enough?"
    lesson81.detail = "If you will really try and will not rationalize or rebel—repenting often and pleading for grace—you positively are going to be “good enough.”"
    lesson81.url = "https://www.youtube.com/watch?v=RGXit7LwV-E"
    lesson81.youTubeVideo = true
    lesson81.order = 9
    lesson81.favorite = true
    lesson81.random = Int64(arc4random_uniform(1000))
    lesson81.selected = false
    lesson81.sortingIndex = 0
    
    let lesson83 = Lesson(context: context)
    lesson83.category = "Temporal"
    lesson83.topic = "Environmental"
    lesson83.title = "Emergancy Preparedness"
    lesson83.detail = "72 Hour Kits"
    lesson83.url = "https://www.asecurelife.com/72-hour-kit/"
    lesson83.youTubeVideo = false
    lesson83.order = 9
    lesson83.favorite = false
    lesson83.random = Int64(arc4random_uniform(1000))
    lesson83.selected = false
    lesson83.sortingIndex = 0
    
    let lesson84 = Lesson(context: context)
    lesson84.category = lessonCategoryArray[0]
    lesson84.topic = "Forgiveness"
    lesson84.title = "The Shiny Bicycle"
    lesson84.detail = "Everybody makes mistakes, and even though it's not easy, with the help of Heavenly Father and Jesus Christ we can receive forgiveness for our sins."
    lesson84.url = "https://www.youtube.com/watch?v=ItEsXGhcOEs"
    lesson84.youTubeVideo = true
    lesson84.order = 9
    lesson84.favorite = false
    lesson84.random = Int64(arc4random_uniform(1000))
    lesson84.selected = false
    lesson84.sortingIndex = 0
    
    let lesson85 = Lesson(context: context)
    lesson85.category = lessonCategoryArray[0]
    lesson85.topic = "Christlike Attributes"
    lesson85.title = "The Coat: A Story of Charity"
    lesson85.detail = "Did you know that this touching story of selflessness and love is true? "
    lesson85.url = "https://www.youtube.com/watch?v=cp3IH8ZNviQ"
    lesson85.youTubeVideo = true
    lesson85.order = 9
    lesson85.favorite = false
    lesson85.random = Int64(arc4random_uniform(1000))
    lesson85.selected = false
    lesson85.sortingIndex = 0
    
    let lesson86 = Lesson(context: context)
    lesson86.category = lessonCategoryArray[0]
    lesson86.topic = "Plan of Salvation"
    lesson86.title = "Happy Families"
    lesson86.detail = "Mormon Channel playlist of happy families can be together forever."
    lesson86.url = "https://www.youtube.com/playlist?list=PLAYgY8SPtEWGLQuG5emKY0mdwCKSL-po1"
    lesson86.youTubeVideo = false
    lesson86.order = 9
    lesson86.favorite = false
    lesson86.random = Int64(arc4random_uniform(1000))
    lesson86.selected = false
    lesson86.sortingIndex = 0
    
    let lesson87 = Lesson(context: context)
    lesson87.category = lessonCategoryArray[0]
    lesson87.topic = "Atonement"
    lesson87.title = "Jesus Christ - A Little Better"
    lesson87.detail = "Mormon Channel playlist with 1 on 1 testimonies about Jesus Christ."
    lesson87.url = "https://www.youtube.com/playlist?list=PLAYgY8SPtEWGdk48FbKS9nIJ4mEcj_U5x"
    lesson87.youTubeVideo = false
    lesson87.order = 9
    lesson87.favorite = true
    lesson87.random = Int64(arc4random_uniform(1000))
    lesson87.selected = false
    lesson87.sortingIndex = 0
    
    let lesson88 = Lesson(context: context)
    lesson88.category = lessonCategoryArray[0]
    lesson88.topic = "Endure to the end"
    lesson88.title = "Dealing with: Temptations, Trials, Trauma, and Tragedy"
    lesson88.detail = "Mormon Channel teaches how His Grace heals all."
    lesson88.url = "https://www.youtube.com/playlist?list=PLAYgY8SPtEWG9lP4x8bbGgbUccxWmyzRk"
    lesson88.youTubeVideo = false
    lesson88.order = 9
    lesson88.favorite = true
    lesson88.random = Int64(arc4random_uniform(1000))
    lesson88.selected = false
    lesson88.sortingIndex = 0
    
    let lesson89 = Lesson(context: context)
    lesson89.category = lessonCategoryArray[0]
    lesson89.topic = "Principles & Ordinances"
    lesson89.title = "Gospel Principles Animated"
    lesson89.detail = "Kids animated videos that teach Gospel principles."
    lesson89.url = "https://www.youtube.com/playlist?list=PLe0BvbTylcNPKsUQ04uWphFcVyP-zYsmN"
    lesson89.youTubeVideo = false
    lesson89.order = 9
    lesson89.favorite = true
    lesson89.random = Int64(arc4random_uniform(1000))
    lesson89.selected = false
    lesson89.sortingIndex = 0
    
    let lesson90 = Lesson(context: context)
    lesson90.category = "Spiritual"
    lesson90.topic = "Proclaim the Gospel"
    lesson90.title = "I'm a Mormon"
    lesson90.detail = "Videos from people all over the world testify how they are members of the Church of Jesus Christ of Latter Day Saints."
    lesson90.url = "https://www.youtube.com/playlist?list=PLC3919215DCC6CBE1"
    lesson90.youTubeVideo = false
    lesson90.order = 9
    lesson90.favorite = true
    lesson90.random = Int64(arc4random_uniform(1000))
    lesson90.selected = false
    lesson90.sortingIndex = 0
    
    let lesson91 = Lesson(context: context)
    lesson91.category = lessonCategoryArray[0]
    lesson91.topic = "Spiritual"
    lesson91.title = "Mormon Beliefs"
    lesson91.detail = "Mormon.org shares a series of videos that explain the LDS core beliefs."
    lesson91.url = "https://www.youtube.com/playlist?list=PLq9T3v5R_q8tvJpdXgLHnLH8h0b0dxbGH"
    lesson91.youTubeVideo = false
    lesson91.order = 9
    lesson91.favorite = true
    lesson91.random = Int64(arc4random_uniform(1000))
    lesson91.selected = false
    lesson91.sortingIndex = 0
    
    let lesson92 = Lesson(context: context)
    lesson92.category = lessonCategoryArray[0]
    lesson92.topic = "Spiritual"
    lesson92.title = "Mormon Messages"
    lesson92.detail = "LDS youth videos for youth and adults to help bring them closer to the Savior, Jesus Christ."
    lesson92.url = "https://www.youtube.com/playlist?list=PL6C2E726B40648A1B"
    lesson92.youTubeVideo = false
    lesson92.order = 9
    lesson92.favorite = true
    lesson92.random = Int64(arc4random_uniform(1000))
    lesson92.selected = false
    lesson92.sortingIndex = 0
    
    let lesson93 = Lesson(context: context)
    lesson93.category = "Temporal"
    lesson93.topic = "Spiritual"
    lesson93.title = "Meet the Mormons"
    lesson93.detail = "The Meet the Mormons movie examines the very diverse lives of six devout members of The Church of Jesus Christ of Latter-day Saints (Mormons)."
    lesson93.url = "https://www.youtube.com/watch?v=iS6PZh6tCC0"
    lesson93.youTubeVideo = true
    lesson93.order = 9
    lesson93.favorite = false
    lesson93.random = Int64(arc4random_uniform(1000))
    lesson93.selected = false
    lesson93.sortingIndex = 0
    
    let lesson94 = Lesson(context: context)
    lesson94.category = "Temporal"
    lesson94.topic = "Emotional"
    lesson94.title = "Power of Words"
    lesson94.detail = "Sticks and stones will break my bones, but words will never hurt me. Wrong. Words can break your heart."
    lesson94.url = "https://www.youtube.com/watch?v=jT6hSFAsrhY"
    lesson94.youTubeVideo = true
    lesson94.order = 9
    lesson94.favorite = false
    lesson94.random = Int64(arc4random_uniform(1000))
    lesson94.selected = false
    lesson94.sortingIndex = 0
    
    let lesson95 = Lesson(context: context)
    lesson95.category = "Temporal"
    lesson95.topic = "Intellectual"
    lesson95.title = "Hollywood Media vs. Your Mind"
    lesson95.detail = "Imagine a group so powerful they could beam ideas directly into your head. Well, you don't have to imagine -- it's Hollywood. "
    lesson95.url = "https://www.youtube.com/watch?v=vjMYCnI5kz0"
    lesson95.youTubeVideo = true
    lesson95.order = 9
    lesson95.favorite = true
    lesson95.random = Int64(arc4random_uniform(1000))
    lesson95.selected = false
    lesson95.sortingIndex = 0
    
    ad.saveContext()
}

func generateCouncils() {
    getAllTasks()
    let council = Council(context: context)
    council.selectedOne = taskCouncil
    council.title = "Family Meeting"
    council.detail = "“If people don't weigh in, they can't buy in.”\n\n- Patrick Lencioni"
    council.url = "https://www.lds.org/blog/bc/images/family-councils-cheat-sheet.pdf"
    council.selected = true
    
    ad.saveContext()
}

func generateGames() {
    getAllTasks()
    let game1 = Game(context: context)
    game1.category = gameCategoryArray[0]
    game1.title = "Surprise!"
    game1.url = "https://drive.google.com/open?id=1vdnjN6aNW4iRC1ljf79MBELI2-eW0BHe"
    game1.favorite = true
    game1.order = 1
    game1.random = Int64(arc4random_uniform(1000))
    game1.selected = false
    game1.sortingIndex = 0
    
    let game2 = Game(context: context)
    game2.selectedOne = taskGame
    game2.category = gameCategoryArray[1]
    game2.title = "Button, Button, Who's Got the Button?"
    game2.url = "http://www.fungameskidsplay.com/buttonbuttongame.htm"
    game2.favorite = true
    game2.order = 2
    game2.random = Int64(arc4random_uniform(1000))
    game2.selected = true
    game2.sortingIndex = 0
    
    let game5 = Game(context: context)
    game5.category = gameCategoryArray[4]
    game5.title = "Capture the Flag"
    game5.url = "http://www.fungameskidsplay.com/capturetheflaggame.htm"
    game5.favorite = false
    game5.order = 5
    game5.random = Int64(arc4random_uniform(1000))
    game5.selected = false
    game5.sortingIndex = 0
    
    let game6 = Game(context: context)
    game6.category = gameCategoryArray[4]
    game6.title = "Dodgeball"
    game6.url = "http://www.fungameskidsplay.com/dodgeballgame.htm"
    game6.favorite = false
    game6.order = 6
    game6.random = Int64(arc4random_uniform(1000))
    game6.selected = false
    game6.sortingIndex = 0
    
    let game7 = Game(context: context)
    game7.category = gameCategoryArray[1]
    game7.title = "Follow the Leader"
    game7.url = "http://www.fungameskidsplay.com/followtheleadergame.htm"
    game7.favorite = false
    game7.order = 7
    game7.random = Int64(arc4random_uniform(1000))
    game7.selected = false
    game7.sortingIndex = 0
    
    let game8 = Game(context: context)
    game8.category = gameCategoryArray[1]
    game8.title = "Red Rover"
    game8.url = "http://www.fungameskidsplay.com/redrovergame.htm"
    game8.favorite = false
    game8.order = 8
    game8.random = Int64(arc4random_uniform(1000))
    game8.selected = false
    game8.sortingIndex = 0
    
    let game11 = Game(context: context)
    game11.category = gameCategoryArray[1]
    game11.title = "Hide and Seek"
    game11.url = "http://www.fungameskidsplay.com/hideandseekgame.htm"
    game11.favorite = true
    game11.order = 11
    game11.random = Int64(arc4random_uniform(1000))
    game11.selected = false
    game11.sortingIndex = 0
    
    let game12 = Game(context: context)
    game12.category = gameCategoryArray[1]
    game12.title = "Hopscotch"
    game12.url = "http://www.fungameskidsplay.com/hopscotchgame.htm"
    game12.favorite = false
    game12.order = 12
    game12.random = Int64(arc4random_uniform(1000))
    game12.selected = false
    game12.sortingIndex = 0
    
    let game13 = Game(context: context)
    game13.category = gameCategoryArray[1]
    game13.title = "H.O.R.S.E."
    game13.url = "http://www.fungameskidsplay.com/horsegame.htm"
    game13.favorite = false
    game13.order = 13
    game13.random = Int64(arc4random_uniform(1000))
    game13.selected = false
    game13.sortingIndex = 0
    
    let game14 = Game(context: context)
    game14.category = gameCategoryArray[1]
    game14.title = "Hot Potato"
    game14.url = "http://www.fungameskidsplay.com/hotpotatogame.htm"
    game14.favorite = false
    game14.order = 14
    game14.random = Int64(arc4random_uniform(1000))
    game14.selected = false
    game14.sortingIndex = 0
    
    let game15 = Game(context: context)
    game15.category = gameCategoryArray[1]
    game15.title = "Hula Hoop"
    game15.url = "http://www.fungameskidsplay.com/hulahoopgame.htm"
    game15.favorite = false
    game15.order = 15
    game15.random = Int64(arc4random_uniform(1000))
    game15.selected = false
    game15.sortingIndex = 0
    
    let game16 = Game(context: context)
    game16.category = gameCategoryArray[1]
    game16.title = "Jacks"
    game16.url = "http://www.fungameskidsplay.com/jacksgame.htm"
    game16.favorite = false
    game16.order = 16
    game16.random = Int64(arc4random_uniform(1000))
    game16.selected = false
    game16.sortingIndex = 0
    
    let game17 = Game(context: context)
    game17.category = gameCategoryArray[1]
    game17.title = "Juggle Circle"
    game17.url = "http://www.fungameskidsplay.com/jugglecirclegame.htm"
    game17.favorite = false
    game17.order = 17
    game17.random = Int64(arc4random_uniform(1000))
    game17.selected = false
    game17.sortingIndex = 0
    
    let game18 = Game(context: context)
    game18.category = gameCategoryArray[1]
    game18.title = "Jump Rope"
    game18.url = "http://www.fungameskidsplay.com/jump-rope-rhymes.htm"
    game18.favorite = false
    game18.order = 18
    game18.random = Int64(arc4random_uniform(1000))
    game18.selected = false
    game18.sortingIndex = 0
    
    let game19 = Game(context: context)
    game19.category = gameCategoryArray[4]
    game19.title = "Kickball"
    game19.url = "http://www.fungameskidsplay.com/kickballgame.htm"
    game19.favorite = false
    game19.order = 19
    game19.random = Int64(arc4random_uniform(1000))
    game19.selected = false
    game19.sortingIndex = 0
    
    let game20 = Game(context: context)
    game20.category = gameCategoryArray[4]
    game20.title = "Kick the Can"
    game20.url = "http://www.fungameskidsplay.com/kickthecangame.htm"
    game20.favorite = false
    game20.order = 20
    game20.random = Int64(arc4random_uniform(1000))
    game20.selected = false
    game20.sortingIndex = 0
    
    let game21 = Game(context: context)
    game21.category = gameCategoryArray[1]
    game21.title = "Limbo"
    game21.url = "http://www.fungameskidsplay.com/limbogame.htm"
    game21.favorite = true
    game21.order = 21
    game21.random = Int64(arc4random_uniform(1000))
    game21.selected = false
    game21.sortingIndex = 0
    
    let game22 = Game(context: context)
    game22.category = gameCategoryArray[1]
    game22.title = "Marbles"
    game22.url = "http://www.fungameskidsplay.com/marblesgame.htm"
    game22.favorite = false
    game22.order = 22
    game22.random = Int64(arc4random_uniform(1000))
    game22.selected = false
    game22.sortingIndex = 0
    
    let game23 = Game(context: context)
    game23.category = gameCategoryArray[1]
    game23.title = "Monkey in the Middle"
    game23.url = "http://www.fungameskidsplay.com/monkeyinthemiddle.htm"
    game23.favorite = false
    game23.order = 23
    game23.random = Int64(arc4random_uniform(1000))
    game23.selected = false
    game23.sortingIndex = 0
    
    let game24 = Game(context: context)
    game24.category = gameCategoryArray[1]
    game24.title = "Playground Shark"
    game24.url = "http://www.fungameskidsplay.com/playgroundsharkgame.htm"
    game24.favorite = false
    game24.order = 24
    game24.random = Int64(arc4random_uniform(1000))
    game24.selected = false
    game24.sortingIndex = 0
    
    let game25 = Game(context: context)
    game25.category = gameCategoryArray[1]
    game25.title = "Mother May I?"
    game25.url = "http://www.fungameskidsplay.com/mothermayigame.htm"
    game25.favorite = false
    game25.order = 25
    game25.random = Int64(arc4random_uniform(1000))
    game25.selected = false
    game25.sortingIndex = 0
    
    let game26 = Game(context: context)
    game26.category = gameCategoryArray[1]
    game26.title = "Red Light Green Light"
    game26.url = "http://www.fungameskidsplay.com/redlightgreenlightgame.htm"
    game26.favorite = false
    game26.order = 26
    game26.random = Int64(arc4random_uniform(1000))
    game26.selected = false
    game26.sortingIndex = 0
    
    let game27 = Game(context: context)
    game27.category = gameCategoryArray[1]
    game27.title = "Relay Race"
    game27.url = "http://www.fungameskidsplay.com/relayracegames.htm"
    game27.favorite = false
    game27.order = 27
    game27.random = Int64(arc4random_uniform(1000))
    game27.selected = false
    game27.sortingIndex = 0
    
    let game28 = Game(context: context)
    game28.category = gameCategoryArray[1]
    game28.title = "Tag"
    game28.url = "http://www.fungameskidsplay.com/taggames.htm"
    game28.favorite = true
    game28.order = 28
    game28.random = Int64(arc4random_uniform(1000))
    game28.selected = false
    game28.sortingIndex = 0
    
    let game29 = Game(context: context)
    game29.category = gameCategoryArray[1]
    game29.title = "I Spy"
    game29.url = "http://www.fungameskidsplay.com/travelgames.htm"
    game29.favorite = false
    game29.order = 29
    game29.random = Int64(arc4random_uniform(1000))
    game29.selected = false
    game29.sortingIndex = 0
    
    let game30 = Game(context: context)
    game30.category = gameCategoryArray[0]
    game30.title = "You're It!"
    game30.url = "http://www.fungameskidsplay.com/youreit.htm"
    game30.favorite = false
    game30.order = 30
    game30.random = Int64(arc4random_uniform(1000))
    game30.selected = false
    game30.sortingIndex = 0
    
    let game31 = Game(context: context)
    game31.category = gameCategoryArray[1]
    game31.title = "5 Little Monkeys Swinging In The Tree"
    game31.url = "https://www.youtube.com/watch?v=sy0Zr_UrFp0"
    game31.favorite = false
    game31.order = 31
    game31.random = Int64(arc4random_uniform(1000))
    game31.selected = false
    game31.sortingIndex = 0
    
    let game32 = Game(context: context)
    game32.category = gameCategoryArray[4]
    game32.title = "Basketball"
    game32.url = "https://www.wikihow.com/Play-Basketball"
    game32.favorite = false
    game32.order = 32
    game32.random = Int64(arc4random_uniform(1000))
    game32.selected = false
    game32.sortingIndex = 0
    
    let game33 = Game(context: context)
    game33.category = gameCategoryArray[4]
    game33.title = "Soccer"
    game33.url = "https://www.wikihow.com/Play-Soccer"
    game33.favorite = false
    game33.order = 33
    game33.random = Int64(arc4random_uniform(1000))
    game33.selected = false
    game33.sortingIndex = 0
    
    let game34 = Game(context: context)
    game34.category = gameCategoryArray[6]
    game34.title = "Kite Flying"
    game34.url = "https://www.wikihow.com/Fly-a-Stunt-Kite"
    game34.favorite = false
    game34.order = 34
    game34.random = Int64(arc4random_uniform(1000))
    game34.selected = false
    game34.sortingIndex = 0
    
    let game35 = Game(context: context)
    game35.category = gameCategoryArray[6]
    game35.title = "Hiking"
    game35.url = "https://www.wikihow.com/Hike"
    game35.favorite = false
    game35.order = 35
    game35.random = Int64(arc4random_uniform(1000))
    game35.selected = false
    game35.sortingIndex = 0
    
    let game36 = Game(context: context)
    game36.category = gameCategoryArray[5]
    game36.title = "Luminaria"
    game36.url = "https://thanksgivingpoint.org/events/luminaria/"
    game36.favorite = false
    game36.order = 36
    game36.random = Int64(arc4random_uniform(1000))
    game36.selected = false
    game36.sortingIndex = 0
    
    let game37 = Game(context: context)
    game37.category = gameCategoryArray[6]
    game37.title = "Lemonade Stand"
    game37.url = "https://www.wikihow.com/Run-a-Lemonade-Stand"
    game37.favorite = false
    game37.order = 37
    game37.random = Int64(arc4random_uniform(1000))
    game37.selected = false
    game37.sortingIndex = 0
    
    let game38 = Game(context: context)
    game38.category = gameCategoryArray[6]
    game38.title = "Build A Snowman"
    game38.url = "https://www.wikihow.com/Make-a-Snowman"
    game38.favorite = false
    game38.order = 38
    game38.random = Int64(arc4random_uniform(1000))
    game38.selected = false
    game38.sortingIndex = 0
    
    let game39 = Game(context: context)
    game39.category = gameCategoryArray[9]
    game39.title = "Picture Collage"
    game39.url = "https://www.wikihow.com/Make-a-Collage"
    game39.favorite = false
    game39.order = 39
    game39.random = Int64(arc4random_uniform(1000))
    game39.selected = false
    game39.sortingIndex = 0
    
    let game40 = Game(context: context)
    game40.category = gameCategoryArray[5]
    game40.title = "Zoo"
    game40.url = "https://www.tripadvisor.com/Attractions"
    game40.favorite = false
    game40.order = 40
    game40.random = Int64(arc4random_uniform(1000))
    game40.selected = false
    game40.sortingIndex = 0
    
    let game41 = Game(context: context)
    game41.category = gameCategoryArray[5]
    game41.title = "Local Event"
    game41.url = "https://www.tripadvisor.com/Attractions"
    game41.favorite = false
    game41.order = 41
    game41.random = Int64(arc4random_uniform(1000))
    game41.selected = false
    game41.sortingIndex = 0
    
    let game42 = Game(context: context)
    game42.category = gameCategoryArray[1]
    game42.title = "Blanket Fort"
    game42.url = "https://www.wikihow.com/Make-a-Blanket-Fort"
    game42.favorite = true
    game42.order = 42
    game42.random = Int64(arc4random_uniform(1000))
    game42.selected = false
    game42.sortingIndex = 0
    
    let game43 = Game(context: context)
    game43.category = gameCategoryArray[7]
    game43.title = "Genealogy"
    game43.url = "https://www.familysearch.org/"
    game43.favorite = false
    game43.order = 43
    game43.random = Int64(arc4random_uniform(1000))
    game43.selected = false
    game43.sortingIndex = 0
    
    let game44 = Game(context: context)
    game44.category = gameCategoryArray[5]
    game44.title = "Family Photos"
    game44.url = "https://www.wikihow.com/Accessorize-Your-Home-With-Family-Photos"
    game44.favorite = false
    game44.order = 44
    game44.random = Int64(arc4random_uniform(1000))
    game44.selected = false
    game44.sortingIndex = 0
    
    let game45 = Game(context: context)
    game45.category = gameCategoryArray[7]
    game45.title = "Clean House"
    game45.url = "https://www.wikihow.com/Clean-a-House"
    game45.favorite = false
    game45.order = 45
    game45.random = Int64(arc4random_uniform(1000))
    game45.selected = false
    game45.sortingIndex = 0
    
    let game46 = Game(context: context)
    game46.category = gameCategoryArray[7]
    game46.title = "Visit Someone in Need"
    game46.url = "https://www.wikihow.com/Prepare-Yourself-for-Visiting-Someone-in-Hospital"
    game46.favorite = false
    game46.order = 46
    game46.random = Int64(arc4random_uniform(1000))
    game46.selected = false
    game46.sortingIndex = 0
    
    let game47 = Game(context: context)
    game47.category = gameCategoryArray[6]
    game47.title = "Sledding"
    game47.url = "https://www.wikihow.com/Go-Sledding"
    game47.favorite = false
    game47.order = 47
    game47.random = Int64(arc4random_uniform(1000))
    game47.selected = false
    game47.sortingIndex = 0
    
    let game48 = Game(context: context)
    game48.category = gameCategoryArray[9]
    game48.title = "Draw / Color"
    game48.url = "https://www.wikihow.com/Draw"
    game48.favorite = false
    game48.order = 48
    game48.random = Int64(arc4random_uniform(1000))
    game48.selected = false
    game48.sortingIndex = 0
    
    let game49 = Game(context: context)
    game49.category = gameCategoryArray[0]
    game49.title = "Tell Stories"
    game49.url = "https://www.wikihow.com/Tell-a-Story"
    game49.favorite = false
    game49.order = 49
    game49.random = Int64(arc4random_uniform(1000))
    game49.selected = false
    game49.sortingIndex = 0
    
    let game50 = Game(context: context)
    game50.category = gameCategoryArray[4]
    game50.title = "Baseball"
    game50.url = "https://www.wikihow.com/Play-Baseball"
    game50.favorite = false
    game50.order = 50
    game50.random = Int64(arc4random_uniform(1000))
    game50.selected = false
    game50.sortingIndex = 0
    
    let game51 = Game(context: context)
    game51.category = gameCategoryArray[4]
    game51.title = "Ultimate Frisbee"
    game51.url = "https://www.wikihow.com/Play-Ultimate-Frisbee"
    game51.favorite = false
    game51.order = 51
    game51.random = Int64(arc4random_uniform(1000))
    game51.selected = false
    game51.sortingIndex = 0
    
    let game52 = Game(context: context)
    game52.category = gameCategoryArray[4]
    game52.title = "Football"
    game52.url = "https://www.wikihow.com/Play-American-Football"
    game52.favorite = false
    game52.order = 52
    game52.random = Int64(arc4random_uniform(1000))
    game52.selected = false
    game52.sortingIndex = 0
    
    let game53 = Game(context: context)
    game53.category = gameCategoryArray[6]
    game53.title = "Biking"
    game53.url = "https://www.wikihow.com/Ride-a-Bicycle"
    game53.favorite = false
    game53.order = 53
    game53.random = Int64(arc4random_uniform(1000))
    game53.selected = false
    game53.sortingIndex = 0
    
    let game54 = Game(context: context)
    game54.category = gameCategoryArray[0]
    game54.title = "Play Musical Instrument(s) and/or Sing"
    game54.url = "https://www.wikihow.com/Make-a-Simple-Musical-Instrument"
    game54.favorite = false
    game54.order = 54
    game54.random = Int64(arc4random_uniform(1000))
    game54.selected = false
    game54.sortingIndex = 0
    
    let game55 = Game(context: context)
    game55.category = gameCategoryArray[6]
    game55.title = "Rollerblade or Skate"
    game55.url = "https://www.wikihow.com/Rollerblade"
    game55.favorite = false
    game55.order = 55
    game55.random = Int64(arc4random_uniform(1000))
    game55.selected = false
    game55.sortingIndex = 0
    
    let game56 = Game(context: context)
    game56.category = gameCategoryArray[9]
    game56.title = "Paint"
    game56.url = "https://www.wikihow.com/Make-Non-Toxic-Paint-for-Kids"
    game56.favorite = false
    game56.order = 56
    game56.random = Int64(arc4random_uniform(1000))
    game56.selected = false
    game56.sortingIndex = 0
    
    let game57 = Game(context: context)
    game57.category = gameCategoryArray[7]
    game57.title = "72 Hour Kit"
    game57.url = "https://www.ready.gov/build-a-kit"
    game57.favorite = false
    game57.order = 57
    game57.random = Int64(arc4random_uniform(1000))
    game57.selected = false
    game57.sortingIndex = 0
    
    let game58 = Game(context: context)
    game58.category = gameCategoryArray[7]
    game58.title = "Yard Work / Gardening / Planting"
    game58.url = "https://www.wikihow.com/Garden"
    game58.favorite = false
    game58.order = 58
    game58.random = Int64(arc4random_uniform(1000))
    game58.selected = false
    game58.sortingIndex = 0
    
    let game59 = Game(context: context)
    game59.category = gameCategoryArray[6]
    game59.title = "Swimming"
    game59.url = "https://www.wikihow.com/Swim"
    game59.favorite = false
    game59.order = 59
    game59.random = Int64(arc4random_uniform(1000))
    game59.selected = false
    game59.sortingIndex = 0
    
    let game60 = Game(context: context)
    game60.category = gameCategoryArray[6]
    game60.title = "Bird Watching"
    game60.url = "https://www.wikihow.com/Bird-Watch"
    game60.favorite = false
    game60.order = 60
    game60.random = Int64(arc4random_uniform(1000))
    game60.selected = false
    game60.sortingIndex = 0
    
    let game61 = Game(context: context)
    game61.category = gameCategoryArray[6]
    game61.title = "Walk"
    game61.url = "https://www.wikihow.com/Walk"
    game61.favorite = false
    game61.order = 61
    game61.random = Int64(arc4random_uniform(1000))
    game61.selected = false
    game61.sortingIndex = 0
    
    let game62 = Game(context: context)
    game62.category = gameCategoryArray[6]
    game62.title = "Pick Berries / Fruit"
    game62.url = "https://www.wikihow.com/Freeze-Blackberries"
    game62.favorite = false
    game62.order = 62
    game62.random = Int64(arc4random_uniform(1000))
    game62.selected = false
    game62.sortingIndex = 0
    
    let game63 = Game(context: context)
    game63.category = gameCategoryArray[8]
    game63.title = "Can Food"
    game63.url = "https://www.wikihow.com/Can-Food"
    game63.favorite = false
    game63.order = 63
    game63.random = Int64(arc4random_uniform(1000))
    game63.selected = false
    game63.sortingIndex = 0
    
    let game64 = Game(context: context)
    game64.category = gameCategoryArray[8]
    game64.title = "Make Desert"
    game64.url = "https://www.wikihow.com/Category:Desserts-and-Sweets"
    game64.favorite = false
    game64.order = 64
    game64.random = Int64(arc4random_uniform(1000))
    game64.selected = false
    game64.sortingIndex = 0
    
    let game65 = Game(context: context)
    game65.category = gameCategoryArray[8]
    game65.title = "Make Dinner"
    game65.url = "https://www.wikihow.com/Make-a-Good-Meal-for-Your-Family-(for-Kids)"
    game65.favorite = false
    game65.order = 65
    game65.random = Int64(arc4random_uniform(1000))
    game65.selected = false
    game65.sortingIndex = 0
    
    let game66 = Game(context: context)
    game66.category = gameCategoryArray[7]
    game66.title = "Share Treats With Someone"
    game66.url = "https://www.wikihow.com/Category:Desserts-and-Sweets"
    game66.favorite = false
    game66.order = 66
    game66.random = Int64(arc4random_uniform(1000))
    game66.selected = false
    game66.sortingIndex = 0
    
    let game67 = Game(context: context)
    game67.category = gameCategoryArray[10]
    game67.title = "Write / Journal"
    game67.url = "https://www.wikihow.com/Write"
    game67.favorite = false
    game67.order = 67
    game67.random = Int64(arc4random_uniform(1000))
    game67.selected = false
    game67.sortingIndex = 0
    
    let game68 = Game(context: context)
    game68.category = gameCategoryArray[5]
    game68.title = "Museum"
    game68.url = "https://www.tripadvisor.com/Attractions"
    game68.favorite = false
    game68.order = 68
    game68.random = Int64(arc4random_uniform(1000))
    game68.selected = false
    game68.sortingIndex = 0
    
    let game69 = Game(context: context)
    game69.category = gameCategoryArray[5]
    game69.title = "Aquarium"
    game69.url = "https://www.tripadvisor.com/Attractions"
    game69.favorite = false
    game69.order = 69
    game69.random = Int64(arc4random_uniform(1000))
    game69.selected = false
    game69.sortingIndex = 0
    
    let game70 = Game(context: context)
    game70.category = gameCategoryArray[3]
    game70.title = "Poker"
    game70.url = "https://www.wikihow.com/Deal-Poker"
    game70.favorite = false
    game70.order = 70
    game70.random = Int64(arc4random_uniform(1000))
    game70.selected = false
    game70.sortingIndex = 0
    
    let game71 = Game(context: context)
    game71.category = gameCategoryArray[3]
    game71.title = "War"
    game71.url = "https://www.wikihow.com/Play-War-(Card-Game)"
    game71.favorite = false
    game71.order = 71
    game71.random = Int64(arc4random_uniform(1000))
    game71.selected = false
    game71.sortingIndex = 0
    
    let game72 = Game(context: context)
    game72.category = gameCategoryArray[3]
    game72.title = "Go-Fish"
    game72.url = "https://www.wikihow.com/Play-Go-Fish-with-Any-Cards"
    game72.favorite = false
    game72.order = 72
    game72.random = Int64(arc4random_uniform(1000))
    game72.selected = false
    game72.sortingIndex = 0
    
    let game73 = Game(context: context)
    game73.category = gameCategoryArray[3]
    game73.title = "Hearts"
    game73.url = "https://www.wikihow.com/Play-Hearts"
    game73.favorite = false
    game73.order = 73
    game73.random = Int64(arc4random_uniform(1000))
    game73.selected = false
    game73.sortingIndex = 0
    
    let game74 = Game(context: context)
    game74.category = gameCategoryArray[3]
    game74.title = "Spades"
    game74.url = "https://www.wikihow.com/Play-Spades"
    game74.favorite = true
    game74.order = 74
    game74.random = Int64(arc4random_uniform(1000))
    game74.selected = false
    game74.sortingIndex = 0
    
    let game75 = Game(context: context)
    game75.category = gameCategoryArray[3]
    game75.title = "Five-Card Draw"
    game75.url = "https://drive.google.com/open?id=1hV7xkGPC8slw6dlWRNlHqbLznyxm9W4q"
    game75.favorite = true
    game75.order = 75
    game75.random = Int64(arc4random_uniform(1000))
    game75.selected = false
    game75.sortingIndex = 0
    
    let game76 = Game(context: context)
    game76.category = gameCategoryArray[3]
    game76.title = "21 - Blackjack"
    game76.url = "https://www.wikihow.com/Play-Blackjack"
    game76.favorite = true
    game76.order = 76
    game76.random = Int64(arc4random_uniform(1000))
    game76.selected = false
    game76.sortingIndex = 0
    
    let game77 = Game(context: context)
    game77.category = gameCategoryArray[3]
    game77.title = "Texas hold'em"
    game77.url = "https://www.wikihow.com/Shuffle-and-Deal-Texas-Holdem"
    game77.favorite = true
    game77.order = 77
    game77.random = Int64(arc4random_uniform(1000))
    game77.selected = false
    game77.sortingIndex = 0
    
    let game78 = Game(context: context)
    game78.category = gameCategoryArray[2]
    game78.title = "Snakes and Ladders"
    game78.url = "http://amzn.to/2ejq9rD"
    game78.favorite = true
    game78.order = 78
    game78.random = Int64(arc4random_uniform(1000))
    game78.selected = false
    game78.sortingIndex = 0
    
    let game79 = Game(context: context)
    game79.category = gameCategoryArray[2]
    game79.title = "Candyland"
    game79.url = "http://amzn.to/2ejmEBs"
    game79.favorite = true
    game79.order = 79
    game79.random = Int64(arc4random_uniform(1000))
    game79.selected = false
    game79.sortingIndex = 0
    
    let game80 = Game(context: context)
    game80.category = gameCategoryArray[2]
    game80.title = "Yahtzee!"
    game80.url = "http://amzn.to/2e7cXGT"
    game80.favorite = true
    game80.order = 80
    game80.random = Int64(arc4random_uniform(1000))
    game80.selected = false
    game80.sortingIndex = 0
    
    let game81 = Game(context: context)
    game81.category = gameCategoryArray[3]
    game81.title = "Uno"
    game81.url = "http://amzn.to/2e8QQlS"
    game81.favorite = true
    game81.order = 81
    game81.random = Int64(arc4random_uniform(1000))
    game81.selected = false
    game81.sortingIndex = 0
    
    let game82 = Game(context: context)
    game82.category = gameCategoryArray[2]
    game82.title = "Sorry!"
    game82.url = "http://amzn.to/2euN2r4"
    game82.favorite = false
    game82.order = 82
    game82.random = Int64(arc4random_uniform(1000))
    game82.selected = false
    game82.sortingIndex = 0
    
    let game83 = Game(context: context)
    game83.category = gameCategoryArray[2]
    game83.title = "Pictionary"
    game83.url = "http://amzn.to/2etoKfL"
    game83.favorite = false
    game83.order = 83
    game83.random = Int64(arc4random_uniform(1000))
    game83.selected = false
    game83.sortingIndex = 0
    
    let game84 = Game(context: context)
    game84.category = gameCategoryArray[2]
    game84.title = "Dominoes"
    game84.url = "http://amzn.to/2emDz5n"
    game84.favorite = false
    game84.order = 84
    game84.random = Int64(arc4random_uniform(1000))
    game84.selected = false
    game84.sortingIndex = 0
    
    let game85 = Game(context: context)
    game85.category = gameCategoryArray[2]
    game85.title = "The Game of Life"
    game85.url = "http://amzn.to/2dP9U3a"
    game85.favorite = false
    game85.order = 85
    game85.random = Int64(arc4random_uniform(1000))
    game85.selected = false
    game85.sortingIndex = 0
    
    let game86 = Game(context: context)
    game86.category = gameCategoryArray[2]
    game86.title = "Trivial Pursuit"
    game86.url = "http://amzn.to/2eSFkKa"
    game86.favorite = false
    game86.order = 86
    game86.random = Int64(arc4random_uniform(1000))
    game86.selected = false
    game86.sortingIndex = 0
    
    let game87 = Game(context: context)
    game87.category = gameCategoryArray[2]
    game87.title = "Taboo"
    game87.url = "http://amzn.to/2e92vRI"
    game87.favorite = false
    game87.order = 87
    game87.random = Int64(arc4random_uniform(1000))
    game87.selected = false
    game87.sortingIndex = 0
    
    let game88 = Game(context: context)
    game88.category = gameCategoryArray[2]
    game88.title = "Ticket to Ride"
    game88.url = "http://amzn.to/2e2hE3F"
    game88.favorite = false
    game88.order = 88
    game88.random = Int64(arc4random_uniform(1000))
    game88.selected = false
    game88.sortingIndex = 0
    
    let game89 = Game(context: context)
    game89.category = gameCategoryArray[2]
    game89.title = "Canasta"
    game89.url = "http://amzn.to/2ev2Nyh"
    game89.favorite = false
    game89.order = 89
    game89.random = Int64(arc4random_uniform(1000))
    game89.selected = false
    game89.sortingIndex = 0
    
    let game90 = Game(context: context)
    game90.category = gameCategoryArray[2]
    game90.title = "Clue"
    game90.url = "http://amzn.to/2ev2kfs"
    game90.favorite = false
    game90.order = 90
    game90.random = Int64(arc4random_uniform(1000))
    game90.selected = false
    game90.sortingIndex = 0
    
    let game91 = Game(context: context)
    game91.category = gameCategoryArray[2]
    game91.title = "Scrabble"
    game91.url = "http://amzn.to/2etEAab"
    game91.favorite = false
    game91.order = 91
    game91.random = Int64(arc4random_uniform(1000))
    game91.selected = false
    game91.sortingIndex = 0
    
    let game92 = Game(context: context)
    game92.category = gameCategoryArray[2]
    game92.title = "Apples to Apples"
    game92.url = "http://amzn.to/2ev21B4"
    game92.favorite = false
    game92.order = 92
    game92.random = Int64(arc4random_uniform(1000))
    game92.selected = false
    game92.sortingIndex = 0
    
    let game93 = Game(context: context)
    game93.category = gameCategoryArray[2]
    game93.title = "Settlers of Cataan"
    game93.url = "http://amzn.to/2etFPWW"
    game93.favorite = false
    game93.order = 93
    game93.random = Int64(arc4random_uniform(1000))
    game93.selected = false
    game93.sortingIndex = 0
    
    let game94 = Game(context: context)
    game94.category = gameCategoryArray[2]
    game94.title = "Risk"
    game94.url = "http://amzn.to/2e96Lkc"
    game94.favorite = false
    game94.order = 94
    game94.random = Int64(arc4random_uniform(1000))
    game94.selected = false
    game94.sortingIndex = 0
    
    let game95 = Game(context: context)
    game95.category = gameCategoryArray[3]
    game95.title = "Bridge"
    game95.url = "https://www.wikihow.com/Play-Bridge"
    game95.favorite = false
    game95.order = 95
    game95.random = Int64(arc4random_uniform(1000))
    game95.selected = false
    game95.sortingIndex = 0
    
    let game96 = Game(context: context)
    game96.category = gameCategoryArray[1]
    game96.title = "Mafia"
    game96.url = "https://www.wikihow.com/Play-Mafia"
    game96.favorite = false
    game96.order = 96
    game96.random = Int64(arc4random_uniform(1000))
    game96.selected = false
    game96.sortingIndex = 0
    
    let game97 = Game(context: context)
    game97.category = gameCategoryArray[2]
    game97.title = "Monopoly"
    game97.url = "http://amzn.to/2eSRov7"
    game97.favorite = false
    game97.order = 97
    game97.random = Int64(arc4random_uniform(1000))
    game97.selected = false
    game97.sortingIndex = 0
    
    let game98 = Game(context: context)
    game98.category = gameCategoryArray[3]
    game98.title = "Farkle"
    game98.url = "https://www.wikihow.com/Play-Farkle"
    game98.favorite = true
    game98.order = 98
    game98.random = Int64(arc4random_uniform(1000))
    game98.selected = false
    game98.sortingIndex = 0
    
    let game99 = Game(context: context)
    game99.category = gameCategoryArray[3]
    game99.title = "Phase 10"
    game99.url = "https://www.amazon.com/Phase-Card-Game-Styles-Vary/dp/B004MU9V8Q/ref=sr_1_2?s=toys-and-games&ie=UTF8&qid=1512765083&sr=1-2&keywords=phase+10"
    game99.favorite = false
    game99.order = 99
    game99.random = Int64(arc4random_uniform(1000))
    game99.selected = false
    game99.sortingIndex = 0
    
    let game100 = Game(context: context)
    game100.category = gameCategoryArray[3]
    game100.title = "Skip-Bo"
    game100.url = "https://www.amazon.com/Mattel-42050-SKIP-Card-Game/dp/B0000205XI/ref=sr_1_4?s=toys-and-games&ie=UTF8&qid=1512765192&sr=1-4&keywords=skip+bo"
    game100.favorite = false
    game100.order = 100
    game100.random = Int64(arc4random_uniform(1000))
    game100.selected = false
    game100.sortingIndex = 0
    
    let game101 = Game(context: context)
    game101.category = gameCategoryArray[6]
    game101.title = "Family Exercise"
    game101.url = "https://www.wikihow.com/Exercise-Together-As-a-Family"
    game101.favorite = false
    game101.order = 101
    game101.random = Int64(arc4random_uniform(1000))
    game101.selected = false
    game101.sortingIndex = 0
    
    let game102 = Game(context: context)
    game102.category = gameCategoryArray[10]
    game102.title = "Meditation"
    game102.url = "https://www.wikihow.com/Meditate-for-Beginners"
    game102.favorite = true
    game102.order = 102
    game102.random = Int64(arc4random_uniform(1000))
    game102.selected = false
    game102.sortingIndex = 0
    
    let game103 = Game(context: context)
    game103.category = gameCategoryArray[10]
    game103.title = "Yoga"
    game103.url = "https://www.wikihow.com/Do-Yoga-for-Absolute-Beginners"
    game103.favorite = true
    game103.order = 103
    game103.random = Int64(arc4random_uniform(1000))
    game103.selected = false
    game103.sortingIndex = 0
    
    let game104 = Game(context: context)
    game104.category = gameCategoryArray[9]
    game104.title = "Make Christmas Ornaments"
    game104.url = "https://www.wikihow.com/Make-a-Christmas-Tree-Ornament"
    game104.favorite = false
    game104.order = 104
    game104.random = Int64(arc4random_uniform(1000))
    game104.selected = false
    game104.sortingIndex = 0
    
    let game105 = Game(context: context)
    game105.category = gameCategoryArray[7]
    game105.title = "Service Project"
    game105.url = "https://www.justserve.org/"
    game105.favorite = false
    game105.order = 105
    game105.random = Int64(arc4random_uniform(1000))
    game105.selected = false
    game105.sortingIndex = 0
    
    let game106 = Game(context: context)
    game106.category = gameCategoryArray[6]
    game106.title = "Fishing"
    game106.url = "https://www.wikihow.com/Fish"
    game106.favorite = false
    game106.order = 106
    game106.random = Int64(arc4random_uniform(1000))
    game106.selected = false
    game106.sortingIndex = 0
    
    let game107 = Game(context: context)
    game107.category = gameCategoryArray[0]
    game107.title = "Take Photographs"
    game107.url = "https://www.wikihow.com/Take-Better-Photographs"
    game107.favorite = false
    game107.order = 107
    game107.random = Int64(arc4random_uniform(1000))
    game107.selected = false
    game107.sortingIndex = 0
    
    let game108 = Game(context: context)
    game108.category = gameCategoryArray[1]
    game108.title = "Role-Playing / Dress-Up"
    game108.url = "https://www.wikihow.com/Roleplay"
    game108.favorite = false
    game108.order = 108
    game108.random = Int64(arc4random_uniform(1000))
    game108.selected = false
    game108.sortingIndex = 0
    
    let game109 = Game(context: context)
    game109.category = gameCategoryArray[2]
    game109.title = "Chess / Checkers"
    game109.url = "https://www.wikihow.com/Play-Chess"
    game109.favorite = false
    game109.order = 109
    game109.random = Int64(arc4random_uniform(1000))
    game109.selected = false
    game109.sortingIndex = 0
    
    let game110 = Game(context: context)
    game110.category = gameCategoryArray[1]
    game110.title = "Charades"
    game110.url = "https://www.wikihow.com/Play-Charades"
    game110.favorite = true
    game110.order = 110
    game110.random = Int64(arc4random_uniform(1000))
    game110.selected = false
    game110.sortingIndex = 0
    
    let game111 = Game(context: context)
    game111.category = gameCategoryArray[1]
    game111.title = "Murder Mystery"
    game111.url = "https://www.wikihow.com/Host-a-Murder-Mystery-Party"
    game111.favorite = false
    game111.order = 111
    game111.random = Int64(arc4random_uniform(1000))
    game111.selected = false
    game111.sortingIndex = 0
    
    let game112 = Game(context: context)
    game112.category = gameCategoryArray[7]
    game112.title = "Car Wash"
    game112.url = "https://www.wikihow.com/Wash-a-Car-by-Hand"
    game112.favorite = false
    game112.order = 112
    game112.random = Int64(arc4random_uniform(1000))
    game112.selected = false
    game112.sortingIndex = 0
    
    let game113 = Game(context: context)
    game113.category = gameCategoryArray[1]
    game113.title = "Movie Night"
    game113.url = "https://www.rottentomatoes.com/"
    game113.favorite = false
    game113.order = 113
    game113.random = Int64(arc4random_uniform(1000))
    game113.selected = false
    game113.sortingIndex = 0
    
    let game114 = Game(context: context)
    game114.category = gameCategoryArray[6]
    game114.title = "Golf / Miniature Golf"
    game114.url = "https://www.wikihow.com/Learn-to-Play-Golf"
    game114.favorite = false
    game114.order = 114
    game114.random = Int64(arc4random_uniform(1000))
    game114.selected = false
    game114.sortingIndex = 0
    
    let game115 = Game(context: context)
    game115.category = gameCategoryArray[5]
    game115.title = "Shopping"
    game115.url = "https://www.wikihow.com/Grocery-Shop-With-Kids"
    game115.favorite = false
    game115.order = 115
    game115.random = Int64(arc4random_uniform(1000))
    game115.selected = false
    game115.sortingIndex = 0
    
    let game116 = Game(context: context)
    game116.category = gameCategoryArray[1]
    game116.title = "Puzzle"
    game116.url = "https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=puzzles"
    game116.favorite = false
    game116.order = 116
    game116.random = Int64(arc4random_uniform(1000))
    game116.selected = false
    game116.sortingIndex = 0
    
    let game117 = Game(context: context)
    game117.category = gameCategoryArray[10]
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
    getAllTasks()
    let treat1 = Treat(context: context)
    treat1.category = treatsCategoryArray[0]
    treat1.title = "Surprise!"
    treat1.url = "https://drive.google.com/open?id=1vdnjN6aNW4iRC1ljf79MBELI2-eW0BHe"
    treat1.favorite = true
    treat1.order = 1
    treat1.random = Int64(arc4random_uniform(1000))
    treat1.selected = false
    treat1.sortingIndex = 0
    
    let treat2 = Treat(context: context)
    treat2.category = treatsCategoryArray[1]
    treat2.selectedOne = taskTreat
    treat2.title = "Chocolate Chip Cookies"
    treat2.url = "https://pin.it/digy53rpktcbza"
    treat2.favorite = true
    treat2.order = 2
    treat2.random = Int64(arc4random_uniform(1000))
    treat2.selected = true
    treat2.sortingIndex = 0
    
    let treat3 = Treat(context: context)
    treat3.category = treatsCategoryArray[0]
    treat3.title = "S'mores"
    treat3.url = "https://pin.it/k2wn4tvrckyfh4"
    treat3.favorite = true
    treat3.order = 3
    treat3.random = Int64(arc4random_uniform(1000))
    treat3.selected = false
    treat3.sortingIndex = 0
    
    let treat4 = Treat(context: context)
    treat4.category = treatsCategoryArray[2]
    treat4.title = "Brownies"
    treat4.url = "https://pin.it/lrk44ktgy5juab"
    treat4.favorite = true
    treat4.order = 4
    treat4.random = Int64(arc4random_uniform(1000))
    treat4.selected = false
    treat4.sortingIndex = 0
    
    let treat5 = Treat(context: context)
    treat5.category = treatsCategoryArray[3]
    treat5.title = "Chocolate Cake"
    treat5.url = "https://pin.it/flg2akxci43cu3"
    treat5.favorite = false
    treat5.order = 5
    treat5.random = Int64(arc4random_uniform(1000))
    treat5.selected = false
    treat5.sortingIndex = 0
    
    let treat6 = Treat(context: context)
    treat6.category = treatsCategoryArray[3]
    treat6.title = "Cookies & Cream Cupcakes"
    treat6.url = "https://pin.it/g2rouxg72kxakd"
    treat6.favorite = false
    treat6.order = 6
    treat6.random = Int64(arc4random_uniform(1000))
    treat6.selected = false
    treat6.sortingIndex = 0
    
    let treat7 = Treat(context: context)
    treat7.category = treatsCategoryArray[4]
    treat7.title = "Apple Pie"
    treat7.url = "https://pin.it/h3tqjhnddu2zfx"
    treat7.favorite = false
    treat7.order = 7
    treat7.random = Int64(arc4random_uniform(1000))
    treat7.selected = false
    treat7.sortingIndex = 0
    
    let treat8 = Treat(context: context)
    treat8.category = treatsCategoryArray[5]
    treat8.title = "Strawberry Ice Cream"
    treat8.url = "https://pin.it/4j3vfkisqwevkh"
    treat8.favorite = false
    treat8.order = 8
    treat8.random = Int64(arc4random_uniform(1000))
    treat8.selected = false
    treat8.sortingIndex = 0
    
    let treat9 = Treat(context: context)
    treat9.category = treatsCategoryArray[6]
    treat9.title = "Strawberry Coconut Shake"
    treat9.url = "https://pin.it/gn5hg2zde2cws5"
    treat9.favorite = false
    treat9.order = 9
    treat9.random = Int64(arc4random_uniform(1000))
    treat9.selected = false
    treat9.sortingIndex = 0
    
    let treat10 = Treat(context: context)
    treat10.category = treatsCategoryArray[7]
    treat10.title = "Popsicles"
    treat10.url = "https://pin.it/52rngnfkjyh56l"
    treat10.favorite = false
    treat10.order = 10
    treat10.random = Int64(arc4random_uniform(1000))
    treat10.selected = false
    treat10.sortingIndex = 0
    
    let treat11 = Treat(context: context)
    treat11.category = treatsCategoryArray[8]
    treat11.title = "Chocolate Pudding"
    treat11.url = "https://pin.it/ohboixv2afu3xf"
    treat11.favorite = false
    treat11.order = 11
    treat11.random = Int64(arc4random_uniform(1000))
    treat11.selected = false
    treat11.sortingIndex = 0
    
    let treat12 = Treat(context: context)
    treat12.category = treatsCategoryArray[9]
    treat12.title = "Butterfinders"
    treat12.url = "https://pin.it/3ikto7zqomaxtl"
    treat12.favorite = false
    treat12.order = 12
    treat12.random = Int64(arc4random_uniform(1000))
    treat12.selected = false
    treat12.sortingIndex = 0
    
    let treat13 = Treat(context: context)
    treat13.category = treatsCategoryArray[10]
    treat13.title = "Popcorn"
    treat13.url = "https://pin.it/ucx26xitl5tpvt"
    treat13.favorite = true
    treat13.order = 13
    treat13.random = Int64(arc4random_uniform(1000))
    treat13.selected = false
    treat13.sortingIndex = 0
    
    ad.saveContext()
}

