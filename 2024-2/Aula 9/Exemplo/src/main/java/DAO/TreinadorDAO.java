package DAO;

import java.sql.SQLException;
import java.util.ArrayList;

import Models.Treinador;

public class TreinadorDAO extends ConnectionDAO {

    public void insertTreinador(Treinador t){
        connectToDb();
        String sql = "INSERT INTO Treinador (nome, numPokebola, numInsignia, dinheiro) VALUES (?, ?, ?, ?)";
        try{
            pst = con.prepareStatement(sql);
            pst.setString(1, t.getNome());
            pst.setInt(2, t.getNumPokebola());
            pst.setInt(3, t.getNumInsignia());
            pst.setString(4, t.getDinheiro());
            pst.execute();
            System.out.println("Treinador inserido com sucesso!");
        }catch(SQLException exc){
            System.out.println("Erro: " + exc.getMessage());
        }finally{
            try {
                con.close();
                pst.close();
            } catch (SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        }
    }

    public void updateTreinador(Treinador t){
        connectToDb();
        String sql = "UPDATE Treinador SET nome = ?, numPokebola = ?, numInsignia = ?, dinheiro = ? WHERE id = ?";
        try{
            pst = con.prepareStatement(sql);
            pst.setString(1, t.getNome());
            pst.setInt(2, t.getNumPokebola());
            pst.setInt(3, t.getNumInsignia());
            pst.setString(4, t.getDinheiro());
            pst.setInt(5, t.getId());
            pst.executeUpdate();
            System.out.println("Treinador atualizado com sucesso!");
        }catch(SQLException exc){
            System.out.println("Erro: " + exc.getMessage());
        }finally{
            try {
                con.close();
                pst.close();
            } catch (SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        }
    }

    public void deleteTreinador(int id){
        connectToDb();
        String sql = "DELETE FROM Treinador WHERE id = ?";
        try{
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.execute();
            System.out.println("Treinador deletado com sucesso!");
        }catch(SQLException exc){
            System.out.println("Erro: " + exc.getMessage());
        }finally{
            try {
                con.close();
                pst.close();
            } catch (SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        }
    }

    public ArrayList<Treinador> selectTreinador(){
        connectToDb();
        ArrayList<Treinador> treinadores = new ArrayList<>();

        String sql = "SELECT * FROM Treinador";
        try{
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Treinador tAux = new Treinador(rs.getInt("id"), rs.getString("nome"), rs.getInt("numPokebola"), rs.getInt("numInsignia"), rs.getString("dinheiro"));
                System.out.println(tAux.toString());
                System.out.println("-------------------------------------------------");
                treinadores.add(tAux);
                
            }
        }catch(SQLException exc){
            System.out.println("Erro: " + exc.getMessage());
        }finally{
            try {
                con.close();
                st.close();
                rs.close();
            } catch (SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        }
        return treinadores;
    }
}
