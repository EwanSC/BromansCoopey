Select CorpusName, REFERENCE, Tončinić
From MonumentCorpus join AllCorpora using (MonumentID)
Where isPrimaryReference = '1'
and Tončinić is not null;