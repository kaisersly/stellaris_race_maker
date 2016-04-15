module Ethos.Data (all) where


import Ethos exposing (Ethos, Dichotomy(..))
import Effect.Factory exposing (..)


all : List Ethos
all =
  [
    -- Collectivist - Individualist
    { dichotomy = CollectivistIndividualist
    , name = "Fanatic Collectivist"
    , points = 2
    , description = "The purpose of the individual is simple: strengthen the collective. To enter the blackness of space we move as one, and we shall not be weakened by wanton separatism."
    , effects =
        [ slaveryTolerance 100
        , foodRequirement -10
        ]
    }
  , { dichotomy = CollectivistIndividualist
    , name = "Collectivist"
    , points = 1
    , description = "Society has long since evolved past the insignificant rivalries and concerns of the individuals. We are numerous but one, and the needs of the many outweigh the needs of the few. We stand truly equal."
    , effects =
        [ slaveryTolerance 50
        , foodRequirement -5
        ]
    }
  , { dichotomy = CollectivistIndividualist
    , name = "Individualist"
    , points = 1
    , description = "Community is a means to an end, not the end itself. Only by empowering the individual to reach their maximum potential do we achieve true freedom. Freedom of thought, of speech, of movement, of trade."
    , effects =
        [ energyCredits 10
        , slaveryTolerance -50
        , ethicsDivergence 5
        ]
    }
  , { dichotomy = CollectivistIndividualist
    , name = "Fanatic Individualist"
    , points = 2
    , description = "Through history, too often has the hulking mass of the collective stifled the radiant genius of individuals. No more. Forge your own path, and let new fruits be illuminated by the sparks of clashing ambitions."
    , effects =
        [ energyCredits 20
        , slaveryTolerance -100
        , ethicsDivergence 10
        ]
    }

    -- Xenophobe - Xenophile
  , { dichotomy = XenophobeXenophile
    , name = "Fanatic Xenophobe"
    , points = 2
    , description = "We must guard ourselves against the alien elements that would disrupt our society, the influences that would debase our genetic and cultural heritage. The Other is to be held at arm's length, and that arm is to hold a sword."
    , effects =
        [ alienSlaveryTolerance 100
        , xenophobia 20
        ]
    }
  , { dichotomy = XenophobeXenophile
    , name = "Xenophobe"
    , points = 1
    , description = "A homogeneous society is a predictable society. A predictable society is a safe society. There is little to be gained by giving excessive attention or care for those who do not belong."
    , effects =
        [ alienSlaveryTolerance 50
        , xenophobia 10
        ]
    }
  , { dichotomy = XenophobeXenophile
    , name = "Xenophile"
    , points = 1
    , description = "There exist, in all of us, a deep-seated fascination of the unknown. An adventurous spirit that rejects the familiar and glories in the unfamiliar, whatever - or whoever - it may be."
    , effects =
        [ xenophobia -10
        ]
    }
  , { dichotomy = XenophobeXenophile
    , name = "Fanatic Xenophile"
    , points = 2
    , description = "If there was such a thing as an absolute moral imperative, it would be to explore the cosmos and embrace all within it. We were never meant to journey alone."
    , effects =
        [ xenophobia -20
        ]
    }

    -- Militarist - Pacifist
  , { dichotomy = MilitaristPacifist
    , name = "Fanatic Militarist"
    , points = 2
    , description = "The ability to project force is at paramount importance. The only way to preserve our way of life is to make everyone share it, willingly or not."
    , effects =
        [ rivalryInfluenceGain 50
        , allianceCost 75
        , warTolerance 75
        , warHappiness 10
        , armyDamage 20
        ]
    }
  , { dichotomy = MilitaristPacifist
    , name = "Militarist"
    , points = 1
    , description = "The only true values are courage and discipline, and channeled properly they can overcome any obstacle. Therein lies true strength; force withheld, a promise made."
    , effects =
        [ rivalryInfluenceGain 25
        , allianceCost 50
        , warTolerance 50
        , warHappiness 5
        , armyDamage 10
        ]
    }
  , { dichotomy = MilitaristPacifist
    , name = "Pacifist"
    , points = 1
    , description = "Conflict as a mean to an end is a ridiculous concept. It is by nature destructive, destroying what was to be obtained or giving room to grow that which was to be destroyed."
    , effects =
        [ food 10
        , warTolerance -25
        , warHappiness -10
        , armyDamage -10
        ]
    }
  , { dichotomy = MilitaristPacifist
    , name = "Fanatic Pacifist"
    , points = 2
    , description = ""
    , effects =
        [ food 20
        , warTolerance -50
        , warHappiness -20
        , armyDamage -20
        ]
    }

    -- Materialist - Spiritualist
  , { dichotomy = MaterialistSpiritualist
    , name = "Fanatic Materialist"
    , points = 2
    , description = "Although it hurts, we must grow up and put aside our outdated notions of morality. There is no 'divine spark' granting special value to a living mind. No object has any intrinsic value apart from what we choose to grant it. Let us embrace the freedom of certitude, and achieve maximum efficiency in all things."
    , effects =
        [ physicsOutput 10
        , societyOutput 10
        , engineeringOutput 10
        ]
    }
  , { dichotomy = MaterialistSpiritualist
    , name = "Materialist"
    , points = 1
    , description = "As we reach for the stars, we must put away childish things: gods, spirits and other phantasms of the brain. Reality is cruel and unforgiving, yet we must protect ourselves and secure the survival of our race through the unflinching pursuit of science and technology."
    , effects =
        [ physicsOutput 5
        , societyOutput 5
        , engineeringOutput 5
        ]
    }
  , { dichotomy = MaterialistSpiritualist
    , name = "Spiritualist"
    , points = 1
    , description = "It behooves us to remember how tiny we are, how pointless our lives are in this vast uncaring universe... what nonsense! The only truth we can ever know is that of our own existence. The universe - in all its apparent glory - is but a dream we all happen to share."
    , effects =
        [ happiness 5
        ]
    }
  , { dichotomy = MaterialistSpiritualist
    , name = "Fanatic Spiritualist"
    , points = 2
    , description = "Our science has proved that consciousness begets reality. We regard with patience the childlike efforts of those who delude themselves as they play with their blocks of 'hard matter'."
    , effects =
        [ happiness 10
        ]
    }
  ]
