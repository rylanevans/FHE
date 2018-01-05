//
//  Constants.swift
//  FHE
//
//  Created by Rylan Evans on 10/4/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation

// MARK: - IAP Identifiers

let IAP_FHE_ID_thankYou = "com.FHE.thankYou"
let IAP_FHE_ID_likeIt = "com.FHE.likeIt"
let IAP_FHE_ID_loveIt = "com.FHE.loveIt"
let IAP_FHE_ID_amazing = "com.FHE.amazing"
let IAP_HIDE_ADS_IN = "com.FHE.hideAds"

// MARK: - Notification Identifiers

let IAPServicePurchaseNotification = "IAPServicePurchaseNotification"
let IAPServiceRestoreNotification = "IAPServiceRestoreNotification"
let IAPServiceFailureNotification = "IAPServiceFailureNotification"

// MARK: - Universal Arrays

let scripturesDictionary = ["Genesis": ["gen", 1], "Exodus": ["ex", 2], "Leviticus": ["lev", 3], "Numbers": ["num", 4], "Deuteronomy": ["deut", 5], "Joshua": ["josh", 6], "Judges": ["judg", 7], "Ruth": ["ruth", 8], "1 Samuel": ["1-sam", 9], "2 Samuel": ["2-sam", 10], "1 Kings": ["1-kgs", 11], "2 Kings": ["2-kgs", 12], "1 Chronicles": ["1-chr", 13], "2 Chronicles": ["2-chr", 14], "Ezra": ["ezra", 15], "Nehemiah": ["neh", 16], "Esther": ["esth", 17], "Job": ["job", 18], "Psalms": ["ps", 19], "Proverbs": ["prov", 20], "Ecclesiastes": ["eccl", 21], "Solomon's Song": ["song", 22], "Isaiah": ["isa", 23], "Jeremiah": ["jer", 24], "Lamentations": ["lam", 25], "Ezekiel": ["ezek", 26], "Daniel": ["dan", 27], "Hosea": ["hosea", 28], "Joel": ["joel", 29], "Amos": ["amos", 30], "Obadiah": ["obad", 31], "Jonah": ["jonah", 32], "Micah": ["micah", 33], "Nahum": ["nahum", 34], "Habakkuk": ["hab", 35], "Zephaniah": ["zeph", 36], "Haggai": ["hag", 37], "Zechariah": ["zech", 38], "Malachi": ["mal", 39], "Matthew": ["matt", 40], "Mark": ["mark", 41], "Luke": ["luke", 42], "John": ["john", 43], "Acts": ["acts", 44], "Romans": ["rom", 45], "1 Corinthians": ["1-cor", 46], "2 Corinthians": ["2-cor", 47], "Galatians": ["gal", 48], "Ephesians": ["eph", 49], "Philippians": ["philip", 50], "Colossians": ["col", 51], "1 Thessalonians": ["1-thes", 52], "2 Thessalonians": ["2-thes", 53], "1 Timothy": ["1-tim", 54], "2 Timothy": ["2-tim", 55], "Titus": ["titus", 56], "Philemon": ["philem", 57], "Hebrews": ["heb", 58], "James": ["james", 59], "1 Peter": ["1-pet", 60], "2 Peter": ["2-pet", 61], "1 John": ["1-jn", 62], "2 John": ["2-jn", 63], "3 John": ["3-jn", 64], "Jude": ["jude", 65], "Revelation": ["rev", 66], "1 Nephi": ["1-ne", 67], "2 Nephi": ["2-ne", 68], "Jacob": ["jacob", 69], "Enos": ["enos", 70], "Jarom": ["jarom", 71], "Omni": ["omni", 72], "Words of Mormon": ["w-of-m", 73], "Mosiah": ["mosiah", 74], "Alma": ["alma", 75], "Helaman": ["hel", 76], "3 Nephi": ["3-ne", 77], "4 Nephi": ["4-ne", 78], "Mormon": ["morm", 79], "Ether": ["ether", 80], "Moroni": ["moro", 81], "Doctrine and Covenants": ["dc", 82], "Moses": ["moses", 83], "Abraham": ["abr", 84], "Joseph Smith--Matthew": ["js-m", 85], "Joseph Smith--History": ["js-h", 86], "Articles of Faith": ["a-of-f", 87]]

