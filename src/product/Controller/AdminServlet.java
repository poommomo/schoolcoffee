package product.Controller;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class AdminServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String cmd = request.getParameter("cmd");

        String name = request.getParameter("name");
        String description = request.getParameter("info");
        String price = request.getParameter("price");
        String imageURL = request.getParameter("image");
        String isFeatured = request.getParameter("featured");
        String categoryId = request.getParameter("category");

        Context context;
        String sql;

        try {
            context = new InitialContext();
            Context initContext = (Context) context.lookup("java:/comp/env");
            DataSource dataSource = (DataSource) initContext.lookup("jdbc/school_coffee");
            Connection connection = dataSource.getConnection();

            if (cmd != null && cmd.equals("add")) {
                // Case Add Product
                sql = "insert into Product (Name, Description, CategoryID, ImageURL, Price, IsFeatured) values (?, ?, ?, ?, ?, ?)";

                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, name);
                statement.setString(2, description);
                statement.setInt(3, Integer.parseInt(categoryId));
                statement.setString(4, imageURL);
                statement.setDouble(5, Double.parseDouble(price));
                statement.setString(6, isFeatured);

                statement.executeUpdate();
            } else if (cmd != null && cmd.equals("delete")) {
                // Case delete
                sql = "DELETE FROM Product WHERE ID = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                // Handle parse int error
                statement.setInt(1, Integer.parseInt(id));
                statement.execute();
            } else if (cmd != null && cmd.equals("update")) {
                // Case update
                sql = "UPDATE Product SET Name = ?, Description = ?, CategoryID = ?, ImageURL = ?, Price = ?, IsFeatured = ? WHERE ID = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, name);
                statement.setString(2, description);
                statement.setInt(3, Integer.parseInt(categoryId));
                statement.setString(4, imageURL);
                statement.setDouble(5, Double.parseDouble(price));
                statement.setString(6, isFeatured);
                statement.setInt(7, Integer.parseInt(id));
                statement.execute();
            }
            response.sendRedirect("product_list.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
