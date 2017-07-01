package Persistence;

import Model.Media;
import Model.Movie;
import Model.Season;
import Model.Show;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;
import java.util.Set;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public class ShowDAO {

    private static Session session;
    private static SessionFactory sessionFactory;

    public ShowDAO(){
        sessionFactory = HibernateUtil.getSessionFactory();
        session = sessionFactory.openSession();
    }

    public static void registerShow(Show show){
        session.saveOrUpdate(show);
        session.getTransaction().commit();
    }

    public static Show getShow(int showid){
        Query query = session.createQuery("select s from Show s where s.id_show = :showid");
        query.setParameter("showid", showid);

        return (Show) query.getSingleResult();
    }
}
