package com.hotelbillingsystem.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter("/cashier/*")
public class CashierAuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        // Not logged in
        if (session == null || session.getAttribute("loggedUser") == null) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        // Not cashier (1 = cashier)
        Integer role = (Integer) session.getAttribute("role");
        if (role == null || role != 1) {
            session.invalidate();
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        // Prevent browser caching
        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        res.setHeader("Pragma", "no-cache");
        res.setDateHeader("Expires", 0);

        // Cashier allowed
        chain.doFilter(request, response);
    }
}
