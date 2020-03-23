Select MonumentID, CorpusName, Reference, AE, ILJug, OtherDB
From MonumentCorpus Join AllCorpora USING (MonumentID)
Where Tončinić is null
and isPrimaryReference is '1';