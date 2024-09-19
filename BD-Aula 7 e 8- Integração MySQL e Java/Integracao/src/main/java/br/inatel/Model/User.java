package br.inatel.Model;

public class User {

    String nome;

    String cpf;

    int id;

    public User(String nome, String cpf, int id){
        this.nome = nome;
        this.cpf = cpf;
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public String getCpf() {
        return cpf;
    }
}


