package br.inatel.Model;

public class UserMateria {
    private int idUsuario;
    private int idMateria;


    public UserMateria(int idUsuario, int idMateria) {
        this.idUsuario = idUsuario;
        this.idMateria = idMateria;
    }

    public int getIdUser() {
        return idUsuario;
    }

    public int getIdMateria() {
        return idMateria;
    }
}