let defaultScriptureDictionary = ["gen": 1, "ex": 2, "lev": 3, "num": 4, "deut": 5, "josh": 6, "judg": 7, "ruth": 8, "1-sam": 9, "2-sam": 10, "1-kgs": 11, "2-kgs": 12, "1-chr": 13, "2-chr": 14, "ezra": 15, "neh": 16, "esth": 17, "job": 18, "ps": 19, "prov": 20, "eccl": 21, "song": 22, "isa": 23, "jer": 24, "lam": 25, "ezek": 26, "dan": 27, "hosea": 28, "joel": 29, "amos": 30, "obad": 31, "jonah": 32, "micah": 33, "nahum": 34, "hab": 35, "zeph": 36, "hag": 37, "zech": 38, "mal": 39, "matt": 40, "mark": 41, "luke": 42, "john": 43, "acts": 44, "rom": 45, "1-cor": 46, "2-cor": 47, "gal": 48, "eph": 49, "philip": 50, "col": 51, "1-thes": 52, "2-thes": 53, "1-tim": 54, "2-tim": 55, "titus": 56, "philem": 57, "heb": 58, "james": 59, "1-pet": 60, "2-pet": 61, "1-jn": 62, "2-jn": 63, "3-jn": 64, "jude": 65, "rev": 66, "1-ne": 67, "2-ne": 68, "jacob": 69, "enos": 70, "jarom": 71, "omni": 72, "w-of-m": 73, "mosiah": 74, "alma": 75, "hel": 76, "3-ne": 77, "4-ne": 78, "morm": 79, "ether": 80, "moro": 81, "dc": 82, "moses": 83, "abr": 84, "js-m": 85, "js-h": 86, "a-of-f": 87]

let scriptureOrderDictionary = [1: "GENESIS:", 2: "EXODUS:", 3: "LEVITICUS:", 4: "NUMBERS:", 5: "DEUTERONOMY:", 6: "JOSHUA:", 7: "JUDGES:", 8: "RUTH:", 9: "1 SAMUEL:", 10: "2 SAMUAL:", 11: "1 KINGS:", 12: "2 KINGS:", 13: "1 CHRONICLES:", 14: "2 CHRONICLES:", 15: "EZRA:", 16: "NEHEMIAH:", 17: "ESTHER:", 18: "JOB:", 19: "PSALMS:", 20: "PROVERBS:", 21: "ECCLESIASTES:", 22: "SOLOMON'S SONG:", 23: "ISAIAH:", 24: "JEREMIAH:", 25: "LAMENTATIONS:", 26: "EZEKIEL:", 27: "DANIEL:", 28: "HOSEA:", 29: "JOEL:", 30: "AMOS:", 31: "OBADIAH:", 32: "JONAH:", 33: "MICAH:", 34: "NAHUM:", 35: "HABAKKUK:", 36: "ZAPHANIAH:", 37: "HAGGAI:", 38: "ZECHARIAH:", 39: "MALACHI:", 40: "MATTHEW:", 41: "MARK:", 42: "LUKE:", 43: "JOHN:", 44: "ACTS:", 45: "ROMANS:", 46: "1 CORINTHIANS:", 47: "2 CORINTHIANS:", 48: "GALATIANS:", 49: "EPHESIANS:", 50: "PHILIPPIANS:", 51: "COLOSSIANS:", 52: "1 THESSALONIANS:", 53: "2 THESSALONIANS:", 54: "1 TIMOTHY:", 55: "2 TIMOTHY:", 56: "TITUS:", 57: "PHILEMON:", 58: "HEBREWS:", 59: "JAMES:", 60: "1 PETER:", 61: "2 PETER:", 62: "1 JOHN:", 63: "2 JOHN:", 64: "3 JOHN:", 65: "JUDE:", 66: "REVELATION:", 67: "1 NEPHI:", 68: "2 NEPHI:", 69: "JACOB:", 70: "ENOS:", 71: "JAROM:", 72: "OMNI:", 73: "WORDS OF MORMON:", 74: "MOSIAH:", 75: "ALMA:", 76: "HELAMAN:", 77: "3 NEPHI:", 78: "4 NEPHI:", 79: "MORMON:", 80: "ETHER:", 81: "MORONI:", 82: "DOCTRINE & COVENANTS:", 83: "MOSES:", 84: "ABRAHAM:", 85: "JOSEPH SMITH MATTHEW:", 86: "JOSEPH SMITH HISTORY:", 87: "ARTICLES OF FAITH:"]

let lessonCategoryArray = ["Spiritual", "Temporal"]

let lessonAspectArray = ["Emotional", "Financial", "Intellectual", "Relational/Social", "Occupational", "Physical", "Environmental", "Spiritual"]

let lessonTopicsArray = [
    "Heavenly Father",
    "Jesus Christ",
    "Holy Ghost",
    "Plan of Salvation",
    "Birth of our Savior",
    "Atonement",
    "Forgiveness",
    "Resurrection",
    "Christlike Attributes",
    "Commandments",
    "Scriptures",
    "Restoration",
    "Principles & Ordinances",
    "Endure to the end",
    "Perfect the Saints",
    "Proclaim the Gospel",
    "Redeem the Dead",
    "Care for the Poor & Needy",
    "Spiritual"
]

let songBooksArray = ["Children's", "Hymn", "Video", "Other"]

//["Children's Songbook", "Hymns"]

let scriptureVolumesArray = ["Old Testament", "New Testament", "Book of Mormon", "Doctrine and Covenants", "Pearl of Great Price"]

