/*
  Warnings:

  - The primary key for the `meta` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `meta` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "meta" DROP CONSTRAINT "meta_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "meta_pkey" PRIMARY KEY ("key");
