/*
  Warnings:

  - You are about to drop the `_Followed` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_Following` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_Followed" DROP CONSTRAINT "_Followed_A_fkey";

-- DropForeignKey
ALTER TABLE "_Followed" DROP CONSTRAINT "_Followed_B_fkey";

-- DropForeignKey
ALTER TABLE "_Following" DROP CONSTRAINT "_Following_A_fkey";

-- DropForeignKey
ALTER TABLE "_Following" DROP CONSTRAINT "_Following_B_fkey";

-- DropTable
DROP TABLE "_Followed";

-- DropTable
DROP TABLE "_Following";

-- CreateTable
CREATE TABLE "_UserFollows" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_UserFollows_AB_unique" ON "_UserFollows"("A", "B");

-- CreateIndex
CREATE INDEX "_UserFollows_B_index" ON "_UserFollows"("B");

-- AddForeignKey
ALTER TABLE "_UserFollows" ADD FOREIGN KEY ("A") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserFollows" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
