package DAO;
import java.sql.SQLException;

import Models.Pokemon;
import java.util.ArrayList;

public class PokemonDAO extends ConnectionDAO{
    
    public void insertPokemon(Pokemon p){
        connectToDb();
        String sql = "INSERT INTO Pokemon (nome, habilidade, tipoUm, tipoDois, brilhante) VALUES (?, ?, ?, ?, ?)";
        try{
            pst = con.prepareStatement(sql);
            pst.setString(1, p.getNome());
            pst.setString(2, p.getHabilidade());
            pst.setString(3, p.getTipoUm());
            pst.setString(4, p.getTipoDois());
            pst.setBoolean(5, p.isBrilhante());
            pst.execute();
            System.out.println("Pokemon inserido com sucesso!");
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
    
    public void updatePokemon(Pokemon p){
        connectToDb();
        String sql = "UPDATE Pokemon SET nome = ?, habilidade = ?, tipoUm = ?, tipoDois = ?, brilhante = ? WHERE id = ?";
        try{
            pst = con.prepareStatement(sql);
            pst.setString(1, p.getNome());
            pst.setString(2, p.getHabilidade());
            pst.setString(3, p.getTipoUm());
            pst.setString(4, p.getTipoDois());
            pst.setBoolean(5, p.isBrilhante());
            pst.setInt(6, p.getId());
            pst.executeUpdate();
            System.out.println("Pokemon atualizado com sucesso!");
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
    
    public void deletePokemon(int id){
        connectToDb();
        String sql = "DELETE FROM Pokemon WHERE id = ?";
        try{
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.execute();
            System.out.println("Pokemon deletado com sucesso!");
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
    
    public ArrayList<Pokemon> selectPokemon(){
        connectToDb();
        ArrayList<Pokemon> pokemons = new ArrayList<>();

        String sql = "SELECT * FROM Pokemon";
        try{
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Pokemon pAux = new Pokemon(rs.getInt("id"), rs.getString("nome"), rs.getString("habilidade"), rs.getString("tipoUm"), rs.getString("tipoDois"), rs.getBoolean("brilhante"));
                System.out.println(pAux.toString());
                System.out.println("-------------------------------------------------");
                pokemons.add(pAux);
                
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
        return pokemons;
    }
}