let scriptureVolumesDictionary = ["Old Testament": "ot", "New Testament": "nt", "Book of Mormon": "bofm", "Doctrine and Covenants": "dc-testament", "Pearl of Great Price": "pgp"]

let scriptureOTBooksArray = [
    "Amos",
    "1 Chronicles",
    "2 Chronicles",
    "Daniel",
    "Deuteronomy",
    "Ecclesiastes",
    "Esther",
    "Exodus",
    "Ezekiel",
    "Ezra",
    "Genesis",
    "Habakkuk",
    "Haggai",
    "Hosea",
    "Isaiah",
    "Jeremiah",
    "Job",
    "Joel",
    "Jonah",
    "Joshua",
    "Judges",
    "1 Kings",
    "2 Kings",
    "Lamentations",
    "Leviticus",
    "Malachi",
    "Micah",
    "Nahum",
    "Nehemiah",
    "Numbers",
    "Obadiah",
    "Proverbs",
    "Psalms",
    "Ruth",
    "1 Samuel",
    "2 Samuel",
    "Solomon's Song",
    "Zechariah",
    "Zephaniah"
]

let scriptureNTBooksArray = [
    "Acts",
    "Colossians",
    "1 Corinthians",
    "2 Corinthians",
    "Ephesians",
    "Galatians",
    "Hebrews",
    "James",
    "John",
    "1 John",
    "2 John",
    "3 John",
    "Jude",
    "Luke",
    "Mark",
    "Matthew",
    "1 Peter",
    "2 Peter",
    "Philemon",
    "Philippians",
    "Revelation",
    "Romans",
    "1 Thessalonians",
    "2 Thessalonians",
    "1 Timothy",
    "2 Timothy",
    "Titus"
]

let scriptureBofMBooksArray = [
    "Alma",
    "Enos",
    "Ether",
    "Helaman",
    "Jacob",
    "Jarom",
    "Mormon",
    "Moroni",
    "Mosiah",
    "1 Nephi",
    "2 Nephi",
    "3 Nephi",
    "4 Nephi",
    "Omni",
    "Words of Mormon"
]

let scriptureDCBooksArray = ["Doctrine and Covenants"]

let scripturePGPBooksArray = [
    "Abraham",
    "Articles of Faith",
    "Joseph Smith--History",
    "Joseph Smith--Matthew",
    "Moses"
]

let scriptureAllBooksArray = [
    "Amos",
    "1 Chronicles",
    "2 Chronicles",
    "Daniel",
    "Deuteronomy",
    "Ecclesiastes",
    "Esther",
    "Exodus",
    "Ezekiel",
    "Ezra",
    "Genesis",
    "Habakkuk",
    "Haggai",
    "Hosea",
    "Isaiah",
    "Jeremiah",
    "Job",
    "Joel",
    "Jonah",
    "Joshua",
    "Judges",
    "1 Kings",
    "2 Kings",
    "Lamentations",
    "Leviticus",
    "Malachi",
    "Micah",
    "Nahum",
    "Nehemiah",
    "Numbers",
    "Obadiah",
    "Proverbs",
    "Psalms",
    "Ruth",
    "1 Samuel",
    "2 Samuel",
    "Solomon's Song",
    "Zechariah",
    "Zephaniah",
    "Acts",
    "Colossians",
    "1 Corinthians",
    "2 Corinthians",
    "Ephesians",
    "Galatians",
    "Hebrews",
    "James",
    "John",
    "1 John",
    "2 John",
    "3 John",
    "Jude",
    "Luke",
    "Mark",
    "Matthew",
    "1 Peter",
    "2 Peter",
    "Philemon",
    "Philippians",
    "Revelation",
    "Romans",
    "1 Thessalonians",
    "2 Thessalonians",
    "1 Timothy",
    "2 Timothy",
    "Titus",
    "Alma",
    "Enos",
    "Ether",
    "Helaman",
    "Jacob",
    "Jarom",
    "Mormon",
    "Moroni",
    "Mosiah",
    "1 Nephi",
    "2 Nephi",
    "3 Nephi",
    "4 Nephi",
    "Omni",
    "Words of Mormon",
    "Doctrine and Covenants",
    "Abraham",
    "Articles of Faith",
    "Joseph Smith--History",
    "Joseph Smith--Matthew",
    "Moses"
]

let gameCategoryArray = [
    "Other",
    "Classic",
    "Board Game",
    "Cards",
    "Team Sport",
    "Field Trip",
    "Outdoor",
    "Service",
    "Baking",
    "Crafts",
    "Mindfullness"
]

let treatsCategoryArray = [
    "Other",
    "Cookie",
    "Brownie",
    "Cake",
    "Pie",
    "Ice Cream",
    "Shake",
    "Popsicle",
    "Pudding",
    "Candy",
    "Snack",
]
