package br.inatel.DAO;

import br.inatel.Model.*;
import java.sql.*;
import java.util.ArrayList;

public class UserMateriaDAO extends ConnectionDAO { 

    public void testConnection(){
        connectToDb();
    }

    public boolean insertUserMateria(UserMateria userMateria){
        connectToDb();

        boolean sucesso;
        String sql = "INSERT INTO usuario_materia (usuario_id, materia_id) VALUES (?, ?)";
        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, userMateria.getIdUser());
            pst.setInt(2, userMateria.getIdMateria());
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

    public ArrayList<UserMateria> listarUsuarioMaterias() {
        connectToDb();
        ArrayList<UserMateria> lista = new ArrayList<>();

        String sql = """
            SELECT U.id AS user_id, U.nome AS nome_usuario, U.cpf AS cpf_usuario,
                M.id AS materia_id, M.nome AS nome_materia
            FROM usuario U
            JOIN usuario_materia UM ON U.id = UM.usuario_id
            JOIN materia M ON M.id = UM.materia_id;
        """;

        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            System.out.println("Lista de usuários:");
            while (rs.next()) { 
                String nomeUser = rs.getString("nome_usuario");
                String cpfUser = rs.getString("cpf_usuario");
                int idUser = rs.getInt("user_id");

                String nomeMateria = rs.getString("nome_materia");
                int idMateria = rs.getInt("materia_id");

                System.out.println("Nome: " + nomeUser + " - Materia: " + nomeMateria);

                User userAux = new User(nomeUser, cpfUser, idUser);
                Materia materiaAux = new Materia(nomeMateria, idMateria);
                UserMateria userMateriaAux = new UserMateria(userAux.getId(), materiaAux.getId());
                System.out.println("--------------------");

                lista.add(userMateriaAux);
            }
        } catch (SQLException exc) {
            System.out.println("Erro: " + exc.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (con != null) con.close();
            } catch (SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        }
        return lista;
    }
}
