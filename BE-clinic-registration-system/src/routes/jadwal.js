const express = require("express");
const router = express.Router();
const prisma = require("../utils/prisma");
const { authMiddleware, adminMiddleware } = require("../middleware/auth");

// Get all schedules
router.get("/", async (req, res) => {
  try {
    const jadwals = await prisma.jadwalDokter.findMany({
      include: {
        dokter: {
          include: { poli: true },
        },
      },
    });
    res.json(jadwals);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch jadwal data", error: error.message });
  }
});

// Create schedule (Admin only)
router.post("/", authMiddleware, adminMiddleware, async (req, res) => {
  try {
    const { dokterId, hari, jamMulai, jamSelesai } = req.body;
    
    // Validasi input
    if (!dokterId || !hari || !jamMulai || !jamSelesai) {
      return res.status(400).json({ 
        message: "Missing required fields",
        required: ["dokterId", "hari", "jamMulai", "jamSelesai"]
      });
    }

    // Cek apakah dokter exists
    const dokter = await prisma.dokter.findUnique({
      where: { id: dokterId }
    });

    if (!dokter) {
      return res.status(404).json({ 
        message: "Dokter not found",
        dokterId: dokterId
      });
    }

    // Cek jadwal duplikat
    const existingJadwal = await prisma.jadwalDokter.findFirst({
      where: {
        dokterId,
        hari,
        jamMulai,
        jamSelesai
      }
    });

    if (existingJadwal) {
      return res.status(400).json({ 
        message: "Jadwal already exists for this doctor on this day and time"
      });
    }

    const jadwal = await prisma.jadwalDokter.create({
      data: { dokterId, hari, jamMulai, jamSelesai },
      include: {
        dokter: {
          include: { poli: true }
        }
      }
    });
    
    res.status(201).json(jadwal);
  } catch (error) {
    console.error("Error creating jadwal:", error);
    res.status(400).json({ 
      message: "Failed to create jadwal",
      error: error.message 
    });
  }
});

module.exports = router;
