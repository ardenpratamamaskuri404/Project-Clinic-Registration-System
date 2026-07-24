const jwt = require("jsonwebtoken");
const prisma = require("../utils/prisma");

const authMiddleware = async (req, res, next) => {
  const token = req.header("Authorization")?.replace("Bearer ", "");

  if (!token) {
    return res.status(401).json({ message: "No token, authorization denied" });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    console.log("Decoded token:", { id: decoded.id, role: decoded.role });
    
    const user = await prisma.user.findUnique({
      where: { id: decoded.id },
      select: { id: true, name: true, email: true, role: true },
    });

    if (!user) {
      console.log("User not found for ID:", decoded.id);
      return res.status(401).json({ 
        message: "Token is not valid - User not found in database",
        reason: "User not found - database may have been reset"
      });
    }

    req.user = user;
    next();
  } catch (err) {
    console.log("Token verification error:", err.message);
    res.status(401).json({ 
      message: "Token is not valid",
      reason: err.message
    });
  }
};

const doctorMiddleware = (req, res, next) => {
  if (req.user && req.user.role === "DOCTOR") {
    next();
  } else {
    res.status(403).json({ message: "Access denied, doctor only" });
  }
};

// Alias untuk backward compatibility
const adminMiddleware = doctorMiddleware;

module.exports = { authMiddleware, adminMiddleware, doctorMiddleware };
