package br.inatel.DAO;

import br.inatel.Model.Materia;
import java.sql.SQLException;
import java.util.ArrayList;

public class MateriaDAO extends ConnectionDAO{

    public void testConnection(){
        connectToDb();
    }

    public boolean insertMateria(Materia materia){
        connectToDb();

        boolean sucesso;
        String sql = "INSERT INTO materia (nome) VALUES (?)";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, materia.getNome());
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

    public boolean updateMateria(int id, Materia materia){
        connectToDb();

        boolean sucesso;
        String sql = "UPDATE materia SET nome = ? WHERE id = ?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, materia.getNome());
            pst.setInt(2, id);
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

    public boolean deleteMateria(int id){
        connectToDb();

        boolean sucesso;
        String sql = "DELETE FROM materia WHERE id = ?";
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

    public ArrayList<Materia> selectMateria() {
        connectToDb();

        ArrayList<Materia> materias = new ArrayList<>();
        String sql = "SELECT * FROM usuario";
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            System.out.println("Lista de usuários:");
            while (rs.next()) {
                Materia materiaAux = new Materia(rs.getString("nome"), rs.getInt("id"));
                System.out.println("ID: " + materiaAux.getId() + " Nome: " + materiaAux.getNome());
                System.out.println("--------------------");
                materias.add(materiaAux);
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
        return materias;
    }
}

