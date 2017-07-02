package persistence;

import model.Season;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public class SeasonDAO {
    private static Session session;
    private static SessionFactory sessionFactory;

    public SeasonDAO(){
        sessionFactory = HibernateUtil.getSessionFactory();
        session = sessionFactory.openSession();
    }

    public static void registerSeason(Season season){
        session.saveOrUpdate(season);
        session.getTransaction().commit();
    }

    public static Season getSeason(int seasonid){
        Query query = session.createQuery("select s from Season s where s.id_season = :seasonid");
        query.setParameter("seasonid", seasonid);

        return (Season) query.getSingleResult();
    }

}
