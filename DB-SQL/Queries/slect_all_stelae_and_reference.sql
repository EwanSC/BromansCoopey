SELECT MonumentID, CorpusName, Reference
From MonumentCorpus join Monument USING (MonumentID)
Where MonumentType = 'stela';

SELECT MonumentID, CorpusName, Reference
FROM MonumentCorpus JOIN Monument USING (MonumentID)
WHERE MonumentType = 'stela';