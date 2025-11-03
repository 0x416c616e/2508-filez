import db from "#db/client";
import { createFile } from "#db/queries/files";
import { createFolder } from "#db/queries/folders";

await initDb();

async function initDb() {
  await db.connect();
  await seed();
  await db.end();
  console.log("Database seeded.");
}

async function seed() {
  for (let i = 0; i < 3; i++) {
    const folder = await createFolder("Folder " + (Number(i) + 1));
    for (let j = 0; j < 5; j++) {
      await createFile("File " + (j + 1), 1000 * (j + 1), folder.id);
    }
  }
}
