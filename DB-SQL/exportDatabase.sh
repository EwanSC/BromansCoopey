#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../data

sqlite3 BromansDB.db -csv -header 'SELECT * FROM Corpus ORDER BY CorpusName;' > ../data/Corpus.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM FindSpot ORDER BY FindSpotID' > ../data/FindSpot.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM LegioServicemen ORDER BY ServicemanID' > ../data/LegioServicemen.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM MilitaryStatus ORDER BY MilitaryStatusID' > ../data/MilitaryStatus.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM Monument ORDER BY MonumentID' > ../data/Monument.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM MonumentCorpus ORDER BY MonumentCorpusID' > ../data/MonumentCorpus.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM MonumentServicemen ORDER BY MonumentServicemanID' > ../data/MonumentServicemen.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM Units ORDER BY UnitID' > ../data/Units.csv


mkdir -p ../analysis
sqlite3 BromansDB.db -csv -header 'SELECT * FROM All_Servicemen' > ../analysis/All_Servicemen.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM AllCorpora' > ../analysis/AllCorpora.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM Definite_Funerary_Monuments' > ../analysis/Definite_Funerary_Monuments.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM Monument_and_Location' > ../analysis/Monument_and_Location.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM PrimaryCorpus' > ../analysis/PrimaryCorpus.csv
