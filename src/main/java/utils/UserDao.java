package utils;

import entity.User;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao {
    private static final String ADD_USER_QUERY = "INSERT INTO users (email, username, password) VALUES (?, ?, ?);";
    private static final String SHOW_USER_QUERY = "SELECT * FROM users WHERE id = ?;";
    private static final String MODIFY_USER_QUERY = "UPDATE users SET email = ?, username = ?, password = ? WHERE id = ?;";
    private static final String DELETE_USER_QUERY = "DELETE FROM users WHERE id = ?;";
    private static final String SHOW_ALL_USERS_QUERY = "SELECT * FROM users;";

    public User create(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(ADD_USER_QUERY, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getUsername());
            ps.setString(3, hashPassword(user.getPassword()));
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                user.setId(id);
            }
            return user;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public User read(int userId) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(SHOW_USER_QUERY);
            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                User user = new User();
                if (rs.next()) {
                    user.setEmail(rs.getString("email"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setId(userId);
                    return user;
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void update(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(MODIFY_USER_QUERY);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getUsername());
            ps.setString(3, hashPassword(user.getPassword()));
            ps.setInt(4, user.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void delete(int userId) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(DELETE_USER_QUERY);
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<User> findAll() {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(SHOW_ALL_USERS_QUERY);
            try (ResultSet rs = ps.executeQuery()) {
                ArrayList<User> users = new ArrayList<>();
                while (rs.next()) {
                    users.add(read(rs.getInt("id")));
                }
                return users;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
