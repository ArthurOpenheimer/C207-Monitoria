package Models;

public class Treinador {

    private int id;
    private String nome;
    private int numPokebola;
    private int numInsignia;
    private String dinheiro;

    public Treinador(int id, String nome, int numPokebola, int numInsignia, String dinheiro) {
        this.id = id;
        this.nome = nome;
        this.numPokebola = numPokebola;
        this.numInsignia = numInsignia;
        this.dinheiro = dinheiro;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public int getNumPokebola() {
        return numPokebola;
    }

    public int getNumInsignia() {
        return numInsignia;
    }

    public String getDinheiro() {
        return dinheiro;
    }

    @Override
    public String toString() {
        return "Treinador{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", numPokebola=" + numPokebola +
                ", numInsignia=" + numInsignia +
                ", dinheiro='" + dinheiro + '\'' +
                '}';
    }
}
