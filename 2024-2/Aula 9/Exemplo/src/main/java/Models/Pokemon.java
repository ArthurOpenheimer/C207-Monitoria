package Models;

public class Pokemon {

    private int id;
    private String nome;
    private String habilidade;
    private String tipoUm;
    private String tipoDois;
    private boolean brilhante;

    public Pokemon(int id, String nome, String habilidade, String tipoUm, String tipoDois, boolean brilhante) {
        this.id = id;
        this.nome = nome;
        this.habilidade = habilidade;
        this.tipoUm = tipoUm;
        this.tipoDois = tipoDois;
        this.brilhante = brilhante;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getHabilidade() {
        return habilidade;
    }

    public String getTipoUm() {
        return tipoUm;
    }

    public String getTipoDois() {
        return tipoDois;
    }

    public boolean isBrilhante() {
        return brilhante;
    }

    @Override
    public String toString() {
        return "Pokemon{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", habilidade='" + habilidade + '\'' +
                ", tipoUm='" + tipoUm + '\'' +
                ", tipoDois='" + tipoDois + '\'' +
                ", brilhante=" + brilhante +
                '}';
    }
}
