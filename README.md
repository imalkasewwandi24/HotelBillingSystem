#  OceanView Resort Management System

OceanView is a comprehensive web-based application designed to streamline resort operations. It features a robust dual-dashboard system that separates administrative oversight from daily front-desk operations, ensuring efficient management of users, rooms, bills and reservations.

---

## 🛠️ Tech Stack

- **Frontend:** JSP, HTML5, CSS3 (Custom Dashboard UI), JavaScript
- **Backend:** Java (Servlets)
- **Server:** Apache Tomcat 10+
- **Architecture:** MVC (Model-View-Controller)
- **Tools:** Maven / WAR Exploded Deployment
- **Database:** MySQL

---

## 🚀 Features

### 2.1 Admin Features
- Admin login *(default credentials — Username: `Admin1`, Password: `Admin@123`)*
- Add, edit, and manage users (Admin or Staff)
- Add and manage rooms (prevent duplicate Room Numbers or Room Codes)
- View all reservations
- View generated bills and previews
- Help section for new admins
- Session management with user-type validation

### 2.2 Staff Features
- Staff login *(default credentials — Username: `Receptionist1`, Password: `Receptionist@123`)*
- Add and manage reservations
- Generate bills for guests including service charges
- View previously generated bills
- Help section for new staff
- Session management with user-type validation

---

## 📂 Project Structure

The project follows a standard Maven-based MVC architecture, ensuring clear separation of concerns between presentation, business logic, and data access layers.

```
HotelBillingSystem/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com.hotelbillingsystem/
│   │   │       ├── controllers/   # Servlet Controllers (Handle HTTP Requests)
│   │   │       ├── services/      # Business Logic Layer
│   │   │       ├── dao/           # Data Access Layer (Database Operations)
│   │   │       ├── models/        # Java Beans / Entity Classes
│   │   │       ├── filters/       # Authentication & Session Filters
│   │   │       ├── factory/       # Object Creation / Service Factory
│   │   │       └── utils/         # Utility Classes (DBConnection, Helpers)
│   │   │
│   │   ├── resources/
│   │   │   └── database/          # SQL Scripts & Database Files
│   │   │
│   │   └── webapp/
│   │       ├── admin/             # Admin JSP Pages
│   │       ├── receptionist/      # Receptionist JSP Pages
│   │       ├── assets/            # CSS, JS, Images
│   │       ├── WEB-INF/           # Configuration Files (web.xml)
│   │       ├── index.jsp
│   │       └── login.jsp          # Login Page
│   │
│   └── test/                      # Unit Testing (JUnit)
│
├── target/                        # Compiled Output (Generated)
├── pom.xml                        # Maven Dependencies & Build Config
└── .gitignore                     # Git Ignore Rules
```

---

## 🛠️ Installation & Setup

### 4.1 Software Requirements

- Java JDK 17+
- Apache Tomcat *(install locally for servlet hosting)*
- MySQL / MariaDB *(XAMPP or WAMP can be used)*
- IDE *(IntelliJ IDEA Ultimate recommended for running the project)*

---

### 4.2 Running the Project

**1. Clone the Repository**
```bash
git clone <your-repo-link>
cd HotelManagementSystem
```

**2. Open in IDE**
- Open the project in **IntelliJ IDEA** as a Java web project.
- Go to `Run` → `Edit Configurations`.
- Press the `+` icon → select **Tomcat Local**.
- Configure the server name and set the port (e.g., `8080`).
- Go to **Deployment** tab → press `+` → **Artifact** → select `Exploded (HotelManagementSystem_war_exploded)`.
- Apply settings.

**3. Database Setup**
- Open **XAMPP** or **WAMP** → start MySQL.
- Create a database named `resort_db`.
- Import the SQL scripts from the `resources` folder in the project directory.

**4. Run the Project**
- Run the Tomcat configuration in your IDE.
- Access the system via browser:
```
http://localhost:8080/HotelManagementSystem
```

---

## ⚙️ Configuration

- **Database:** Update `DBConnection.java` with your MySQL username/password
- **Server Port:** Configurable via Tomcat setup
- **Admin Credentials:** Default: `Admin1` / `Admin@123` — change after first login

---

## 🧪 Testing Status

- Successfully deployed and tested on Apache Tomcat 10+
- Service layer unit tests executed (Bill, Reservation, Room, User)
- Database constraints verified (duplicate prevention & relationships)
- Role-based session validation tested (Admin / Receptionist access control)

---

## 🚀 Future Enhancements

- Add dashboard analytics and reports
- Integrate online payment gateway
- Enable email notifications for bookings and invoices
- Deploy to cloud for live access

---

## 📦 Version

**Current Version: v1.0**

---

## 🔧 Troubleshooting

If you run into any dependency or build issues, make sure your `pom.xml` includes the following dependencies:
```xml
<dependencies>
  <dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.13.2</version>
    <scope>test</scope>
  </dependency>
  <dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>4.0.1</version>
    <scope>provided</scope>
  </dependency>
  <dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.33</version>
  </dependency>
</dependencies>
```
