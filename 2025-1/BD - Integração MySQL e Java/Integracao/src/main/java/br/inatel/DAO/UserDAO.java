package br.inatel.DAO;

import br.inatel.Model.User;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO extends ConnectionDAO{

    public void testConnection(){
        connectToDb();
    }

    public boolean insertUser(User user){
        connectToDb();

        boolean sucesso;
        String sql = "INSERT INTO usuario (nome, cpf) VALUES (?, ?)";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, user.getNome());
            pst.setString(2, user.getCpf());
            pst.execute();
            sucesso = true;

        } catch (SQLException exc) {
            System.out.println("Erro: " + exc.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                pst.close();
            } catch (SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        } 
        return sucesso;
    }

    public boolean updateUser(int id, User user){
        connectToDb();

        boolean sucesso;
        String sql = "UPDATE usuario SET nome = ?, cpf = ? WHERE id = ?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, user.getNome());
            pst.setString(2, user.getCpf());
            pst.setInt(3, id);
            pst.execute();
            sucesso = true;

        } catch (SQLException exc) {
            System.out.println("Erro: " + exc.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                pst.close();
            } catch (SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        } 
        return sucesso;
    }

    public boolean deleteUser(int id){
        connectToDb();

        boolean sucesso;
        String sql = "DELETE FROM usuario WHERE id = ?";
        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.execute();
            sucesso = true;

        } catch (SQLException exc) {
            System.out.println("Erro: " + exc.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                pst.close();
            } catch (SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        } 
        return sucesso;
    }

    public ArrayList<User> selectUser() {
        connectToDb();

        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM usuario";
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            System.out.println("Lista de usuários:");
            while (rs.next()) {
                User userAux = new User(rs.getString("nome"), rs.getString("cpf"), rs.getInt("id"));
                System.out.println("ID: " + userAux.getId() + " Nome: " + userAux.getNome() + " CPF: " + userAux.getCpf());
                System.out.println("--------------------");
                users.add(userAux);
            }

        } catch (SQLException exc) {
            System.out.println("Erro: " + exc.getMessage());
        } finally {
            try {
                con.close();
                st.close();
                rs.close();
            } catch (SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        }
        return users;
    }
}

