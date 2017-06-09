package Dao;

import Pojo.Candidato;
import Pojo.Partido;
import Pojo.Votante;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author carlos
 */
public class Operaciones {

    public Operaciones() {

    }

    public Boolean altaVotante(SessionFactory SessionBuilder, Votante objvotante) {
        Boolean h;

        Session conexion = SessionBuilder.openSession();
        Transaction trans = null;

        try {
            trans = conexion.beginTransaction();
            conexion.save(objvotante);
            h = true;
            trans.commit();
        } catch (HibernateException ex) {
            h = false;
            if (trans != null) {
                trans.rollback();
            }
        } finally {
            conexion.close();
        }

        return h;
    }

    public Votante comprobarVotante(SessionFactory SessionBuilder, Votante objvotante) {
        Session conexion = SessionBuilder.openSession();

        Query q = conexion.createQuery("FROM Votante WHERE nif = :_nif AND pass = :_pass");
        q.setParameter("_nif", objvotante.getNif());
        q.setParameter("_pass", objvotante.getPass());

        List obj_votante = q.list();

        Votante votante_comp = new Votante();

        if (!obj_votante.isEmpty()) {
            votante_comp = (Votante) obj_votante.get(0);
        } else {
            votante_comp = null;
        }
        conexion.close();

        return votante_comp;
    }

    public Boolean bajaVotante(SessionFactory SessionBuilder, Votante objvotante) {
        Boolean h;

        Session conexion = SessionBuilder.openSession();
        Transaction trans = null;

        try {
            trans = conexion.beginTransaction();
            conexion.delete(conexion.merge(objvotante));

            trans.commit();
            h = true;
        } catch (HibernateException ex) {
            h = false;

            if (trans != null) {
                trans.rollback();
            }
        } finally {
            conexion.close();
        }

        return h;
    }

    public ArrayList<Partido> cogerPartidos(SessionFactory SessionBuilder) throws HibernateException {
        ArrayList<Partido> aPartidos = new ArrayList();

        Session conexion = SessionBuilder.openSession();
        Query q = conexion.createQuery("FROM Partido");

        List listPart = q.list();

        Iterator iter = listPart.iterator();
        while (iter.hasNext()) {
            Partido p1 = new Partido();
            p1 = (Partido) iter.next();
            aPartidos.add(p1);
        }
        conexion.close();

        return aPartidos;
    }

    public Boolean votar(SessionFactory SessionBuilder, Votante objvotante, String voto) {
        Boolean h;

        Session conexion = SessionBuilder.openSession();
        Query q = conexion.createQuery("FROM Partido WHERE nombre = :_nom");
        q.setParameter("_nom", voto);

        List partidoVotado = q.list();

        Partido partido_votado = new Partido();

        if (!partidoVotado.isEmpty()) {
            partido_votado = (Partido) partidoVotado.get(0);
            objvotante.setVotado("S");
            Integer sum = 1;
            partido_votado.setNumVotos(partido_votado.getNumVotos() + sum);
        } else {
            partido_votado = null;
        }

        Transaction trans = null;
        try {
            trans = conexion.beginTransaction();

            conexion.update(conexion.merge(partido_votado));
            conexion.update(conexion.merge(objvotante));

            trans.commit();
            h = true;
        } catch (HibernateException ex) {
            h = false;

            if (trans != null) {
                trans.rollback();
            }
        } finally {
            conexion.close();
        }

        return h;
    }

    public ArrayList<Votante> mostrarCenso(SessionFactory SessionBuilder) throws HibernateException {
        ArrayList<Votante> aVotantes = new ArrayList();

        Session conexion = SessionBuilder.openSession();
        Query q = conexion.createQuery("FROM Votante");

        List listVot = q.list();

        Iterator iter = listVot.iterator();
        while (iter.hasNext()) {
            Votante v1 = new Votante();
            v1 = (Votante) iter.next();
            aVotantes.add(v1);
        }

        return aVotantes;
    }

