module Effect (Effect) where


type alias Effect =
  { name : String
  , amount : Int
  , suffix : String
  , moreIsBetter : Bool
  }
