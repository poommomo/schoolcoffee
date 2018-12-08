package product.Controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OrderServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String cmd = req.getParameter("cmd");
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String price = req.getParameter("price");

        if (cmd != null && cmd.equals("d") && name != null) {
            HttpSession session = req.getSession();
            List<Product> productList = (List<Product>) session.getAttribute("cart");
            for (int i = 0; i < productList.size(); i++) {
                if (productList.get(i).getName().equals(name)) {
                    productList.remove(i);
                    break;
                }
            }
            session.setAttribute("cart", productList);
        } else {
            if (id != null && id != "") {
                Product product = new Product(Integer.parseInt(id), name, "", Float.parseFloat(price));
                HttpSession session = req.getSession();
                if (session.getAttribute("cart") != null) {
                    List<Product> productList = (List<Product>) session.getAttribute("cart");
                    productList.add(product);
                    session.setAttribute("cart", productList);
                } else {
                    List<Product> productList = new ArrayList<>();
                    productList.add(product);
                    session.setAttribute("cart", productList);
                }
            }
        }
        resp.sendRedirect("cart.jsp");
    }


}
