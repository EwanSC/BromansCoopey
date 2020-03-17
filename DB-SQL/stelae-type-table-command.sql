Select Monumentid, CorpusName ||':'|| reference as Stela, StelaeType as 'Stela Style'
from Monument join MonumentCorpus USING (MonumentID)
where StelaeType is not NULL and isPrimaryReference = '1';