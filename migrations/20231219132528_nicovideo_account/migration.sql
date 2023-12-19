-- AlterTable
ALTER TABLE "NicovideoVideoSource" ADD COLUMN     "accountId" TEXT;

-- CreateTable
CREATE TABLE "NicovideoNewVideo" (
    "id" TEXT NOT NULL,
    "sourceId" TEXT NOT NULL,
    "registeredAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "checked" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "NicovideoNewVideo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NicovideoAccount" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "accountId" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "NicovideoAccount_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "NicovideoNewVideo_sourceId_key" ON "NicovideoNewVideo"("sourceId");

-- CreateIndex
CREATE UNIQUE INDEX "NicovideoAccount_accountId_key" ON "NicovideoAccount"("accountId");

-- AddForeignKey
ALTER TABLE "NicovideoVideoSource" ADD CONSTRAINT "NicovideoVideoSource_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "NicovideoAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;