    public ArrayList<Partido> cogerPartidosOrden(SessionFactory SessionBuilder) throws HibernateException {
        ArrayList<Partido> aPartidos = new ArrayList();

        Session conexion = SessionBuilder.openSession();
        Query q = conexion.createQuery("FROM Partido p ORDER BY p.numVotos DESC");

        List listPart = q.list();

        Iterator iter = listPart.iterator();
        while (iter.hasNext()) {
            Partido p1 = new Partido();
            p1 = (Partido) iter.next();
            aPartidos.add(p1);
        }

        return aPartidos;
    }

    public int cogerTotalVotos(SessionFactory SessionBuilder) {
        Long sum;
        int totalVotos;

        Session conexion = SessionBuilder.openSession();
        Query q = conexion.createQuery("SELECT SUM(p.numVotos) FROM Partido p");

        List l = q.list();
        sum = (Long) l.get(0);
        totalVotos = sum.intValue();

        return totalVotos;
    }

    public int cogerTotalVotantes(SessionFactory SessionBuilder) {
        int totalVotantes;

        Session conexion = SessionBuilder.openSession();
        Query q = conexion.createQuery("SELECT COUNT(v.NIF) FROM Votante v");

        List l = q.list();
        totalVotantes = l.size();

        return totalVotantes;
    }

    public Boolean cambiarPassVotante(SessionFactory SessionBuilder, Votante votante_cambiar) {
        Boolean h;

        Session conexion = SessionBuilder.openSession();
        Transaction trans = null;

        try {
            trans = conexion.beginTransaction();
            conexion.update(conexion.merge(votante_cambiar));

            trans.commit();
            h = true;
        } catch (HibernateException ex) {
            h = false;

            if (trans != null) {
                trans.rollback();
            }
        } finally {
            conexion.close();
        }

        return h;
    }

    public ArrayList<Candidato> cogerCandidatos(SessionFactory SessionBuilder, ArrayList<Partido> aPartidosFin) {
        ArrayList<Candidato> aCandidatosFin = new ArrayList();
        for (int control = 0; control < 4; control++) {
            //El número de candidatos elegidos serán 4 con lo que la operación debe hacerse 4 veces.
            float votosMax = 0;
            Integer indicePartidoMax = 0;
            for (int pt = 0; pt < aPartidosFin.size(); pt++) {
                if (aPartidosFin.get(pt).getNumVotos() > votosMax) {
                    indicePartidoMax = pt;
                    votosMax = aPartidosFin.get(pt).getNumVotos();
                }
            }
            Candidato cnd = (Candidato) aPartidosFin.get(indicePartidoMax).getCandidatos().get(1);
            aCandidatosFin.add(cnd);
            aPartidosFin.get(indicePartidoMax).getCandidatos().remove(1);
            aPartidosFin.get(indicePartidoMax).setNumVotos((aPartidosFin.get(indicePartidoMax).getNumVotos()) / 2);
        }
        return aCandidatosFin;
    }

    public ArrayList<Candidato> asignarEscaño(SessionFactory SessionBuilder, ArrayList<Candidato> aCandidatos) {
        Session conexion = SessionBuilder.openSession();

        for (int i = 0; i < aCandidatos.size(); i++) {
            Query q = conexion.createQuery("FROM Candidato WHERE nombre = :_nom");
            q.setParameter("_nom", aCandidatos.get(i).getNombre());

            List candidato = q.list();

            Candidato candidatoEscaño = new Candidato();

            if (!candidato.isEmpty()) {
                candidatoEscaño = (Candidato) candidato.get(0);
                aCandidatos.get(i).setEscano("S");
                candidatoEscaño.setEscano("S");
            }
            
            Transaction trans = null;
            try {
                trans = conexion.beginTransaction();

                conexion.update(conexion.merge(candidatoEscaño));

                trans.commit();
            } catch (HibernateException ex) {

                if (trans != null) {
                    trans.rollback();
                }
            }
        }
        
        return aCandidatos;
    }
}
