-- CreateTable
CREATE TABLE "record" (
    "id" SERIAL NOT NULL,
    "taxonID" TEXT NOT NULL,
    "scientificNameID" TEXT NOT NULL,
    "localID" TEXT NOT NULL,
    "scientificName" TEXT NOT NULL,
    "taxonRank" TEXT NOT NULL,
    "parentNameUsageID" TEXT NOT NULL,
    "scientificNameAuthorship" TEXT NOT NULL,
    "family" TEXT NOT NULL,
    "subfamily" TEXT NOT NULL,
    "tribe" TEXT NOT NULL,
    "subtribe" TEXT NOT NULL,
    "genus" TEXT NOT NULL,
    "subgenus" TEXT NOT NULL,
    "specificEpithet" TEXT NOT NULL,
    "infraspecificEpithet" TEXT NOT NULL,
    "verbatimTaxonRank" TEXT NOT NULL,
    "nomenclaturalStatus" TEXT NOT NULL,
    "namePublishedIn" TEXT NOT NULL,
    "taxonomicStatus" TEXT NOT NULL,
    "acceptedNameUsageID" TEXT NOT NULL,
    "originalNameUsageID" TEXT NOT NULL,
    "nameAccordingToID" TEXT NOT NULL,
    "taxonRemarks" TEXT NOT NULL,
    "created" TEXT NOT NULL,
    "modified" TEXT NOT NULL,
    "references" TEXT NOT NULL,
    "source" TEXT NOT NULL,
    "majorGroup" TEXT NOT NULL,
    "tplId" TEXT NOT NULL,

    CONSTRAINT "record_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "meta" (
    "key" TEXT NOT NULL,
    "value" TEXT NOT NULL,

    CONSTRAINT "meta_pkey" PRIMARY KEY ("key")
);

-- CreateIndex
CREATE UNIQUE INDEX "record_taxonID_key" ON "record"("taxonID");
