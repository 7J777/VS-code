import System.Random
import Data.Aeson (encode, object, (.=))
import qualified Data.ByteString.Lazy as B

generateData :: IO ()
generateData = do
    let ids = [0..9]
    values <- replicateM 10 (randomRIO (0, 99))
    let dataItems = zipWith (\i v -> object ["id" .= i, "value" .= v]) ids values
    B.writeFile "data.json" (encode dataItems)
    putStrLn "Data generated and saved to data.json"

main :: IO ()
main = generateData