module Government.Data (all, governmentForm) where


import Effect.Factory exposing (..)
import Government exposing (Government, GovernmentForm(..))


all : List Government
all =
  [
    -- Autocracies
    { name = "Military Dictatorship"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/4/4c/Military_Dictatorship.png/63px-Military_Dictatorship.png"
    , form' = Autocracy
    , description = "This government is a militaristic form of autocracy, with the ruler serving as the undisputed head of the military which is firmly in control of the state apparatus."
    , rulerTitle = "Grand Marshal"
    , unlockedIf = ["Militarist", "Fanatic Militarist"]
    , lockedIf = ["Individualist", "Fanatic Individualist"]
    , effects =
        [ fleetSizeLimit 10
        , shipUpkeep -10
        , simpleEffect "Can build an oversized ship"
        , simpleEffect "Admirals/generals are eligible for rulership"
        ]
    }
  , { name = "Divine Mandate"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/7/7f/Divine_Mandate.png/63px-Divine_Mandate.png"
    , form' = Autocracy
    , description = "This government is a spiritualistic form of autocracy, where the ruler is treated as a divine symbol. Organized religion is widely employed in support of the state apparatus."
    , rulerTitle = "Archprophet"
    , unlockedIf = ["Spiritualist", "Fanatic Spiritualist"]
    , lockedIf = ["Individualist", "Fanatic Individualist"]
    , effects =
        [ slaveryTolerance 50
        , warTolerance 50
        , simpleEffect "Can build a mausoleum, which grants -10% ethics divergence on the planet on which it is built"
        ]
    }
  , { name = "Despotic Hegemony"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/a/a7/Despotic_Hegemony.png/63px-Despotic_Hegemony.png"
    , form' = Autocracy
    , description = "This government is a materialistic form of autocracy, where citizens are viewed as little more than cogs in the state machinery. Efficiency and technological progress are valued above all things."
    , rulerTitle = "Overseer"
    , unlockedIf = ["Materialist", "Fanatic Materialist"]
    , lockedIf = ["Individualist", "Fanatic Individualist"]
    , effects =
        [ researchSpeed 5
        , surveySpeed 10
        , simpleEffect "Can build an elite assault army"
        ]
    }
  , { name = "Enlightened Monarchy"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/2/2b/Enlightened_Monarchy.png/63px-Enlightened_Monarchy.png"
    , form' = Autocracy
    , description = ""
    , rulerTitle = ""
    , unlockedIf = ["Pacifist", "Fanatic Pacifist"]
    , lockedIf = ["Individualist", "Fanatic Individualist"]
    , effects =
        [ edictCost -25
        , planetaryEdictDuration 25
        , coreSectorPlanets 1
        , simpleEffect "Can build a special park building"
        ]
    }
  , { name = "Despotic Empire"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/1/1d/Despotic_Empire.png/63px-Despotic_Empire.png"
    , form' = Autocracy
    , description = "This government is a relatively pure form of autocracy, with an absolute ruler that governs the state with an iron gripping appendage."
    , rulerTitle = "Emperor"
    , unlockedIf = []
    , lockedIf = ["Individualist", "Fanatic Individualist"]
    , effects =
        [ buildingCost -15
        , slaveMineralOutput 10
        , slaveFoodOutput 10
        , simpleEffect "Can build an oversized military station"
        ]
    }


    -- Oligarchies
  , { name = "Military Junta"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/9/9a/Military_Junta.png/63px-Military_Junta.png"
    , form' = Oligarchy
    , description = "This government is a militaristic form of oligarchy, where power rests with a council of high-ranking military officers who oversee all matters of state."
    , rulerTitle = "Archon"
    , unlockedIf = ["Militarist", "Fanatic Militarist"]
    , lockedIf = ["Fanatic Collectivist", "Fanatic Individualist"]
    , effects =
        [ shipCost -10
        , shipUpgradeCost -25
        , simpleEffect "Admirals/generals are eligible for rulership"
        ]
    }
  , { name = "Theocratic Oligarchy"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/5/57/Theocratic_Oligarchy.png/63px-Theocratic_Oligarchy.png"
    , form' = Oligarchy
    , description = ""
    , rulerTitle = "Inquisitor"
    , unlockedIf = ["Spiritualist", "Fanatic Spiritualist"]
    , lockedIf = ["Fanatic Collectivist", "Fanatic Individualist"]
    , effects =
        [ ethicsDivergence -10
        ]
    }
  , { name = "Science Directorate"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/c/cd/Science_Directorate.png/63px-Science_Directorate.png"
    , form' = Oligarchy
    , description = "This government is a materialist form of oligarchy, where a committee of scientists supervises the government apparatus for maximum efficiency."
    , rulerTitle = "Director"
    , unlockedIf = ["Materialist", "Fanatic Materialist"]
    , lockedIf = ["Fanatic Collectivist", "Fanatic Individualist"]
    , effects =
        [ researchAlternative 1
        , simpleEffect "Scientists are eligible for Leadership"
        ]
    }
  , { name = "Peaceful Bureaucracy"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/c/cd/Peaceful_Bureaucracy.png/63px-Peaceful_Bureaucracy.png"
    , form' = Oligarchy
    , description = "This government is a pacifist form of oligarchy, where a complicated system of bureaucracy governs all aspects of society to ensure the safety of the citizenry."
    , rulerTitle = "Coordinator"
    , unlockedIf = ["Pacifist", "Fanatic Pacifist"]
    , lockedIf = ["Fanatic Collectivist", "Fanatic Individualist"]
    , effects =
        [ leaderCapacity 4
        , leaderRecruitmentCost -15
        ]
    }
  , { name = "Plutocratic Oligarchy"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/3/3e/Plutocratic_Oligarchy.png/63px-Plutocratic_Oligarchy.png"
    , form' = Oligarchy
    , description = "This is a plutocratic form of oligarchy, ruled by a wealthy elite. A citizen's personal wealth translates directly into political power."
    , rulerTitle = "Executive"
    , unlockedIf = []
    , lockedIf = ["Fanatic Collectivist", "Fanatic Individualist"]
    , effects =
        [ energyCredits 5
        , minerals 5
        ]
    }


    -- Democracies
  , { name = "Military Republic"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/b/b8/Military_Republic.png/63px-Military_Republic.png"
    , form' = Democracy
    , description = ""
    , rulerTitle = "Consul"
    , unlockedIf = ["Militarist", "Fanatic Militarist"]
    , lockedIf = ["Collectivist", "Fanatic Collectivist"]
    , effects =
        [ armyUpkeep -15
        , shipUpkeep -15
        , warTolerance 25
        , simpleEffect "Admirals/generals are eligible for rulership"
        ]
    }
  , { name = "Theocratic Republic"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/9/9f/Theocratic_Republic.png/63px-Theocratic_Republic.png"
    , form' = Democracy
    , description = ""
    , rulerTitle = ""
    , unlockedIf = ["Spiritualist", "Fanatic Spiritualist"]
    , lockedIf = ["Collectivist", "Fanatic Collectivist"]
    , effects =
        [ ethicsDivergence -10
        ]
    }
  , { name = "Direct Democracy"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/0/02/Direct_Democracy.png/63px-Direct_Democracy.png"
    , form' = Democracy
    , description = "This government is a materialistic form of democracy, where citizens use computer networks to vote directly on most matters regarding the state."
    , rulerTitle = "Chancellor"
    , unlockedIf = ["Materialist", "Fanatic Materialist"]
    , lockedIf = ["Collectivist", "Fanatic Collectivist"]
    , effects =
        [ coreSectorPlanets 4
        ]
    }
  , { name = "Moral Democracy"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/6/67/Moral_Democracy.png/63px-Moral_Democracy.png"
    , form' = Democracy
    , description = "This government is a pacifistic form of democracy, firmly guided by moralist principles and non-violence."
    , rulerTitle = ""
    , unlockedIf = ["Pacifist", "Fanatic Pacifist"]
    , lockedIf = ["Collectivist", "Fanatic Collectivist"]
    , effects =
        [ happiness 10
        ]
    }
  , { name = "Indirect Democracy"
    , imgUrl = "http://www.stellariswiki.com/images/thumb/a/a1/Indirect_Democracy.png/63px-Indirect_Democracy.png"
    , form' = Democracy
    , description = "This government is an indirect democracy, where citizens vote on officials who are elected to represent them."
    , rulerTitle = "President"
    , unlockedIf = []
    , lockedIf = ["Collectivist", "Fanatic Collectivist"]
    , effects =
        [ leaderSkillLevels 1
        , leaderRecruitmentCost -10
        ]
    }
  ]

governmentForm : GovernmentForm -> String
governmentForm form' =
  case form' of
    Autocracy ->
      "An autocracy is a form of government where power is held by a single individual, e.g., a monarch or a dictator.

A nation that possesses individualism or fanatic individualism ethos are not able to use this type of governance.

There are no elections and leaders rule until their death. In most autocratic governments there is a predetermined heir, though in military dictatorship successor is decided after death of dictator. "
    Oligarchy ->
      "An oligarchy is a form of government where power is held by a group of individuals, e.g., a scientific organization or a priestly convocation.

A nation that possesses fanatic collectivism or fanatic individualism ethos are not able to use this type of governance.

Elections occur far apart in time, usually every 40 to 50 years. Existing leaders of specific type within the empire are eligible for election, generally governors. If empire has not enough leaders of proper type (apparently four, including current leader running for another term), they will be generated for the election. "
    Democracy ->
      "A democracy is a form of government where power is generally distributed by the population and periodically a new leader is elected to represent them, e.g., representative or direct democracy.

A nation that possesses collectivism or fanatic collectivism ethos are not able to use this type of governance.

Elections occur regularly every 5 years. "
