<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/2/2026
  Time: 7:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>cashier footer</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <style>
    /* Footer Styles */

    .footer-section h5 {
      color: #e7993c;
      margin-bottom: 20px;
      font-size: 20px;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .footer-section h6 {
      color: #ecf0f1;
      margin-bottom: 15px;
      font-size: 16px;
      font-weight: 600;
    }

    .footer-section p {
      color: #bdc3c7;
      line-height: 1.6;
      margin-bottom: 15px;
    }

    .footer-section ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .footer-section ul li {
      margin-bottom: 8px;
    }

    .footer-section ul li a {
      color: #bdc3c7;
      text-decoration: none;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .footer-section ul li a:hover {
      color: #e7993c;
      transform: translateX(5px);
    }

    .social-links a {
      width: 40px;
      height: 40px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #bdc3c7;
      font-size: 18px;
      transition: all 0.3s ease;
    }

    .social-links a:hover {
      background: #e7993c;
      color: white;
      transform: translateY(-3px);
    }

    .contact-info p {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 10px;
    }

    .contact-info i {
      color: #e7993c;
      width: 16px;
      text-align: center;
    }

    .footer-bottom p {
      color: #bdc3c7;
      margin: 0;
    }

    .footer-links a {
      color: #bdc3c7;
      text-decoration: none;
      font-size: 14px;
      transition: all 0.3s ease;
    }

    .footer-links a:hover {
      color: #e7993c;
    }

    /* Back to Top Button */

    .back-to-top:hover {
      transform: translateY(-3px);
      box-shadow: 0 6px 20px rgba(231, 153, 60, 0.6);
    }

    .back-to-top i {
      font-size: 18px;
    }

    /* Responsive Footer */
    @media (max-width: 991.98px) {

    }

    @media (max-width: 576px) {

      .back-to-top i {
        font-size: 16px;
      }
    }

    /* Footer spacing adjustment for content */
  </style>
</head>
<body>
<!-- footer.jsp -->
<script src="../assets/js/bootstrap.bundle.min.js"></script>
<script>
  function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const overlay = document.querySelector('.sidebar-overlay');
    sidebar.classList.toggle('active');
    overlay.classList.toggle('active');
  }

  function closeSidebar() {
    const sidebar = document.getElementById('sidebar');
    const overlay = document.querySelector('.sidebar-overlay');
    sidebar.classList.remove('active');
    overlay.classList.remove('active');
  }

  document.querySelectorAll('.sidebar a').forEach(link => {
    link.addEventListener('click', function () {
      if (window.innerWidth <= 991) {
        closeSidebar();
      }
    });
  });

  window.addEventListener('resize', function () {
    if (window.innerWidth > 991) {
      closeSidebar();
    }
  });
</script>

</body>
</html>

