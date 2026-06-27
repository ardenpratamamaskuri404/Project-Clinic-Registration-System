-- =============================================
-- KLINIK DATABASE SETUP SCRIPT
-- =============================================
-- Script ini akan membuat database dan semua tabel yang diperlukan
-- Kemudian mengisi dengan data testing (doctor dan patient)

-- Drop database jika sudah ada (untuk reset)
DROP DATABASE IF EXISTS `klinik_db`;

-- Buat database baru
CREATE DATABASE `klinik_db` 
  DEFAULT CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci;

-- Gunakan database
USE `klinik_db`;

-- =============================================
-- TABLE: User
-- =============================================
CREATE TABLE `User` (
  `id` VARCHAR(191) NOT NULL,
  `name` VARCHAR(191) NOT NULL,
  `email` VARCHAR(191) NOT NULL,
  `password` VARCHAR(191) NOT NULL,
  `role` ENUM('DOCTOR', 'PATIENT') NOT NULL DEFAULT 'PATIENT',
  `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- TABLE: Poli
-- =============================================
CREATE TABLE `Poli` (
  `id` VARCHAR(191) NOT NULL,
  `nama` VARCHAR(191) NOT NULL,
  `deskripsi` VARCHAR(191) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- TABLE: Dokter
-- =============================================
CREATE TABLE `Dokter` (
  `id` VARCHAR(191) NOT NULL,
  `nama` VARCHAR(191) NOT NULL,
  `spesialis` VARCHAR(191) NOT NULL,
  `poliId` VARCHAR(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Dokter_poliId_fkey` (`poliId`),
  CONSTRAINT `Dokter_poliId_fkey` 
    FOREIGN KEY (`poliId`) 
    REFERENCES `Poli` (`id`) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- TABLE: JadwalDokter
-- =============================================
CREATE TABLE `JadwalDokter` (
  `id` VARCHAR(191) NOT NULL,
  `dokterId` VARCHAR(191) NOT NULL,
  `hari` VARCHAR(191) NOT NULL,
  `jamMulai` VARCHAR(191) NOT NULL,
  `jamSelesai` VARCHAR(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `JadwalDokter_dokterId_fkey` (`dokterId`),
  CONSTRAINT `JadwalDokter_dokterId_fkey` 
    FOREIGN KEY (`dokterId`) 
    REFERENCES `Dokter` (`id`) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- TABLE: Pendaftaran
-- =============================================
CREATE TABLE `Pendaftaran` (
  `id` VARCHAR(191) NOT NULL,
  `pasienId` VARCHAR(191) NOT NULL,
  `jadwalId` VARCHAR(191) NOT NULL,
  `keluhan` VARCHAR(191) NULL,
  `status` ENUM('PENDING', 'ACCEPTED', 'REJECTED') NOT NULL DEFAULT 'PENDING',
  `tanggalPendaftaran` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `Pendaftaran_pasienId_fkey` (`pasienId`),
  KEY `Pendaftaran_jadwalId_fkey` (`jadwalId`),
  CONSTRAINT `Pendaftaran_pasienId_fkey` 
    FOREIGN KEY (`pasienId`) 
    REFERENCES `User` (`id`) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE,
  CONSTRAINT `Pendaftaran_jadwalId_fkey` 
    FOREIGN KEY (`jadwalId`) 
    REFERENCES `JadwalDokter` (`id`) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- INSERT DATA TESTING
-- =============================================

-- Insert Users (Doctor dan Patient)
-- Password: doctor123 (hashed dengan bcrypt)
-- Password: patient123 (hashed dengan bcrypt)
INSERT INTO `User` (`id`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
('d616a4ec-888a-4ffb-b6ec-1914388cd976', 'Dr. Andika (Dokter)', 'doctor@klinik.com', '$2b$10$iXPukdOEcB460SJ.F7MLzOwBGah20b2jJxvzlNgr5Wx6WNUVB1xJS', 'DOCTOR', NOW(), NOW()),
('8ca84799-a8a8-4286-abf8-932877a78552', 'Budi Santoso', 'budi@gmail.com', '$2b$10$rYa1V47YP7PuJexfXGmINeSvfjF3D49EHpyU2axcIT7FozLRYZFJi', 'PATIENT', NOW(), NOW());

-- Insert Poli
INSERT INTO `Poli` (`id`, `nama`, `deskripsi`) VALUES
('poli-001', 'Poli Umum', 'Pelayanan kesehatan umum'),
('poli-002', 'Poli Gigi', 'Kesehatan gigi dan mulut'),
('poli-003', 'Poli Kandungan', 'Kesehatan ibu dan anak'),
('poli-004', 'Poli Gizi', 'Konsultasi gizi dan nutrisi');

-- Insert Dokter
INSERT INTO `Dokter` (`id`, `nama`, `spesialis`, `poliId`) VALUES
('dokter-001', 'dr. Andi Pratama', 'Dokter Umum', 'poli-001'),
('dokter-002', 'drg. Siska Maharani', 'Dokter Gigi', 'poli-002'),
('dokter-003', 'dr. Sarah Wijaya, Sp.OG', 'Spesialis Kandungan', 'poli-003'),
('dokter-004', 'dr. Rina Kusuma, M.Gizi', 'Ahli Gizi', 'poli-004');

-- Insert Jadwal Dokter
INSERT INTO `JadwalDokter` (`id`, `dokterId`, `hari`, `jamMulai`, `jamSelesai`) VALUES
-- dr. Andi (Poli Umum)
('jadwal-001', 'dokter-001', 'Senin', '08:00', '12:00'),
('jadwal-002', 'dokter-001', 'Selasa', '08:00', '12:00'),
('jadwal-003', 'dokter-001', 'Rabu', '08:00', '12:00'),
('jadwal-004', 'dokter-001', 'Kamis', '08:00', '12:00'),
('jadwal-005', 'dokter-001', 'Jumat', '08:00', '11:00'),

-- drg. Siska (Poli Gigi)
('jadwal-006', 'dokter-002', 'Senin', '13:00', '17:00'),
('jadwal-007', 'dokter-002', 'Rabu', '13:00', '17:00'),
('jadwal-008', 'dokter-002', 'Jumat', '13:00', '16:00'),

-- dr. Sarah (Poli Kandungan)
('jadwal-009', 'dokter-003', 'Selasa', '09:00', '14:00'),
('jadwal-010', 'dokter-003', 'Kamis', '09:00', '14:00'),
('jadwal-011', 'dokter-003', 'Sabtu', '08:00', '12:00'),

-- dr. Rina (Poli Gizi)
('jadwal-012', 'dokter-004', 'Senin', '14:00', '18:00'),
('jadwal-013', 'dokter-004', 'Rabu', '14:00', '18:00'),
('jadwal-014', 'dokter-004', 'Jumat', '14:00', '17:00');

-- =============================================
-- VERIFIKASI DATA
-- =============================================
SELECT '=== USER ===' AS '';
SELECT id, name, email, role FROM `User`;

SELECT '=== POLI ===' AS '';
SELECT id, nama, deskripsi FROM `Poli`;

SELECT '=== DOKTER ===' AS '';
SELECT d.id, d.nama, d.spesialis, p.nama as poli_nama 
FROM `Dokter` d 
JOIN `Poli` p ON d.poliId = p.id;

SELECT '=== JADWAL DOKTER ===' AS '';
SELECT j.id, d.nama as dokter_nama, j.hari, j.jamMulai, j.jamSelesai 
FROM `JadwalDokter` j 
JOIN `Dokter` d ON j.dokterId = d.id 
ORDER BY d.nama, j.hari;

-- =============================================
-- KREDENSIAL LOGIN
-- =============================================
SELECT '=== KREDENSIAL LOGIN ===' AS '';
SELECT 
  '👨‍⚕️ DOCTOR' as 'Role',
  'doctor@klinik.com' as 'Email',
  'doctor123' as 'Password'
UNION ALL
SELECT 
  '👤 PATIENT' as 'Role',
  'budi@gmail.com' as 'Email',
  'patient123' as 'Password';

