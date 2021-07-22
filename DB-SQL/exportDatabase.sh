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
sqlite3 BromansDB.db -csv -header 'SELECT * FROM all_servicemen' > ../analysis/all_servicemen.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM all_corpora' > ../analysis/all_corpora.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM definite_funerary_monuments' > ../analysis/definite_funerary_monuments.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM monument_and_location' > ../analysis/monument_and_location.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM primary_thesis_corpus' > ../analysis/primary_thesis_corpus.csv
