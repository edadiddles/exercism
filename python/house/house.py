def recite(start_verse, end_verse):
    lines = [
            ("house that Jack built", ""),
            ("malt", " that lay in the "),
            ("rat", " that ate the "),
            ("cat", " that killed the "),
            ("dog", " that worried the "),
            ("cow with the crumpled horn", " that tossed the "),
            ("maiden all forlorn", " that milked the "),
            ("man all tattered and torn", " that kissed the "),
            ("priest all shaven and shorn", " that married the "),
            ("rooster that crowed in the morn", " that woke the "),
            ("farmer sowing his corn", " that kept the "),
            ("horse and the hound and the horn", " that belonged to the "),
        ]

    verses = []
    while start_verse <= end_verse:
        n = start_verse-1
        verse = "This is the "
        while n >= 0:
            verse += lines[n][0] + lines[n][1]
            n -= 1

        verse += "."
        verses.append(verse)
        start_verse += 1

    return verses


