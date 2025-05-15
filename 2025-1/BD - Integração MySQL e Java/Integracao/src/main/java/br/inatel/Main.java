package br.inatel;

import br.inatel.DAO.*;
import br.inatel.Model.*;

public class Main {

    public static void main(String[] args) {

        UserDAO userDAO = new UserDAO();

        User u1 = new User("Lucas", "123456");
        User u2 = new User("Ana", "654321");
        User u3 = new User("Carlos", "789012");

        userDAO.insertUser(u1);
        userDAO.insertUser(u2);
        userDAO.insertUser(u3);

        userDAO.updateUser(1, new User("Lucas Silva", "123456789"));

        userDAO.deleteUser(2);
        
        userDAO.selectUser();


        MateriaDAO materiaDAO = new MateriaDAO();

        Materia m1 = new Materia("Matematica", 1);
        Materia m2 = new Materia("Portugues", 2);
        Materia m3 = new Materia("Historia", 3);

        materiaDAO.insertMateria(m1);
        materiaDAO.insertMateria(m2);
        materiaDAO.insertMateria(m3);

        materiaDAO.updateMateria(1, new Materia("Matematica Avancada", 1));
        materiaDAO.deleteMateria(2);

        materiaDAO.selectMateria();


        UserMateriaDAO userMateriaDAO = new UserMateriaDAO();

        UserMateria userMateria1 = new UserMateria(1, 1);
        UserMateria userMateria2 = new UserMateria(1, 3);

        UserMateria userMateria3 = new UserMateria(2, 1);
        UserMateria userMateria4 = new UserMateria(2, 3);

        UserMateria userMateria5 = new UserMateria(3, 1);
        UserMateria userMateria6 = new UserMateria(3, 3);

        userMateriaDAO.insertUserMateria(userMateria1);
        userMateriaDAO.insertUserMateria(userMateria2);
        userMateriaDAO.insertUserMateria(userMateria3);
        userMateriaDAO.insertUserMateria(userMateria4);
        userMateriaDAO.insertUserMateria(userMateria5);
        userMateriaDAO.insertUserMateria(userMateria6);

        userMateriaDAO.listarUsuarioMaterias();
    }
}


