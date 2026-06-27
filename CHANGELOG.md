# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Forgot password functionality
- Email notifications
- SMS notifications via Twilio
- Export reports (PDF/Excel)
- Multi-language support (EN/ID)
- Payment gateway integration
- Medical record system
- Appointment reminder system

## [1.0.0] - 2024-01-XX

### Added
- 🎉 Initial release
- ✅ User authentication (JWT)
- ✅ Patient registration and login
- ✅ Doctor dashboard
- ✅ Real-time notifications with Socket.IO
- ✅ Schedule management (CRUD)
- ✅ Patient registration system
- ✅ Accept/reject patient registrations
- ✅ View poli (clinics) and doctors list
- ✅ View doctor schedules by day
- ✅ Patient registration history
- ✅ Responsive UI with Tailwind CSS
- ✅ Auto logout on invalid token
- ✅ User-Dokter relationship in database

### Backend Features
- Express.js REST API
- Prisma ORM with MySQL
- JWT authentication middleware
- Socket.IO for real-time events
- bcryptjs password hashing
- Zod schema validation
- CORS enabled
- Environment variable configuration

### Frontend Features
- React 18 with Vite
- React Router for navigation
- Axios for HTTP requests
- Socket.IO client for real-time
- Tailwind CSS styling
- Shadcn UI components
- React Hot Toast notifications
- Lucide React icons
- Authentication context
- Protected routes

### Database
- User table with DOCTOR/PATIENT roles
- Poli (clinic) management
- Dokter (doctor) profiles
- JadwalDokter (doctor schedule)
- Pendaftaran (registration) with status tracking
- One-to-one User-Dokter relationship

### Documentation
- Comprehensive README.md
- Database setup guide
- MySQL configuration guide
- Complete SQL dump file
- Contributing guidelines
- Troubleshooting section

### Security
- JWT token authentication
- Password hashing with bcrypt
- Token expiration (24 hours)
- Auto logout on invalid token
- Protected API routes
- Role-based access control

---

## Version History Legend

### Types of Changes
- `Added` - New features
- `Changed` - Changes in existing functionality
- `Deprecated` - Soon-to-be removed features
- `Removed` - Removed features
- `Fixed` - Bug fixes
- `Security` - Vulnerability fixes

---

[Unreleased]: https://github.com/username/clinic-registration-system/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/username/clinic-registration-system/releases/tag/v1.0.0
