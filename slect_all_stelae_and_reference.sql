Select MonumentCorpus.MonumentID, CorpusName, Reference
From MonumentCorpus join Monument on (MonumentCorpus.MonumentID = Monument.MonumentID)
Where MonumentType = 'stela';