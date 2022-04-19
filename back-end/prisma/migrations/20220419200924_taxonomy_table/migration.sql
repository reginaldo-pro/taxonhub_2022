-- CreateTable
CREATE TABLE "taxonomy" (
    "id" SERIAL NOT NULL,
    "searched_name" TEXT NOT NULL,
    "returned_name" TEXT NOT NULL,
    "accepted_name_or_synonym" TEXT NOT NULL,
    "synonym_name" TEXT NOT NULL,
    "respective_family" TEXT NOT NULL,

    CONSTRAINT "taxonomy_pkey" PRIMARY KEY ("id")
);
