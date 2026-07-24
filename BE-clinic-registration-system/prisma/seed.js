const { PrismaClient } = require("@prisma/client");
const bcrypt = require("bcryptjs");
const prisma = new PrismaClient();

async function main() {
  // Clear existing data
  await prisma.pendaftaran.deleteMany();
  await prisma.jadwalDokter.deleteMany();
  await prisma.dokter.deleteMany();
  await prisma.poli.deleteMany();
  await prisma.user.deleteMany();

  // Create Users
  const doctorPassword = await bcrypt.hash("doctor123", 10);
  const patientPassword = await bcrypt.hash("patient123", 10);

  const doctorUser = await prisma.user.create({
    data: {
      id: "d616a4ec-888a-4ffb-b6ec-1914388cd976",
      name: "Dr. Andika (Dokter)",
      email: "doctor@klinik.com",
      password: doctorPassword,
      role: "DOCTOR",
    },
  });

  const patient = await prisma.user.create({
    data: {
      id: "8ca84799-a8a8-4286-abf8-932877a78552",
      name: "Budi Santoso",
      email: "budi@gmail.com",
      password: patientPassword,
      role: "PATIENT",
    },
  });

  // Create Poli
  const poliUmum = await prisma.poli.create({
    data: { nama: "Poli Umum", deskripsi: "Pelayanan kesehatan umum" },
  });

  const poliGigi = await prisma.poli.create({
    data: { nama: "Poli Gigi", deskripsi: "Kesehatan gigi dan mulut" },
  });

  // Create Dokter (linked to doctor user)
  const drAndi = await prisma.dokter.create({
    data: { 
      nama: "dr. Andi", 
      spesialis: "Dokter Umum", 
      poliId: poliUmum.id,
      userId: doctorUser.id  // Link to doctor user
    },
  });

  const drSiska = await prisma.dokter.create({
    data: { 
      nama: "drg. Siska", 
      spesialis: "Dokter Gigi", 
      poliId: poliGigi.id 
    },
  });

  // Create Jadwal
  await prisma.jadwalDokter.createMany({
    data: [
      {
        dokterId: drAndi.id,
        hari: "Senin",
        jamMulai: "08:00",
        jamSelesai: "12:00",
      },
      {
        dokterId: drAndi.id,
        hari: "Selasa",
        jamMulai: "08:00",
        jamSelesai: "12:00",
      },
      {
        dokterId: drSiska.id,
        hari: "Senin",
        jamMulai: "13:00",
        jamSelesai: "17:00",
      },
      {
        dokterId: drSiska.id,
        hari: "Rabu",
        jamMulai: "13:00",
        jamSelesai: "17:00",
      },
    ],
  });

  console.log("Seed data created successfully!");
  console.log("Doctor user linked to dokter profile:", drAndi.id);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });