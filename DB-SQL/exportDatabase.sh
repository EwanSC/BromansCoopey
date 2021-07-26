#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../data

sqlite3 BromansDB.db -csv -header 'SELECT * FROM corpus ORDER BY CorpusName;' > ../data/corpus.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM findspot ORDER BY FindSpotID' > ../data/findspot.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM legio_serviceman ORDER BY ServicemanID' > ../data/legio_serviceman.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM military_status ORDER BY MilitaryStatusID' > ../data/military_status.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM monument ORDER BY MonumentID' > ../data/monument.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM monument_corpus ORDER BY MonumentCorpusID' > ../data/monument_corpus.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM monument_serviceman ORDER BY MonumentServicemanID' > ../data/monument_serviceman.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM unit ORDER BY UnitID' > ../data/unit.csv


mkdir -p ../analysis
sqlite3 BromansDB.db -csv -header 'SELECT * FROM all_servicemen' > ../analysis/all_servicemen.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM all_corpora' > ../analysis/all_corpora.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM leg_vii_funerary_monument' > ../analysis/leg_vii_funerary_monument.csv
sqlite3 BromansDB.db -csv -header 'SELECT * FROM all_monument_with_location' > ../analysis/all_monument_with_location.csv
