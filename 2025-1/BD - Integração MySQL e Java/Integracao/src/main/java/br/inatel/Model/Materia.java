package br.inatel.Model;

public class Materia {
    
    String nome;
    int id;

    public Materia(String nome, int id){
        this.nome = nome;
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public int getId() {
        return id;
    }
}
